using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading;
using LibreHardwareMonitor.Hardware;

// 8-thread integer load with 1 Hz LibreHardwareMonitor sampling.
// Usage: WinLoad.exe <out.csv> <load_seconds> <idle_seconds> <label>
class WinLoad
{
    static volatile bool _stop;
    static long _iters;
    static int _threads = 8;

    static void Worker()
    {
        ulong x = 0x9E3779B97F4A7C15UL + (ulong)Thread.CurrentThread.ManagedThreadId * 0x100000001B3UL;
        long it = 0;
        while (!_stop)
        {
            for (int i = 0; i < 2000000; i++)
            {
                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;
            }
            it += 2000000;
        }
        Interlocked.Add(ref _iters, it);
        GC.KeepAlive(x);
    }

    static float? Find(IHardware hw, SensorType type, string name)
    {
        foreach (var s in hw.Sensors)
            if (s.SensorType == type && s.Name == name)
                return s.Value;
        return null;
    }

    static float? MaxClock(IHardware hw)
    {
        float? best = null;
        foreach (var s in hw.Sensors)
            if (s.SensorType == SensorType.Clock && s.Name.StartsWith("CPU Core #"))
                if (s.Value.HasValue && (!best.HasValue || s.Value > best))
                    best = s.Value;
        return best;
    }

    static string F(float? v)
    {
        return v.HasValue ? v.Value.ToString("0.###", CultureInfo.InvariantCulture) : "";
    }

    static void Main(string[] args)
    {
        string outPath = args.Length > 0 ? args[0] : "winload.csv";
        double loadSec = args.Length > 1 ? double.Parse(args[1], CultureInfo.InvariantCulture) : 60;
        double idleSec = args.Length > 2 ? double.Parse(args[2], CultureInfo.InvariantCulture) : 5;
        string label = args.Length > 3 ? args[3] : "";
        double sampleMs = args.Length > 4 ? double.Parse(args[4], CultureInfo.InvariantCulture) : 1000;
        double sampleSec = sampleMs / 1000.0;

        var computer = new Computer { IsCpuEnabled = true, IsMotherboardEnabled = true };
        computer.Open();
        IHardware cpu = computer.Hardware.FirstOrDefault(h => h.HardwareType == HardwareType.Cpu);
        if (cpu == null) { Console.Error.WriteLine("no CPU hardware"); return; }

        using (var w = new StreamWriter(outPath))
        {
            w.WriteLine("epoch_ms,iso,label,phase,power_pkg_w,temp_pkg_c,temp_coremax_c,load_cpu_pct,clk_coremax_mhz");
            w.Flush();

            var sw = Stopwatch.StartNew();
            var last = -1.0;
            bool started = false;

            while (true)
            {
                double el = sw.Elapsed.TotalSeconds;
                if (!started && el >= idleSec)
                {
                    started = true;
                    _stop = false;
                    for (int i = 0; i < _threads; i++)
                    {
                        var t = new Thread(Worker) { IsBackground = true };
                        t.Start();
                    }
                }
                if (started && el >= idleSec + loadSec) break;

                if (el - last >= sampleSec)
                {
                    last = el;
                    var now = DateTimeOffset.UtcNow;
                    var phase = started ? "load" : "idle";
                    cpu.Update();
                    w.WriteLine(string.Join(",",
                        now.ToUnixTimeMilliseconds().ToString(CultureInfo.InvariantCulture),
                        now.ToString("o", CultureInfo.InvariantCulture),
                        label, phase,
                        F(Find(cpu, SensorType.Power, "CPU Package")),
                        F(Find(cpu, SensorType.Temperature, "CPU Package")),
                        F(Find(cpu, SensorType.Temperature, "Core Max")),
                        F(Find(cpu, SensorType.Load, "CPU Total")),
                        F(MaxClock(cpu))));
                    w.Flush();
                }
                Thread.Sleep((int)Math.Max(1, Math.Min(100, sampleMs)));
            }

            _stop = true;
            Thread.Sleep(500);
            Console.WriteLine("label={0} iterations={1}", label, Interlocked.Read(ref _iters));
        }
        computer.Close();
    }
}


