/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20251212 (64-bit version)
 * Copyright (c) 2000 - 2025 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ssdt2.dat
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00005D92 (23954)
 *     Revision         0x02
 *     Checksum         0x6F
 *     OEM ID           "DptfTb"
 *     OEM Table ID     "DptfTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20191018 (538513432)
 */
DefinitionBlock ("", "SSDT", 2, "DptfTb", "DptfTabl", 0x00001000)
{
    External (_SB_.AAC0, FieldUnitObj)
    External (_SB_.ACRT, FieldUnitObj)
    External (_SB_.APSV, FieldUnitObj)
    External (_SB_.CBMI, FieldUnitObj)
    External (_SB_.CFGD, FieldUnitObj)
    External (_SB_.CLVL, FieldUnitObj)
    External (_SB_.CPPC, FieldUnitObj)
    External (_SB_.CTC0, FieldUnitObj)
    External (_SB_.CTC1, FieldUnitObj)
    External (_SB_.CTC2, FieldUnitObj)
    External (_SB_.OSCP, IntObj)
    External (_SB_.PAGD, DeviceObj)
    External (_SB_.PAGD._PUR, PkgObj)
    External (_SB_.PAGD._STA, MethodObj)    // 0 Arguments
    External (_SB_.PC00, DeviceObj)
    External (_SB_.PC00.LPCB.EC0_, DeviceObj)
    External (_SB_.PC00.LPCB.EC0_.EC34, MethodObj)    // 0 Arguments
    External (_SB_.PC00.LPCB.EC0_.EC44, MethodObj)    // 3 Arguments
    External (_SB_.PC00.LPCB.EC0_.EC50, MethodObj)    // 1 Arguments
    External (_SB_.PC00.LPCB.EC0_.EC88, MethodObj)    // 4 Arguments
    External (_SB_.PC00.LPCB.EC0_.ECAV, IntObj)
    External (_SB_.PC00.LPCB.EC0_.PBOK, FieldUnitObj)
    External (_SB_.PC00.LPCB.EC0_.UVTH, FieldUnitObj)
    External (_SB_.PC00.LPCB.ECST, IntObj)
    External (_SB_.PC00.MHBR, FieldUnitObj)
    External (_SB_.PC00.TCPU, DeviceObj)
    External (_SB_.PL10, FieldUnitObj)
    External (_SB_.PL11, FieldUnitObj)
    External (_SB_.PL12, FieldUnitObj)
    External (_SB_.PL20, FieldUnitObj)
    External (_SB_.PL21, FieldUnitObj)
    External (_SB_.PL22, FieldUnitObj)
    External (_SB_.PLW0, FieldUnitObj)
    External (_SB_.PLW1, FieldUnitObj)
    External (_SB_.PLW2, FieldUnitObj)
    External (_SB_.PR00, ProcessorObj)
    External (_SB_.PR00._PSS, MethodObj)    // 0 Arguments
    External (_SB_.PR00._TPC, IntObj)
    External (_SB_.PR00._TSD, MethodObj)    // 0 Arguments
    External (_SB_.PR00._TSS, MethodObj)    // 0 Arguments
    External (_SB_.PR00.LPSS, PkgObj)
    External (_SB_.PR00.TPSS, PkgObj)
    External (_SB_.PR00.TSMC, PkgObj)
    External (_SB_.PR00.TSMF, PkgObj)
    External (_SB_.PR01, ProcessorObj)
    External (_SB_.PR02, ProcessorObj)
    External (_SB_.PR03, ProcessorObj)
    External (_SB_.PR04, ProcessorObj)
    External (_SB_.PR05, ProcessorObj)
    External (_SB_.PR06, ProcessorObj)
    External (_SB_.PR07, ProcessorObj)
    External (_SB_.PR08, ProcessorObj)
    External (_SB_.PR09, ProcessorObj)
    External (_SB_.PR10, ProcessorObj)
    External (_SB_.PR11, ProcessorObj)
    External (_SB_.PR12, ProcessorObj)
    External (_SB_.PR13, ProcessorObj)
    External (_SB_.PR14, ProcessorObj)
    External (_SB_.PR15, ProcessorObj)
    External (_SB_.SLPB, DeviceObj)
    External (_SB_.TAR0, FieldUnitObj)
    External (_SB_.TAR1, FieldUnitObj)
    External (_SB_.TAR2, FieldUnitObj)
    External (_TZ_.ETMD, IntObj)
    External (_TZ_.FAN0, DeviceObj)
    External (_TZ_.FAN0._FST, PkgObj)
    External (_TZ_.TZ00, ThermalZoneObj)
    External (ACTT, IntObj)
    External (ATPC, IntObj)
    External (BATR, IntObj)
    External (CHGE, IntObj)
    External (CRTT, IntObj)
    External (DCFE, IntObj)
    External (DDPS, IntObj)
    External (DMD0, FieldUnitObj)
    External (DPTF, IntObj)
    External (DPVA, FieldUnitObj)
    External (DPVS, FieldUnitObj)
    External (ECON, IntObj)
    External (FND1, IntObj)
    External (HIDW, MethodObj)    // 4 Arguments
    External (HIWC, MethodObj)    // 1 Arguments
    External (IN34, IntObj)
    External (IPCS, MethodObj)    // 7 Arguments
    External (ODV0, IntObj)
    External (ODV1, IntObj)
    External (ODV2, IntObj)
    External (ODV3, IntObj)
    External (ODV4, IntObj)
    External (ODV5, IntObj)
    External (PCHE, FieldUnitObj)
    External (PF00, IntObj)
    External (PNHM, IntObj)
    External (PPPR, IntObj)
    External (PPSZ, IntObj)
    External (PSVM, IntObj)
    External (PSVT, IntObj)
    External (PTPC, IntObj)
    External (PWRE, IntObj)
    External (PWRS, IntObj)
    External (S0ID, FieldUnitObj)
    External (S0IX, IntObj)
    External (S1DE, IntObj)
    External (S2DE, IntObj)
    External (S3DE, IntObj)
    External (S4DE, IntObj)
    External (S5DE, IntObj)
    External (SADE, IntObj)
    External (SSP1, IntObj)
    External (SSP2, IntObj)
    External (SSP3, IntObj)
    External (SSP4, IntObj)
    External (SSP5, IntObj)
    External (TCNT, IntObj)
    External (THPN, IntObj)
    External (TSOD, IntObj)
    External (UAMS, IntObj)

    Scope (\_SB)
    {
        Device (IETM)
        {
            OperationRegion (DPPT, SystemMemory, DPVA, DPVS)
            Field (DPPT, AnyAcc, Lock, Preserve)
            {
                P000,   8, 
                P001,   8, 
                P002,   8, 
                P003,   8, 
                P004,   8, 
                P005,   8, 
                P006,   8, 
                P007,   8, 
                P008,   8, 
                P009,   8, 
                P010,   8, 
                P011,   8, 
                P012,   8, 
                P013,   8, 
                P014,   8, 
                P015,   8, 
                P016,   8, 
                P017,   8, 
                P018,   8, 
                P019,   8, 
                P020,   8, 
                P021,   8, 
                P022,   8, 
                P023,   8, 
                P024,   8, 
                P025,   8, 
                P026,   8, 
                P027,   8, 
                P028,   8, 
                P029,   8, 
                P030,   8, 
                P031,   8, 
                P032,   8, 
                P033,   8, 
                P034,   8, 
                P035,   8, 
                P036,   8, 
                P037,   8, 
                P038,   8, 
                P039,   8, 
                P040,   8, 
                P041,   8, 
                P042,   8, 
                P043,   8, 
                P044,   8, 
                P045,   8, 
                P046,   8, 
                P047,   8, 
                P048,   8, 
                P049,   8, 
                P050,   8, 
                P051,   8, 
                P052,   8, 
                P053,   8, 
                P054,   8, 
                P055,   8, 
                P056,   8, 
                P057,   8, 
                P058,   8, 
                P059,   8, 
                P060,   8, 
                P061,   8, 
                P062,   8, 
                P063,   8, 
                P064,   8, 
                P065,   8, 
                P066,   8, 
                P067,   8, 
                P068,   8, 
                P069,   8, 
                P070,   8, 
                P071,   8, 
                P072,   8, 
                P073,   8, 
                P074,   8, 
                P075,   8, 
                P076,   8, 
                P077,   8, 
                P078,   8, 
                P079,   8, 
                P080,   8, 
                P081,   8, 
                P082,   8, 
                P083,   8, 
                P084,   8, 
                P085,   8, 
                P086,   8, 
                P087,   8, 
                P088,   8, 
                P089,   8, 
                P090,   8, 
                P091,   8, 
                P092,   8, 
                P093,   8, 
                P094,   8, 
                P095,   8, 
                P096,   8, 
                P097,   8, 
                P098,   32, 
                P099,   8, 
                P100,   8, 
                P101,   16, 
                P102,   16, 
                P103,   8, 
                P104,   16, 
                P105,   16, 
                P106,   8, 
                P107,   8, 
                P108,   8, 
                P109,   8, 
                P110,   8, 
                P111,   8, 
                P112,   8, 
                P113,   8, 
                P114,   8, 
                P115,   8, 
                P116,   8, 
                P117,   8, 
                P118,   8, 
                P119,   8, 
                P120,   8, 
                P121,   8, 
                P122,   8, 
                P123,   8, 
                P124,   8, 
                P125,   8, 
                P126,   8, 
                P127,   8, 
                P128,   8, 
                P129,   8, 
                P130,   8, 
                P131,   8, 
                P132,   8, 
                P133,   8, 
                P134,   8, 
                P135,   8, 
                P136,   8, 
                P137,   8, 
                P138,   8, 
                P139,   8, 
                P140,   8, 
                P141,   8, 
                P142,   8, 
                P143,   8, 
                P144,   8, 
                P145,   8, 
                P146,   8, 
                P147,   8, 
                P148,   8, 
                P149,   8, 
                P150,   8, 
                P151,   8, 
                P152,   8, 
                P153,   8, 
                P154,   8, 
                P155,   8, 
                P156,   8, 
                P157,   8, 
                P158,   8, 
                P159,   8, 
                P160,   8, 
                P161,   8, 
                P162,   8, 
                P163,   8, 
                P164,   8, 
                P165,   8, 
                P166,   8
            }

            Name (_HID, "INTC1040")  // _HID: Hardware ID
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (CondRefOf (HIWC))
                {
                    If (HIWC (Arg0))
                    {
                        If (CondRefOf (HIDW))
                        {
                            Return (HIDW (Arg0, Arg1, Arg2, Arg3))
                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((\DPTF == One) && (\IN34 == One)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (PTRP, Zero)
            Name (PSEM, Zero)
            Name (ATRP, Zero)
            Name (ASEM, Zero)
            Name (YTRP, Zero)
            Name (YSEM, Zero)
            Method (_OSC, 4, Serialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, STS1)
                CreateDWordField (Arg3, 0x04, CAP1)
                If ((Arg1 != One))
                {
                    STS1 &= 0xFFFFFF00
                    STS1 |= 0x0A
                    Return (Arg3)
                }

                If ((Arg2 != 0x02))
                {
                    STS1 &= 0xFFFFFF00
                    STS1 |= 0x02
                    Return (Arg3)
                }

                If (CondRefOf (\_SB.APSV))
                {
                    If ((PSEM == Zero))
                    {
                        PSEM = One
                        PTRP = \_SB.APSV /* External reference */
                    }
                }

                If (CondRefOf (\_SB.AAC0))
                {
                    If ((ASEM == Zero))
                    {
                        ASEM = One
                        ATRP = \_SB.AAC0 /* External reference */
                    }
                }

                If (CondRefOf (\_SB.ACRT))
                {
                    If ((YSEM == Zero))
                    {
                        YSEM = One
                        YTRP = \_SB.ACRT /* External reference */
                    }
                }

                If ((Arg0 == ToUUID ("b23ba85d-c8b7-3542-88de-8de2ffcfd698") /* Unknown UUID */))
                {
                    If (~(STS1 & One))
                    {
                        If ((CAP1 & One))
                        {
                            If ((CAP1 & 0x02))
                            {
                                \_SB.AAC0 = 0x6E
                                \_SB.PC00.LPCB.EC0.SEFM (One)
                            }
                            Else
                            {
                                \_SB.AAC0 = ATRP /* \_SB_.IETM.ATRP */
                                \_SB.PC00.LPCB.EC0.SEFM (Zero)
                            }

                            If ((CAP1 & 0x04))
                            {
                                \_SB.APSV = 0x6E
                                \_SB.PC00.LPCB.EC0.SEPL (Zero)
                                \_SB.PC00.TCPU.TDPL ()
                            }
                            Else
                            {
                                \_SB.APSV = PTRP /* \_SB_.IETM.PTRP */
                                \_SB.PC00.LPCB.EC0.SEPL (One)
                            }

                            If ((CAP1 & 0x08))
                            {
                                \_SB.ACRT = 0xD2
                                \_TZ.ETMD = Zero
                            }
                            Else
                            {
                                \_SB.ACRT = YTRP /* \_SB_.IETM.YTRP */
                                \_TZ.ETMD = One
                            }
                        }
                        Else
                        {
                            \_SB.ACRT = YTRP /* \_SB_.IETM.YTRP */
                            \_SB.APSV = PTRP /* \_SB_.IETM.PTRP */
                            \_SB.AAC0 = ATRP /* \_SB_.IETM.ATRP */
                            \_TZ.ETMD = One
                        }

                        If (CondRefOf (\_TZ.TZ00))
                        {
                            Notify (\_TZ.TZ00, 0x81) // Information Change
                        }
                    }

                    Return (Arg3)
                }

                Return (Arg3)
            }

            Method (DCFG, 0, NotSerialized)
            {
                Return (\DCFE) /* External reference */
            }

            Name (ODVX, Package (0x06)
            {
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero
            })
            Method (ODVP, 0, Serialized)
            {
                If ((\S0IX == 0x03))
                {
                    ODVX [Zero] = 0x07
                }
                Else
                {
                    ODVX [Zero] = DMD0 /* External reference */
                }

                ODVX [One] = \PSVM /* External reference */
                ODVX [0x02] = \ODV2 /* External reference */
                ODVX [0x03] = \ODV3 /* External reference */
                ODVX [0x04] = \ODV4 /* External reference */
                ODVX [0x05] = \ODV5 /* External reference */
                Return (ODVX) /* \_SB_.IETM.ODVX */
            }

            Method (CETP, 1, Serialized)
            {
                If ((Arg0 & One)){}
                If ((Arg0 & 0x02))
                {
                    Notify (\_SB.IETM, 0x88) // Device-Specific
                }
            }
        }
    }

    Scope (\_SB.PC00.LPCB.EC0)
    {
        Mutex (PATM, 0x00)
        Method (_QA1, 0, Serialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            Local0 = TSSR ()
            While (Local0)
            {
                \_SB.PC00.LPCB.EC0.EC44 (0x6E, Local0, Zero)
                If ((Local0 & 0x04))
                {
                    Notify (\_SB.PC00.LPCB.EC0.SEN1, 0x90) // Device-Specific
                }

                If ((Local0 & One))
                {
                    Notify (\_SB.PC00.LPCB.EC0.SEN2, 0x90) // Device-Specific
                }

                If ((Local0 & 0x02))
                {
                    Notify (\_SB.PC00.LPCB.EC0.SEN3, 0x90) // Device-Specific
                }

                If ((Local0 & 0x08))
                {
                    Notify (\_SB.PC00.LPCB.EC0.SEN4, 0x90) // Device-Specific
                }

                If ((Local0 & 0x10))
                {
                    Notify (\_SB.PC00.LPCB.EC0.SEN5, 0x90) // Device-Specific
                }

                If ((Local0 & 0x20))
                {
                    Notify (\_SB.PC00.LPCB.EC0.SEN6, 0x90) // Device-Specific
                }

                If ((Local0 & 0x40))
                {
                    Notify (\_SB.PC00.LPCB.EC0.SEN7, 0x90) // Device-Specific
                }

                Local0 = TSSR ()
            }
        }
    }

    Scope (\_SB.PC00.LPCB.EC0)
    {
        Device (TFN1)
        {
            Name (_HID, "INTC1044")  // _HID: Hardware ID
            Name (_UID, "TFN1")  // _UID: Unique ID
            Name (_STR, Unicode ("Fan 1"))  // _STR: Description String
            Name (PTYP, 0x04)
            Name (FON, One)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_SB.IETM.P015 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_FIF, 0, NotSerialized)  // _FIF: Fan Information
            {
                Return (Package (0x04)
                {
                    Zero, 
                    One, 
                    0x02, 
                    Zero
                })
            }

            Method (_FPS, 0, NotSerialized)  // _FPS: Fan Performance States
            {
                Return (Package (0x0D)
                {
                    Zero, 
                    Package (0x05)
                    {
                        0x64, 
                        0xFFFFFFFF, 
                        0x2EE0, 
                        0x01F4, 
                        0x1388
                    }, 

                    Package (0x05)
                    {
                        0x5F, 
                        0xFFFFFFFF, 
                        0x2D50, 
                        0x01DB, 
                        0x128E
                    }, 

                    Package (0x05)
                    {
                        0x5A, 
                        0xFFFFFFFF, 
                        0x2BC0, 
                        0x01C2, 
                        0x1194
                    }, 

                    Package (0x05)
                    {
                        0x55, 
                        0xFFFFFFFF, 
                        0x2904, 
                        0x01A9, 
                        0x109A
                    }, 

                    Package (0x05)
                    {
                        0x50, 
                        0xFFFFFFFF, 
                        0x2648, 
                        0x0190, 
                        0x0FA0
                    }, 

                    Package (0x05)
                    {
                        0x46, 
                        0xFFFFFFFF, 
                        0x2454, 
                        0x015E, 
                        0x0DAC
                    }, 

                    Package (0x05)
                    {
                        0x3C, 
                        0xFFFFFFFF, 
                        0x1CE8, 
                        0x012C, 
                        0x0BB8
                    }, 

                    Package (0x05)
                    {
                        0x32, 
                        0xFFFFFFFF, 
                        0x189C, 
                        0xFA, 
                        0x09C4
                    }, 

                    Package (0x05)
                    {
                        0x28, 
                        0xFFFFFFFF, 
                        0x13EC, 
                        0xC8, 
                        0x07D0
                    }, 

                    Package (0x05)
                    {
                        0x1E, 
                        0xFFFFFFFF, 
                        0x0ED8, 
                        0x96, 
                        0x05DC
                    }, 

                    Package (0x05)
                    {
                        0x19, 
                        0xFFFFFFFF, 
                        0x0C80, 
                        0x7D, 
                        0x04E2
                    }, 

                    Package (0x05)
                    {
                        Zero, 
                        0xFFFFFFFF, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }

            Method (_FSL, 1, Serialized)  // _FSL: Fan Set Level
            {
                If (\_SB.PC00.LPCB.EC0.ECAV ())
                {
                    \_SB.PC00.LPCB.EC0.SEFD (Arg0, One)
                    If (CondRefOf (\_TZ.FAN0._FST))
                    {
                        \_TZ.FAN0._FST [One] = Arg0
                        Notify (\_TZ.FAN0, 0x80) // Status Change
                    }
                }
            }

            Name (TFST, Package (0x03)
            {
                Zero, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            })
            Method (_FST, 0, Serialized)  // _FST: Fan Status
            {
                If (\_SB.PC00.LPCB.EC0.ECAV ())
                {
                    TFST [One] = \_SB.PC00.LPCB.EC0.PEN1
                }

                Return (TFST) /* \_SB_.PC00.LPCB.EC0_.TFN1.TFST */
            }
        }
    }

    Scope (\_SB.PC00.LPCB.EC0)
    {
        Device (TFN2)
        {
            Name (_HID, "INTC1044")  // _HID: Hardware ID
            Name (_UID, "TFN2")  // _UID: Unique ID
            Name (_STR, Unicode ("Fan 1"))  // _STR: Description String
            Name (PTYP, 0x04)
            Name (FON, One)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_SB.IETM.P056 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_FIF, 0, NotSerialized)  // _FIF: Fan Information
            {
                Return (Package (0x04)
                {
                    Zero, 
                    One, 
                    0x02, 
                    Zero
                })
            }

            Method (_FPS, 0, NotSerialized)  // _FPS: Fan Performance States
            {
                Return (Package (0x0D)
                {
                    Zero, 
                    Package (0x05)
                    {
                        0x64, 
                        0xFFFFFFFF, 
                        0x2EE0, 
                        0x01F4, 
                        0x1388
                    }, 

                    Package (0x05)
                    {
                        0x5F, 
                        0xFFFFFFFF, 
                        0x2D50, 
                        0x01DB, 
                        0x128E
                    }, 

                    Package (0x05)
                    {
                        0x5A, 
                        0xFFFFFFFF, 
                        0x2BC0, 
                        0x01C2, 
                        0x1194
                    }, 

                    Package (0x05)
                    {
                        0x55, 
                        0xFFFFFFFF, 
                        0x2904, 
                        0x01A9, 
                        0x109A
                    }, 

                    Package (0x05)
                    {
                        0x50, 
                        0xFFFFFFFF, 
                        0x2648, 
                        0x0190, 
                        0x0FA0
                    }, 

                    Package (0x05)
                    {
                        0x46, 
                        0xFFFFFFFF, 
                        0x2454, 
                        0x015E, 
                        0x0DAC
                    }, 

                    Package (0x05)
                    {
                        0x3C, 
                        0xFFFFFFFF, 
                        0x1CE8, 
                        0x012C, 
                        0x0BB8
                    }, 

                    Package (0x05)
                    {
                        0x32, 
                        0xFFFFFFFF, 
                        0x189C, 
                        0xFA, 
                        0x09C4
                    }, 

                    Package (0x05)
                    {
                        0x28, 
                        0xFFFFFFFF, 
                        0x13EC, 
                        0xC8, 
                        0x07D0
                    }, 

                    Package (0x05)
                    {
                        0x1E, 
                        0xFFFFFFFF, 
                        0x0ED8, 
                        0x96, 
                        0x05DC
                    }, 

                    Package (0x05)
                    {
                        0x19, 
                        0xFFFFFFFF, 
                        0x0C80, 
                        0x7D, 
                        0x04E2
                    }, 

                    Package (0x05)
                    {
                        Zero, 
                        0xFFFFFFFF, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }

            Method (_FSL, 1, Serialized)  // _FSL: Fan Set Level
            {
                If (\_SB.PC00.LPCB.EC0.ECAV ())
                {
                    \_SB.PC00.LPCB.EC0.SEFD (Arg0, 0x02)
                    If (CondRefOf (\_TZ.FAN0._FST))
                    {
                        \_TZ.FAN0._FST [One] = Arg0
                        Notify (\_TZ.FAN0, 0x80) // Status Change
                    }
                }
            }

            Name (TFST, Package (0x03)
            {
                Zero, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            })
            Method (_FST, 0, Serialized)  // _FST: Fan Status
            {
                If (\_SB.PC00.LPCB.EC0.ECAV ())
                {
                    TFST [One] = \_SB.PC00.LPCB.EC0.PEN2
                }

                Return (TFST) /* \_SB_.PC00.LPCB.EC0_.TFN2.TFST */
            }
        }
    }

    Scope (\_SB.PC00.LPCB.EC0)
    {
        Device (CHRG)
        {
            Name (_HID, "INTC1043")  // _HID: Hardware ID
            Name (_UID, "CHRG")  // _UID: Unique ID
            Name (_STR, Unicode ("Charger"))  // _STR: Description String
            Name (PTYP, 0x0B)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\CHGE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (PSSS, Zero)
            Name (PPS1, Package (0x02)
            {
                Package (0x08)
                {
                    0x64, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x0DAC, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x55, 
                    Zero, 
                    Zero, 
                    Zero, 
                    One, 
                    0x0BB8, 
                    "MilliAmps", 
                    Zero
                }
            })
            Name (PPS2, Package (0x0A)
            {
                Package (0x08)
                {
                    0x64, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x1194, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x58, 
                    Zero, 
                    Zero, 
                    Zero, 
                    One, 
                    0x0FA0, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x4D, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x02, 
                    0x0DAC, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x42, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x03, 
                    0x0BB8, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x37, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x04, 
                    0x09C4, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x2C, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x05, 
                    0x07D0, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x21, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x06, 
                    0x05DC, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x16, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x07, 
                    0x03E8, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    0x0B, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x08, 
                    0x01F4, 
                    "MilliAmps", 
                    Zero
                }, 

                Package (0x08)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x09, 
                    Zero, 
                    "MilliAmps", 
                    Zero
                }
            })
            Method (PPSS, 0, Serialized)
            {
                Return (PPS1) /* \_SB_.PC00.LPCB.EC0_.CHRG.PPS1 */
            }

            Method (PCAL, 0, Serialized)
            {
                PSSS = SizeOf (PPS1)
            }

            Method (PPPC, 0, NotSerialized)
            {
                PCAL ()
                If (\PWRS)
                {
                    Return (Zero)
                }
                Else
                {
                    Return ((PSSS - One))
                }
            }

            Method (SPPC, 1, Serialized)
            {
                PCAL ()
                If ((ToInteger (Arg0) <= (PSSS - One)))
                {
                    \_SB.PC00.LPCB.EC0.SCGR (Arg0)
                }
            }

            Method (PPDL, 0, NotSerialized)
            {
                PCAL ()
                Return ((PSSS - One))
            }
        }
    }

    Scope (\_SB)
    {
        Device (TPWR)
        {
            Name (_HID, "INTC1047")  // _HID: Hardware ID
            Name (_UID, "TPWR")  // _UID: Unique ID
            Name (_STR, Unicode ("Platform Power"))  // _STR: Description String
            Name (PTYP, 0x11)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\PWRE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (PSOC, 0, NotSerialized)
            {
                If ((\_SB.PC00.LPCB.EC0.ECAV () == Zero))
                {
                    Return (Zero)
                }

                Return (Zero)
            }

            Method (PSRC, 0, Serialized)
            {
                If ((\_SB.PC00.LPCB.EC0.ECAV () == Zero))
                {
                    Return (Zero)
                }
                Else
                {
                }
            }

            Method (ARTG, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (PROP, 0, NotSerialized)
            {
                Return (0x61A8)
            }

            Method (AVOL, 0, Serialized)
            {
                Return (Zero)
            }

            Method (ACUR, 0, Serialized)
            {
                Return (Zero)
            }

            Method (AP01, 0, Serialized)
            {
                Return (Zero)
            }

            Method (AP02, 0, Serialized)
            {
                Return (Zero)
            }

            Method (AP10, 0, Serialized)
            {
                Return (Zero)
            }

            Method (PBOK, 1, Serialized)
            {
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Name (PTTL, 0x14)
        Name (PSVT, Package (0x05)
        {
            0x02, 
            Package (0x0C)
            {
                \_SB.PC00.LPCB.EC0.CHRG, 
                \_SB.PC00.LPCB.EC0.SEN3, 
                One, 
                0xC8, 
                0x0C6E, 
                0x0E, 
                0x000A0000, 
                "MAX", 
                One, 
                0x0A, 
                0x0A, 
                Zero
            }, 

            Package (0x0C)
            {
                \_SB.PC00.LPCB.EC0.CHRG, 
                \_SB.PC00.LPCB.EC0.SEN3, 
                One, 
                0xC8, 
                0x0CA0, 
                0x0E, 
                0x000A0000, 
                One, 
                One, 
                0x0A, 
                0x0A, 
                Zero
            }, 

            Package (0x0C)
            {
                \_SB.PC00.LPCB.EC0.CHRG, 
                \_SB.PC00.LPCB.EC0.SEN3, 
                One, 
                0xC8, 
                0x0CD2, 
                0x0E, 
                0x000A0000, 
                0x02, 
                One, 
                0x0A, 
                0x0A, 
                Zero
            }, 

            Package (0x0C)
            {
                \_SB.PC00.LPCB.EC0.CHRG, 
                \_SB.PC00.LPCB.EC0.SEN3, 
                One, 
                0xC8, 
                0x0D36, 
                0x0E, 
                0x000A0000, 
                "MIN", 
                One, 
                0x0A, 
                0x0A, 
                Zero
            }
        })
    }

    Scope (\_SB.IETM)
    {
        Method (KTOC, 1, Serialized)
        {
            If ((Arg0 > 0x0AAC))
            {
                Return (((Arg0 - 0x0AAC) / 0x0A))
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (CTOK, 1, Serialized)
        {
            Return (((Arg0 * 0x0A) + 0x0AAC))
        }

        Method (C10K, 1, Serialized)
        {
            Name (TMP1, Buffer (0x10)
            {
                 0x00                                             // .
            })
            CreateByteField (TMP1, Zero, TMPL)
            CreateByteField (TMP1, One, TMPH)
            Local0 = (Arg0 + 0x0AAC)
            TMPL = (Local0 & 0xFF)
            TMPH = ((Local0 & 0xFF00) >> 0x08)
            ToInteger (TMP1, Local1)
            Return (Local1)
        }

        Method (K10C, 1, Serialized)
        {
            If ((Arg0 > 0x0AAC))
            {
                Return ((Arg0 - 0x0AAC))
            }
            Else
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PC00.TCPU)
    {
        Name (PFLG, Zero)
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If ((\SADE == One))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }

        OperationRegion (CPWR, SystemMemory, ((MHBR << 0x0F) + 0x5000), 0x1000)
        Field (CPWR, ByteAcc, NoLock, Preserve)
        {
            Offset (0x930), 
            PTDP,   15, 
            Offset (0x932), 
            PMIN,   15, 
            Offset (0x934), 
            PMAX,   15, 
            Offset (0x936), 
            TMAX,   7, 
            Offset (0x938), 
            PWRU,   4, 
            Offset (0x939), 
            EGYU,   5, 
            Offset (0x93A), 
            TIMU,   4, 
            Offset (0x958), 
            Offset (0x95C), 
            LPMS,   1, 
            CTNL,   2, 
            Offset (0x978), 
            PCTP,   8, 
            Offset (0x998), 
            RP0C,   8, 
            RP1C,   8, 
            RPNC,   8, 
            Offset (0xF3C), 
            TRAT,   8, 
            Offset (0xF40), 
            PTD1,   15, 
            Offset (0xF42), 
            TRA1,   8, 
            Offset (0xF44), 
            PMX1,   15, 
            Offset (0xF46), 
            PMN1,   15, 
            Offset (0xF48), 
            PTD2,   15, 
            Offset (0xF4A), 
            TRA2,   8, 
            Offset (0xF4C), 
            PMX2,   15, 
            Offset (0xF4E), 
            PMN2,   15, 
            Offset (0xF50), 
            CTCL,   2, 
                ,   29, 
            CLCK,   1, 
            MNTR,   8
        }

        Name (XPCC, Zero)
        Method (PPCC, 0, Serialized)
        {
            If (((XPCC == Zero) && CondRefOf (\_SB.CBMI)))
            {
                Switch (ToInteger (\_SB.CBMI))
                {
                    Case (Zero)
                    {
                        If (((\_SB.CLVL >= One) && (\_SB.CLVL <= 0x03)))
                        {
                            CPL0 ()
                            XPCC = One
                        }
                    }
                    Case (One)
                    {
                        If (((\_SB.CLVL == 0x02) || (\_SB.CLVL == 0x03)))
                        {
                            CPL1 ()
                            XPCC = One
                        }
                    }
                    Case (0x02)
                    {
                        If ((\_SB.CLVL == 0x03))
                        {
                            CPL2 ()
                            XPCC = One
                        }
                    }

                }
            }

            Return (NPCC) /* \_SB_.PC00.TCPU.NPCC */
        }

        Name (NPCC, Package (0x03)
        {
            0x02, 
            Package (0x06)
            {
                Zero, 
                0x88B8, 
                0xAFC8, 
                0x6D60, 
                0x7D00, 
                0x03E8
            }, 

            Package (0x06)
            {
                One, 
                0xDBBA, 
                0xDBBA, 
                Zero, 
                Zero, 
                0x03E8
            }
        })
        Method (CPNU, 2, Serialized)
        {
            Name (CNVT, Zero)
            Name (PPUU, Zero)
            Name (RMDR, Zero)
            If ((PWRU == Zero))
            {
                PPUU = One
            }
            Else
            {
                PPUU = (PWRU-- << 0x02)
            }

            Divide (Arg0, PPUU, RMDR, CNVT) /* \_SB_.PC00.TCPU.CPNU.CNVT */
            If ((Arg1 == Zero))
            {
                Return (CNVT) /* \_SB_.PC00.TCPU.CPNU.CNVT */
            }
            Else
            {
                CNVT *= 0x03E8
                RMDR *= 0x03E8
                RMDR /= PPUU
                CNVT += RMDR /* \_SB_.PC00.TCPU.CPNU.RMDR */
                Return (CNVT) /* \_SB_.PC00.TCPU.CPNU.CNVT */
            }
        }

        Method (CTN2, 1, NotSerialized)
        {
            Name (SECV, Package (0x1A)
            {
                Zero, 
                One, 
                0x02, 
                0x03, 
                0x04, 
                0x05, 
                0x06, 
                0x07, 
                0x08, 
                0x0A, 
                0x0C, 
                0x0E, 
                0x10, 
                0x14, 
                0x18, 
                0x1C, 
                0x20, 
                0x28, 
                0x30, 
                0x38, 
                0x40, 
                0x50, 
                0x60, 
                0x70, 
                0x80, 
                Ones
            })
            Name (REGV, Package (0x1A)
            {
                Zero, 
                0x0A, 
                0x0B, 
                0x4B, 
                0x0C, 
                0x2C, 
                0x4C, 
                0x6C, 
                0x0D, 
                0x2D, 
                0x4D, 
                0x6D, 
                0x0E, 
                0x2E, 
                0x4E, 
                0x6E, 
                0x0F, 
                0x2F, 
                0x4F, 
                0x6F, 
                0x10, 
                0x30, 
                0x50, 
                0x70, 
                0x11, 
                0xFF
            })
            Local0 = Match (SECV, MGT, Arg0, MTR, Zero, Zero)
            Return (DerefOf (REGV [(Local0 - One)]))
        }

        Name (CCTD, 0xFF)
        Method (CPL0, 0, NotSerialized)
        {
            \_SB.PC00.TCPU.NPCC [Zero] = 0x02
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [Zero] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [One] = \_SB.IETM.P102
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x02] = CPNU (\_SB.PL10, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x03] = (\_SB.PLW0 * 0x03E8)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x04] = (\_SB.PLW0 * 0x03E8)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x05] = PPSZ /* External reference */
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [Zero] = One
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [One] = \_SB.IETM.P105
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x02] = CPNU (\_SB.PL20, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x03] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x04] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x05] = PPSZ /* External reference */
            CCTD = Zero
        }

        Method (CPL1, 0, NotSerialized)
        {
            \_SB.PC00.TCPU.NPCC [Zero] = 0x02
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [Zero] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [One] = 0x7D
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x02] = CPNU (\_SB.PL11, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x03] = (\_SB.PLW1 * 0x03E8)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x04] = (\_SB.PLW1 * 0x03E8)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x05] = PPSZ /* External reference */
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [Zero] = One
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [One] = CPNU (\_SB.PL21, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x02] = CPNU (\_SB.PL21, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x03] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x04] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x05] = PPSZ /* External reference */
            CCTD = One
        }

        Method (CPL2, 0, NotSerialized)
        {
            \_SB.PC00.TCPU.NPCC [Zero] = 0x02
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [Zero] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [One] = 0x7D
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x02] = CPNU (\_SB.PL12, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x03] = (\_SB.PLW2 * 0x03E8)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x04] = (\_SB.PLW2 * 0x03E8)
            DerefOf (\_SB.PC00.TCPU.NPCC [One]) [0x05] = PPSZ /* External reference */
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [Zero] = One
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [One] = CPNU (\_SB.PL22, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x02] = CPNU (\_SB.PL22, One)
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x03] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x04] = Zero
            DerefOf (\_SB.PC00.TCPU.NPCC [0x02]) [0x05] = PPSZ /* External reference */
            CCTD = 0x02
        }

        Name (LSTM, Zero)
        Name (_PPC, Zero)  // _PPC: Performance Present Capabilities
        Method (SPPC, 1, Serialized)
        {
            If (CondRefOf (\_SB.CPPC))
            {
                \_SB.CPPC = Arg0
            }

            Switch (ToInteger (\TCNT))
            {
                Case (0x10)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                    Notify (\_SB.PR06, 0x80) // Status Change
                    Notify (\_SB.PR07, 0x80) // Status Change
                    Notify (\_SB.PR08, 0x80) // Status Change
                    Notify (\_SB.PR09, 0x80) // Status Change
                    Notify (\_SB.PR10, 0x80) // Status Change
                    Notify (\_SB.PR11, 0x80) // Status Change
                    Notify (\_SB.PR12, 0x80) // Status Change
                    Notify (\_SB.PR13, 0x80) // Status Change
                    Notify (\_SB.PR14, 0x80) // Status Change
                    Notify (\_SB.PR15, 0x80) // Status Change
                }
                Case (0x0E)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                    Notify (\_SB.PR06, 0x80) // Status Change
                    Notify (\_SB.PR07, 0x80) // Status Change
                    Notify (\_SB.PR08, 0x80) // Status Change
                    Notify (\_SB.PR09, 0x80) // Status Change
                    Notify (\_SB.PR10, 0x80) // Status Change
                    Notify (\_SB.PR11, 0x80) // Status Change
                    Notify (\_SB.PR12, 0x80) // Status Change
                    Notify (\_SB.PR13, 0x80) // Status Change
                }
                Case (0x0C)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                    Notify (\_SB.PR06, 0x80) // Status Change
                    Notify (\_SB.PR07, 0x80) // Status Change
                    Notify (\_SB.PR08, 0x80) // Status Change
                    Notify (\_SB.PR09, 0x80) // Status Change
                    Notify (\_SB.PR10, 0x80) // Status Change
                    Notify (\_SB.PR11, 0x80) // Status Change
                }
                Case (0x0A)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                    Notify (\_SB.PR06, 0x80) // Status Change
                    Notify (\_SB.PR07, 0x80) // Status Change
                    Notify (\_SB.PR08, 0x80) // Status Change
                    Notify (\_SB.PR09, 0x80) // Status Change
                }
                Case (0x08)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                    Notify (\_SB.PR06, 0x80) // Status Change
                    Notify (\_SB.PR07, 0x80) // Status Change
                }
                Case (0x07)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                    Notify (\_SB.PR06, 0x80) // Status Change
                }
                Case (0x06)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                    Notify (\_SB.PR05, 0x80) // Status Change
                }
                Case (0x05)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                    Notify (\_SB.PR04, 0x80) // Status Change
                }
                Case (0x04)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                    Notify (\_SB.PR03, 0x80) // Status Change
                }
                Case (0x03)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                    Notify (\_SB.PR02, 0x80) // Status Change
                }
                Case (0x02)
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                    Notify (\_SB.PR01, 0x80) // Status Change
                }
                Default
                {
                    Notify (\_SB.PR00, 0x80) // Status Change
                }

            }
        }

        Method (SPUR, 1, NotSerialized)
        {
            If ((Arg0 <= \TCNT))
            {
                If ((\_SB.PAGD._STA () == 0x0F))
                {
                    \_SB.PAGD._PUR [One] = Arg0
                    Notify (\_SB.PAGD, 0x80) // Status Change
                }
            }
        }

        Method (PCCC, 0, Serialized)
        {
            PCCX [Zero] = One
            Switch (ToInteger (CPNU (PTDP, Zero)))
            {
                Case (0x39)
                {
                    DerefOf (PCCX [One]) [Zero] = 0xA7F8
                    DerefOf (PCCX [One]) [One] = 0x00017318
                }
                Case (0x2F)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x9858
                    DerefOf (PCCX [One]) [One] = 0x00014C08
                }
                Case (0x25)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x7148
                    DerefOf (PCCX [One]) [One] = 0xD6D8
                }
                Case (0x19)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x3E80
                    DerefOf (PCCX [One]) [One] = 0x7D00
                }
                Case (0x0F)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x36B0
                    DerefOf (PCCX [One]) [One] = 0x7D00
                }
                Case (0x0B)
                {
                    DerefOf (PCCX [One]) [Zero] = 0x36B0
                    DerefOf (PCCX [One]) [One] = 0x61A8
                }
                Default
                {
                    DerefOf (PCCX [One]) [Zero] = 0xFF
                    DerefOf (PCCX [One]) [One] = 0xFF
                }

            }

            Return (PCCX) /* \_SB_.PC00.TCPU.PCCX */
        }

        Name (PCCX, Package (0x02)
        {
            0x80000000, 
            Package (0x02)
            {
                0x80000000, 
                0x80000000
            }
        })
        Name (KEFF, Package (0x1E)
        {
            Package (0x02)
            {
                0x01BC, 
                Zero
            }, 

            Package (0x02)
            {
                0x01CF, 
                0x27
            }, 

            Package (0x02)
            {
                0x01E1, 
                0x4B
            }, 

            Package (0x02)
            {
                0x01F3, 
                0x6C
            }, 

            Package (0x02)
            {
                0x0206, 
                0x8B
            }, 

            Package (0x02)
            {
                0x0218, 
                0xA8
            }, 

            Package (0x02)
            {
                0x022A, 
                0xC3
            }, 

            Package (0x02)
            {
                0x023D, 
                0xDD
            }, 

            Package (0x02)
            {
                0x024F, 
                0xF4
            }, 

            Package (0x02)
            {
                0x0261, 
                0x010B
            }, 

            Package (0x02)
            {
                0x0274, 
                0x011F
            }, 

            Package (0x02)
            {
                0x032C, 
                0x01BD
            }, 

            Package (0x02)
            {
                0x03D7, 
                0x0227
            }, 

            Package (0x02)
            {
                0x048B, 
                0x026D
            }, 

            Package (0x02)
            {
                0x053E, 
                0x02A1
            }, 

            Package (0x02)
            {
                0x05F7, 
                0x02C6
            }, 

            Package (0x02)
            {
                0x06A8, 
                0x02E6
            }, 

            Package (0x02)
            {
                0x075D, 
                0x02FF
            }, 

            Package (0x02)
            {
                0x0818, 
                0x0311
            }, 

            Package (0x02)
            {
                0x08CF, 
                0x0322
            }, 

            Package (0x02)
            {
                0x179C, 
                0x0381
            }, 

            Package (0x02)
            {
                0x2DDC, 
                0x039C
            }, 

            Package (0x02)
            {
                0x44A8, 
                0x039E
            }, 

            Package (0x02)
            {
                0x5C35, 
                0x0397
            }, 

            Package (0x02)
            {
                0x747D, 
                0x038D
            }, 

            Package (0x02)
            {
                0x8D7F, 
                0x0382
            }, 

            Package (0x02)
            {
                0xA768, 
                0x0376
            }, 

            Package (0x02)
            {
                0xC23B, 
                0x0369
            }, 

            Package (0x02)
            {
                0xDE26, 
                0x035A
            }, 

            Package (0x02)
            {
                0xFB7C, 
                0x034A
            }
        })
        Name (CEUP, Package (0x06)
        {
            0x80000000, 
            0x80000000, 
            0x80000000, 
            0x80000000, 
            0x80000000, 
            0x80000000
        })
        Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
        {
            LSTM = Arg0
            Notify (\_SB.PC00.TCPU, 0x91) // Device-Specific
        }

        Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
        {
            Return (0x0ADE)
        }

        Name (PTYP, Zero)
        Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
        {
            If (CondRefOf (\_SB.PR00._PSS))
            {
                Return (\_SB.PR00._PSS ())
            }
            Else
            {
                Return (Package (0x02)
                {
                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, 

                    Package (0x06)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }
        }

        Method (_TSS, 0, NotSerialized)  // _TSS: Throttling Supported States
        {
            If (CondRefOf (\_SB.PR00._TSS))
            {
                Return (\_SB.PR00._TSS ())
            }
            Else
            {
                Return (Package (0x01)
                {
                    Package (0x05)
                    {
                        One, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }
                })
            }
        }

        Method (_TPC, 0, NotSerialized)  // _TPC: Throttling Present Capabilities
        {
            If (CondRefOf (\_SB.PR00._TPC))
            {
                Return (\_SB.PR00._TPC) /* External reference */
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_PTC, 0, NotSerialized)  // _PTC: Processor Throttling Control
        {
            If ((CondRefOf (\PF00) && (\PF00 != 0x80000000)))
            {
                If ((\PF00 & 0x04))
                {
                    Return (Package (0x02)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }
                    })
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        ResourceTemplate ()
                        {
                            Register (SystemIO, 
                                0x05,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000001810, // Address
                                ,)
                        }, 

                        ResourceTemplate ()
                        {
                            Register (SystemIO, 
                                0x05,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000001810, // Address
                                ,)
                        }
                    })
                }
            }
            Else
            {
                Return (Package (0x02)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    ResourceTemplate ()
                    {
                        Register (FFixedHW, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }
                })
            }
        }

        Method (_TSD, 0, NotSerialized)  // _TSD: Throttling State Dependencies
        {
            If (CondRefOf (\_SB.PR00._TSD))
            {
                Return (\_SB.PR00._TSD ())
            }
            Else
            {
                Return (Package (0x01)
                {
                    Package (0x05)
                    {
                        0x05, 
                        Zero, 
                        Zero, 
                        0xFC, 
                        Zero
                    }
                })
            }
        }

        Method (_TDL, 0, NotSerialized)  // _TDL: T-State Depth Limit
        {
            If ((CondRefOf (\_SB.PR00._TSS) && CondRefOf (\_SB.CFGD)))
            {
                If ((\_SB.CFGD & 0x2000))
                {
                    Return ((SizeOf (\_SB.PR00.TSMF) - One))
                }
                Else
                {
                    Return ((SizeOf (\_SB.PR00.TSMC) - One))
                }
            }
            Else
            {
                Return (Zero)
            }
        }

        Method (_PDL, 0, NotSerialized)  // _PDL: P-state Depth Limit
        {
            If (CondRefOf (\_SB.PR00._PSS))
            {
                If ((\_SB.OSCP & 0x0400))
                {
                    Return ((SizeOf (\_SB.PR00.TPSS) - One))
                }
                Else
                {
                    Return ((SizeOf (\_SB.PR00.LPSS) - One))
                }
            }
            Else
            {
                Return (Zero)
            }
        }

        Name (TJMX, 0x6E)
    }

    Scope (\_SB.IETM)
    {
        Name (CTSP, Package (0x01)
        {
            ToUUID ("e145970a-e4c1-4d73-900e-c9c5a69dd067") /* Unknown UUID */
        })
    }

    Scope (\_SB.PC00.TCPU)
    {
        Method (TDPL, 0, Serialized)
        {
            Name (AAAA, Zero)
            Name (BBBB, Zero)
            Name (CCCC, Zero)
            Local0 = CTNL /* \_SB_.PC00.TCPU.CTNL */
            If (((Local0 == One) || (Local0 == 0x02)))
            {
                Local0 = \_SB.CLVL /* External reference */
            }
            Else
            {
                Return (Package (0x01)
                {
                    Zero
                })
            }

            If ((CLCK == One))
            {
                Local0 = One
            }

            AAAA = CPNU (\_SB.PL10, One)
            BBBB = CPNU (\_SB.PL11, One)
            CCCC = CPNU (\_SB.PL12, One)
            Name (TMP1, Package (0x01)
            {
                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }
            })
            Name (TMP2, Package (0x02)
            {
                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }, 

                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }
            })
            Name (TMP3, Package (0x03)
            {
                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }, 

                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }, 

                Package (0x05)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                }
            })
            If ((Local0 == 0x03))
            {
                Local5 = Zero
                LEV0 = 0x02
                Local3 = One
                LEV1 = Zero
                Local4 = 0x02
                LEV2 = One
                Local1 = (\_SB.TAR0 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP3 [Local3]) [Zero] = AAAA /* \_SB_.PC00.TCPU.TDPL.AAAA */
                DerefOf (TMP3 [Local3]) [One] = Local2
                DerefOf (TMP3 [Local3]) [0x02] = \_SB.CTC0 /* External reference */
                DerefOf (TMP3 [Local3]) [0x03] = Local1
                DerefOf (TMP3 [Local3]) [0x04] = Zero
                Local1 = (\_SB.TAR1 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP3 [Local4]) [Zero] = BBBB /* \_SB_.PC00.TCPU.TDPL.BBBB */
                DerefOf (TMP3 [Local4]) [One] = Local2
                DerefOf (TMP3 [Local4]) [0x02] = \_SB.CTC1 /* External reference */
                DerefOf (TMP3 [Local4]) [0x03] = Local1
                DerefOf (TMP3 [Local4]) [0x04] = Zero
                Local1 = (\_SB.TAR2 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP3 [Local5]) [Zero] = CCCC /* \_SB_.PC00.TCPU.TDPL.CCCC */
                DerefOf (TMP3 [Local5]) [One] = Local2
                DerefOf (TMP3 [Local5]) [0x02] = \_SB.CTC2 /* External reference */
                DerefOf (TMP3 [Local5]) [0x03] = Local1
                DerefOf (TMP3 [Local5]) [0x04] = Zero
                Return (TMP3) /* \_SB_.PC00.TCPU.TDPL.TMP3 */
            }

            If ((Local0 == 0x02))
            {
                Local3 = Zero
                Local4 = One
                LEV0 = Zero
                LEV1 = One
                LEV2 = Zero
                Local1 = (\_SB.TAR0 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP2 [Local3]) [Zero] = AAAA /* \_SB_.PC00.TCPU.TDPL.AAAA */
                DerefOf (TMP2 [Local3]) [One] = Local2
                DerefOf (TMP2 [Local3]) [0x02] = \_SB.CTC0 /* External reference */
                DerefOf (TMP2 [Local3]) [0x03] = Local1
                DerefOf (TMP2 [Local3]) [0x04] = Zero
                Local1 = (\_SB.TAR1 + One)
                Local2 = (Local1 * 0x64)
                DerefOf (TMP2 [Local4]) [Zero] = BBBB /* \_SB_.PC00.TCPU.TDPL.BBBB */
                DerefOf (TMP2 [Local4]) [One] = Local2
                DerefOf (TMP2 [Local4]) [0x02] = \_SB.CTC1 /* External reference */
                DerefOf (TMP2 [Local4]) [0x03] = Local1
                DerefOf (TMP2 [Local4]) [0x04] = Zero
                Return (TMP2) /* \_SB_.PC00.TCPU.TDPL.TMP2 */
            }

            If ((Local0 == One))
            {
                Switch (ToInteger (\_SB.CBMI))
                {
                    Case (Zero)
                    {
                        Local1 = (\_SB.TAR0 + One)
                        Local2 = (Local1 * 0x64)
                        DerefOf (TMP1 [Zero]) [Zero] = AAAA /* \_SB_.PC00.TCPU.TDPL.AAAA */
                        DerefOf (TMP1 [Zero]) [One] = Local2
                        DerefOf (TMP1 [Zero]) [0x02] = \_SB.CTC0 /* External reference */
                        DerefOf (TMP1 [Zero]) [0x03] = Local1
                        DerefOf (TMP1 [Zero]) [0x04] = Zero
                        LEV0 = Zero
                        LEV1 = Zero
                        LEV2 = Zero
                    }
                    Case (One)
                    {
                        Local1 = (\_SB.TAR1 + One)
                        Local2 = (Local1 * 0x64)
                        DerefOf (TMP1 [Zero]) [Zero] = BBBB /* \_SB_.PC00.TCPU.TDPL.BBBB */
                        DerefOf (TMP1 [Zero]) [One] = Local2
                        DerefOf (TMP1 [Zero]) [0x02] = \_SB.CTC1 /* External reference */
                        DerefOf (TMP1 [Zero]) [0x03] = Local1
                        DerefOf (TMP1 [Zero]) [0x04] = Zero
                        LEV0 = One
                        LEV1 = One
                        LEV2 = One
                    }
                    Case (0x02)
                    {
                        Local1 = (\_SB.TAR2 + One)
                        Local2 = (Local1 * 0x64)
                        DerefOf (TMP1 [Zero]) [Zero] = CCCC /* \_SB_.PC00.TCPU.TDPL.CCCC */
                        DerefOf (TMP1 [Zero]) [One] = Local2
                        DerefOf (TMP1 [Zero]) [0x02] = \_SB.CTC2 /* External reference */
                        DerefOf (TMP1 [Zero]) [0x03] = Local1
                        DerefOf (TMP1 [Zero]) [0x04] = Zero
                        LEV0 = 0x02
                        LEV1 = 0x02
                        LEV2 = 0x02
                    }

                }

                Return (TMP1) /* \_SB_.PC00.TCPU.TDPL.TMP1 */
            }

            Return (Zero)
        }

        Name (MAXT, Zero)
        Method (TDPC, 0, NotSerialized)
        {
            Return (MAXT) /* \_SB_.PC00.TCPU.MAXT */
        }

        Name (LEV0, Zero)
        Name (LEV1, Zero)
        Name (LEV2, Zero)
        Method (STDP, 1, Serialized)
        {
            If ((Arg0 >= \_SB.CLVL))
            {
                Return (Zero)
            }

            Switch (ToInteger (Arg0))
            {
                Case (Zero)
                {
                    Local0 = LEV0 /* \_SB_.PC00.TCPU.LEV0 */
                }
                Case (One)
                {
                    Local0 = LEV1 /* \_SB_.PC00.TCPU.LEV1 */
                }
                Case (0x02)
                {
                    Local0 = LEV2 /* \_SB_.PC00.TCPU.LEV2 */
                }

            }

            Switch (ToInteger (Local0))
            {
                Case (Zero)
                {
                    CPL0 ()
                }
                Case (One)
                {
                    CPL1 ()
                }
                Case (0x02)
                {
                    CPL2 ()
                }

            }

            Notify (\_SB.PC00.TCPU, 0x83) // Device-Specific Change
        }
    }

    Scope (\_SB)
    {
        Device (TPCH)
        {
            Name (_HID, "INTC1045")  // _HID: Hardware ID
            Name (_UID, "TPCH")  // _UID: Unique ID
            Name (_STR, Unicode ("Intel PCH FIVR Participant"))  // _STR: Description String
            Name (PTYP, 0x05)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\PCHE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RFC0, 1, Serialized)
            {
                IPCS (0xA3, One, 0x08, Zero, Arg0, Zero, Zero)
                Return (Package (0x01)
                {
                    Zero
                })
            }

            Method (RFC1, 1, Serialized)
            {
                IPCS (0xA3, One, 0x08, One, Arg0, Zero, Zero)
                Return (Package (0x01)
                {
                    Zero
                })
            }

            Method (SEMI, 1, Serialized)
            {
                IPCS (0xA3, One, 0x08, 0x02, Arg0, Zero, Zero)
                Return (Package (0x01)
                {
                    Zero
                })
            }

            Method (PKGC, 1, Serialized)
            {
                Name (PPKG, Package (0x02)
                {
                    Zero, 
                    Zero
                })
                PPKG [Zero] = DerefOf (Arg0 [Zero])
                PPKG [One] = DerefOf (Arg0 [One])
                Return (PPKG) /* \_SB_.TPCH.PKGC.PPKG */
            }

            Method (GFC0, 0, Serialized)
            {
                Local0 = IPCS (0xA3, Zero, 0x08, Zero, Zero, Zero, Zero)
                Local1 = \_SB.TPCH.PKGC (Local0)
                Return (Local1)
            }

            Method (GFC1, 0, Serialized)
            {
                Local0 = IPCS (0xA3, Zero, 0x08, One, Zero, Zero, Zero)
                Local1 = \_SB.TPCH.PKGC (Local0)
                Return (Local1)
            }

            Method (GEMI, 0, Serialized)
            {
                Local0 = IPCS (0xA3, Zero, 0x08, 0x02, Zero, Zero, Zero)
                Local1 = \_SB.TPCH.PKGC (Local0)
                Return (Local1)
            }

            Method (GFFS, 0, Serialized)
            {
                Local0 = IPCS (0xA3, Zero, 0x08, 0x03, Zero, Zero, Zero)
                Local1 = \_SB.TPCH.PKGC (Local0)
                Return (Local1)
            }

            Method (GFCS, 0, Serialized)
            {
                Local0 = IPCS (0xA3, Zero, 0x08, 0x04, Zero, Zero, Zero)
                Local1 = \_SB.TPCH.PKGC (Local0)
                Return (Local1)
            }
        }
    }

    Scope (\_SB.PC00.LPCB.EC0)
    {
        Device (SEN1)
        {
            Name (_HID, "INTC1043")  // _HID: Hardware ID
            Name (_UID, "SEN1")  // _UID: Unique ID
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((S1DE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (\_SB.PC00.LPCB.EC0.SEN1, 0x91) // Device-Specific
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Name (S1AC, 0x3C)
            Name (S1PV, 0x41)
            Name (S1CC, 0x50)
            Name (S1C3, 0x46)
            Name (S1HP, 0x4B)
            Name (SSP1, Zero)
            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PC00.LPCB.EC0)
    {
        Device (SEN2)
        {
            Name (_HID, "INTC1043")  // _HID: Hardware ID
            Name (_UID, "SEN2")  // _UID: Unique ID
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((S2DE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (\_SB.PC00.LPCB.EC0.SEN2, 0x91) // Device-Specific
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Name (S2AC, 0x3C)
            Name (S2PV, 0x41)
            Name (S2CC, 0x50)
            Name (S2C3, 0x46)
            Name (S2HP, 0x4B)
            Name (SSP2, Zero)
            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PC00.LPCB.EC0)
    {
        Device (SEN3)
        {
            Name (_HID, "INTC1043")  // _HID: Hardware ID
            Name (_UID, "SEN3")  // _UID: Unique ID
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((S3DE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (\_SB.PC00.LPCB.EC0.SEN3, 0x91) // Device-Specific
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Name (S3AC, 0x3C)
            Name (S3PV, 0x41)
            Name (S3CC, 0x50)
            Name (S3C3, 0x46)
            Name (S3HP, 0x4B)
            Name (SSP3, Zero)
            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PC00.LPCB.EC0)
    {
        Device (SEN4)
        {
            Name (_HID, "INTC1043")  // _HID: Hardware ID
            Name (_UID, "SEN4")  // _UID: Unique ID
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((S4DE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (\_SB.PC00.LPCB.EC0.SEN4, 0x91) // Device-Specific
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Name (S4AC, 0x3C)
            Name (S4PV, 0x41)
            Name (S4CC, 0x50)
            Name (S4C3, 0x46)
            Name (S4HP, 0x4B)
            Name (SSP4, Zero)
            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PC00.LPCB.EC0)
    {
        Device (SEN5)
        {
            Name (_HID, "INTC1043")  // _HID: Hardware ID
            Name (_UID, "SEN5")  // _UID: Unique ID
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((S5DE == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (\_SB.PC00.LPCB.EC0.SEN5, 0x91) // Device-Specific
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Name (S5AC, 0x3C)
            Name (S5PV, 0x41)
            Name (S5CC, 0x50)
            Name (S5C3, 0x46)
            Name (S5HP, 0x4B)
            Name (SSP5, Zero)
            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PC00.LPCB.EC0)
    {
        Device (SEN6)
        {
            Name (_HID, "INTC1043")  // _HID: Hardware ID
            Name (_UID, "SEN6")  // _UID: Unique ID
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_SB.IETM.P112 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (\_SB.PC00.LPCB.EC0.SEN6, 0x91) // Device-Specific
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Name (S6AC, 0x3C)
            Name (S6PV, 0x41)
            Name (S6CC, 0x50)
            Name (S6C3, 0x46)
            Name (S6HP, 0x4B)
            Name (SSP6, Zero)
            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.PC00.LPCB.EC0)
    {
        Device (SEN7)
        {
            Name (_HID, "INTC1043")  // _HID: Hardware ID
            Name (_UID, "SEN7")  // _UID: Unique ID
            Name (PTYP, 0x03)
            Name (CTYP, Zero)
            Name (PFLG, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_SB.IETM.P113 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (LSTM, Zero)
            Method (_DTI, 1, NotSerialized)  // _DTI: Device Temperature Indication
            {
                LSTM = Arg0
                Notify (\_SB.PC00.LPCB.EC0.SEN7, 0x91) // Device-Specific
            }

            Method (_NTT, 0, NotSerialized)  // _NTT: Notification Temperature Threshold
            {
                Return (0x0ADE)
            }

            Name (S7AC, 0x3C)
            Name (S7PV, 0x41)
            Name (S7CC, 0x50)
            Name (S7C3, 0x46)
            Name (S7HP, 0x4B)
            Name (SSP7, Zero)
            Method (_TSP, 0, Serialized)  // _TSP: Thermal Sampling Period
            {
                Return (Zero)
            }
        }
    }

    Scope (\_SB.IETM)
    {
        Name (DP2P, Package (0x01)
        {
            ToUUID ("9e04115a-ae87-4d1c-9500-0f3e340bfe75") /* Unknown UUID */
        })
        Name (DPSP, Package (0x01)
        {
            ToUUID ("42a441d6-ae6a-462b-a84b-4a8ce79027d3") /* Unknown UUID */
        })
        Name (DASP, Package (0x01)
        {
            ToUUID ("3a95c389-e4b8-4629-a526-c52c88626bae") /* Unknown UUID */
        })
        Name (DA2P, Package (0x01)
        {
            ToUUID ("0e56fab6-bdfc-4e8c-8246-40ecfd4d74ea") /* Unknown UUID */
        })
        Name (DCSP, Package (0x01)
        {
            ToUUID ("97c68ae7-15fa-499c-b8c9-5da81d606e0a") /* Unknown UUID */
        })
        Name (RFIP, Package (0x01)
        {
            ToUUID ("c4ce1849-243a-49f3-b8d5-f97002f38e6a") /* Unknown UUID */
        })
        Name (POBP, Package (0x01)
        {
            ToUUID ("f5a35014-c209-46a4-993a-eb56de7530a1") /* Unknown UUID */
        })
        Name (DAPP, Package (0x01)
        {
            ToUUID ("63be270f-1c11-48fd-a6f7-3af253ff3e2d") /* Unknown UUID */
        })
        Name (DVSP, Package (0x01)
        {
            ToUUID ("6ed722a7-9240-48a5-b479-31eef723d7cf") /* Unknown UUID */
        })
        Name (DPID, Package (0x01)
        {
            ToUUID ("42496e14-bc1b-46e8-a798-ca915464426f") /* Unknown UUID */
        })
    }

    Scope (\_SB.PC00.TCPU)
    {
        Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
        {
            If (((\S0IX == One) && (\PWRS == Zero)))
            {
                If ((\_SB.IETM.P150 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\_SB.IETM.P150))
            }
            ElseIf ((\S0IX == 0x03))
            {
                If ((\_SB.IETM.P162 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\_SB.IETM.P162))
            }
            Else
            {
                If ((\_SB.IETM.P114 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\_SB.IETM.P114))
            }
        }

        Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
        {
            If ((\_SB.IETM.P116 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P116))
        }

        Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
        {
            If (((\S0IX == One) && (\PWRS == Zero)))
            {
                If ((\_SB.IETM.P151 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\_SB.IETM.P151))
            }
            ElseIf ((\S0IX == 0x03))
            {
                If ((\_SB.IETM.P163 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\_SB.IETM.P163))
            }
            Else
            {
                If ((\_SB.IETM.P115 == Zero))
                {
                    Return (0xFFFFFFFF)
                }

                Return (\_SB.IETM.CTOK (\_SB.IETM.P115))
            }
        }
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN1)
    {
        Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
        {
            If ((\_SB.IETM.P117 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P117))
        }

        Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
        {
            If ((\_SB.IETM.P119 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P119))
        }

        Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
        {
            If ((\_SB.IETM.P118 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P118))
        }
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN2)
    {
        Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
        {
            If ((\_SB.IETM.P120 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P120))
        }

        Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
        {
            If ((\_SB.IETM.P122 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P122))
        }

        Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
        {
            If ((\_SB.IETM.P121 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P121))
        }
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN3)
    {
        Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
        {
            If ((\_SB.IETM.P123 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P123))
        }

        Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
        {
            If ((\_SB.IETM.P125 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P125))
        }

        Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
        {
            If ((\_SB.IETM.P124 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P124))
        }
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN4)
    {
        Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
        {
            If ((\_SB.IETM.P126 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P126))
        }

        Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
        {
            If ((\_SB.IETM.P128 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P128))
        }

        Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
        {
            If ((\_SB.IETM.P127 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P127))
        }
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN5)
    {
        Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
        {
            If ((\_SB.IETM.P129 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P129))
        }

        Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
        {
            If ((\_SB.IETM.P131 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P131))
        }

        Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
        {
            If ((\_SB.IETM.P130 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P130))
        }
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN6)
    {
        Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
        {
            If ((\_SB.IETM.P132 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P132))
        }

        Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
        {
            If ((\_SB.IETM.P134 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P134))
        }

        Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
        {
            If ((\_SB.IETM.P133 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P133))
        }
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN7)
    {
        Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
        {
            If ((\_SB.IETM.P135 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P135))
        }

        Method (_CR3, 0, Serialized)  // _CR3: Warm/Standby Temperature
        {
            If ((\_SB.IETM.P137 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P137))
        }

        Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
        {
            If ((\_SB.IETM.P136 == Zero))
            {
                Return (0xFFFFFFFF)
            }

            Return (\_SB.IETM.CTOK (\_SB.IETM.P136))
        }
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN1)
    {
        Name (_STR, Unicode ("Memory Temperature Sensor"))  // _STR: Description String
        Method (_TMP, 0, Serialized)  // _TMP: Temperature
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Return (\_SB.PC00.LPCB.EC0.EC50 (0x66))
            }
            Else
            {
                Return (0x0BB8)
            }
        }

        Name (PATC, 0x02)
        Name (AT0, Ones)
        Method (PAT0, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT0 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0x67, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (AT1, Ones)
        Method (PAT1, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT1 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0x68, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (GTSH, 0x14)
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN2)
    {
        Name (_STR, Unicode ("Skin1 Temperature Sensor"))  // _STR: Description String
        Method (_TMP, 0, Serialized)  // _TMP: Temperature
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Return (\_SB.PC00.LPCB.EC0.EC50 (0x60))
            }
            Else
            {
                Return (0x0BB8)
            }
        }

        Name (PATC, 0x02)
        Name (AT0, Ones)
        Method (PAT0, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT0 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0x62, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (AT1, Ones)
        Method (PAT1, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT1 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0x63, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (GTSH, 0x14)
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN3)
    {
        Name (_STR, Unicode ("Skin2 Temperature Sensor"))  // _STR: Description String
        Method (_TMP, 0, Serialized)  // _TMP: Temperature
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Return (\_SB.PC00.LPCB.EC0.EC50 (0x61))
            }
            Else
            {
                Return (0x0BB8)
            }
        }

        Name (PATC, 0x02)
        Name (AT0, Ones)
        Method (PAT0, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT0 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0x64, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (AT1, Ones)
        Method (PAT1, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT1 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0x65, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (GTSH, 0x14)
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN4)
    {
        Name (_STR, Unicode ("Vr Temperature Sensor"))  // _STR: Description String
        Method (_TMP, 0, Serialized)  // _TMP: Temperature
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Return (\_SB.PC00.LPCB.EC0.EC50 (0x70))
            }
            Else
            {
                Return (0x0BB8)
            }
        }

        Name (PATC, 0x02)
        Name (AT0, Ones)
        Method (PAT0, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT0 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0x71, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (AT1, Ones)
        Method (PAT1, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT1 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0x72, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (GTSH, 0x14)
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN5)
    {
        Name (_STR, Unicode ("Dgpu Temperature Sensor"))  // _STR: Description String
        Method (_TMP, 0, Serialized)  // _TMP: Temperature
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Return (\_SB.PC00.LPCB.EC0.EC50 (0x9D))
            }
            Else
            {
                Return (0x0BB8)
            }
        }

        Name (PATC, 0x02)
        Name (AT0, Ones)
        Method (PAT0, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT0 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0x9E, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (AT1, Ones)
        Method (PAT1, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT1 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0x9F, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (GTSH, 0x14)
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN6)
    {
        Name (_STR, Unicode ("Charger1 Temperature Sensor"))  // _STR: Description String
        Method (_TMP, 0, Serialized)  // _TMP: Temperature
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Return (\_SB.PC00.LPCB.EC0.EC50 (0xA1))
            }
            Else
            {
                Return (0x0BB8)
            }
        }

        Name (PATC, 0x02)
        Name (AT0, Ones)
        Method (PAT0, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT0 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0xA2, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (AT1, Ones)
        Method (PAT1, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT1 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0xA3, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (GTSH, 0x14)
    }

    Scope (\_SB.PC00.LPCB.EC0.SEN7)
    {
        Name (_STR, Unicode ("Charger2 Temperature Sensor"))  // _STR: Description String
        Method (_TMP, 0, Serialized)  // _TMP: Temperature
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Return (\_SB.PC00.LPCB.EC0.EC50 (0xA5))
            }
            Else
            {
                Return (0x0BB8)
            }
        }

        Name (PATC, 0x02)
        Name (AT0, Ones)
        Method (PAT0, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT0 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0xA6, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (AT1, Ones)
        Method (PAT1, 1, Serialized)
        {
            If (\_SB.PC00.LPCB.EC0.ECAV ())
            {
                Local0 = Acquire (\_SB.PC00.LPCB.EC0.PATM, 0x0064)
                If ((Local0 == Zero))
                {
                    AT1 = Arg0
                    \_SB.PC00.LPCB.EC0.EC44 (0xA7, Arg0, Zero)
                    Release (\_SB.PC00.LPCB.EC0.PATM)
                }
            }
        }

        Name (GTSH, 0x14)
    }

    Scope (\_SB.IETM)
    {
        Method (TUAM, 0, Serialized)
        {
            \_SB.PC00.LPCB.EC0.REPL ()
            \_SB.PC00.LPCB.EC0.REFM ()
            \_SB.IETM.CETP (0x02)
            Notify (\_SB.PC00.TCPU, 0x91) // Device-Specific
        }
    }

    Scope (\_SB.PC00.LPCB.EC0)
    {
        Method (ECAV, 0, Serialized)
        {
            Return (\_SB.PC00.LPCB.ECST) /* External reference */
        }

        Method (TSSR, 0, Serialized)
        {
            Local0 = \_SB.PC00.LPCB.EC0.EC44 (0x6D, Zero, Zero)
            Return (((Local0 >> 0x08) & 0xFF))
        }

        Name (PEN1, Zero)
        Name (PEN2, Zero)
        Method (SEFD, 2, Serialized)
        {
            Switch (Arg1)
            {
                Case (One)
                {
                    PEN1 = Arg0
                }
                Case (0x02)
                {
                    PEN2 = Arg0
                }

            }

            REFD ()
        }

        Method (REFD, 0, Serialized)
        {
            If ((\_SB.IETM.P015 == One))
            {
                \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0x77, PEN1, Zero)
            }

            If ((\_SB.IETM.P056 == One))
            {
                \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0x77, PEN2, One)
            }
        }

        Name (CEFM, Zero)
        Method (SEFM, 1, Serialized)
        {
            CEFM = Arg0
            REFM ()
        }

        Method (REFM, 0, Serialized)
        {
            If ((\S0IX == 0x03))
            {
                \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0x79, 0x02, Zero)
            }
            ElseIf ((CEFM == Zero))
            {
                \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0x79, Zero, Zero)
            }
            Else
            {
                \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0x79, 0x05, Zero)
            }
        }

        Name (EPLE, One)
        Method (SEPL, 1, Serialized)
        {
            EPLE = Arg0
            REPL ()
        }

        Method (REPL, 0, Serialized)
        {
            Name (EPL1, 0xFF)
            Name (EPL2, 0xFF)
            Name (EPLT, Zero)
            If (((\S0IX == One) && (\PWRS == Zero)))
            {
                EPL1 = \_SB.IETM.P152
                EPL2 = \_SB.IETM.P154
                EPLT = \_SB.PC00.TCPU.CTN2 (\_SB.IETM.P153)
            }
            ElseIf ((\S0IX == 0x03))
            {
                EPL1 = \_SB.IETM.P164
                EPL2 = \_SB.IETM.P166
                EPLT = \_SB.PC00.TCPU.CTN2 (\_SB.IETM.P165)
            }
            ElseIf ((EPLE == One))
            {
                EPL1 = \_SB.IETM.P140
                EPL2 = \_SB.IETM.P143
                EPLT = \_SB.PC00.TCPU.CTN2 (\_SB.IETM.P142)
                If ((\_SB.PC00.LPCB.EC0.EC34 () > \_SB.IETM.CTOK (\_SB.IETM.P145)))
                {
                    EPL1 = \_SB.IETM.P141
                }
            }
            Else
            {
            }

            \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0xCA, EPL1, EPLT)
            \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0xCB, EPL2, Zero)
        }

        Method (SCGR, 1, Serialized)
        {
            \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0x6F, Arg0, Zero)
        }
    }

    Scope (\_SB.IETM)
    {
        Method (PTS, 1, Serialized)
        {
        }

        Method (WAK, 1, Serialized)
        {
            \_SB.PC00.LPCB.EC0.REPL ()
            \_SB.PC00.LPCB.EC0.REFM ()
            \_SB.PC00.LPCB.EC0.REFD ()
            \_SB.PC00.LPCB.EC0.SCGR (Zero)
        }
    }

    Scope (\_SB.IETM)
    {
        Method (GDDV, 0, Serialized)
        {
            If ((\THPN == Zero))
            {
                Return (Package (0x01)
                {
                    Buffer (0x0528)
                    {
                        /* 0000 */  0xE5, 0x1F, 0x94, 0x00, 0x00, 0x00, 0x00, 0x02,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x40, 0x67, 0x64, 0x64, 0x76,  // ...@gddv
                        /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x4F, 0x45, 0x4D, 0x20,  // ....OEM 
                        /* 0030 */  0x45, 0x78, 0x70, 0x6F, 0x72, 0x74, 0x65, 0x64,  // Exported
                        /* 0038 */  0x20, 0x44, 0x61, 0x74, 0x61, 0x56, 0x61, 0x75,  //  DataVau
                        /* 0040 */  0x6C, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // lt......
                        /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x8E, 0x2F, 0xE2, 0x9E,  // ...../..
                        /* 0070 */  0xE0, 0xD5, 0x3E, 0xAE, 0xC6, 0x2C, 0xA3, 0x7A,  // ..>..,.z
                        /* 0078 */  0x79, 0x23, 0x84, 0xFA, 0xCE, 0x86, 0x65, 0xF1,  // y#....e.
                        /* 0080 */  0x52, 0x8B, 0xC0, 0x29, 0x7B, 0x61, 0x77, 0xB0,  // R..){aw.
                        /* 0088 */  0x66, 0x26, 0x37, 0x82, 0x94, 0x04, 0x00, 0x00,  // f&7.....
                        /* 0090 */  0x52, 0x45, 0x50, 0x4F, 0x5D, 0x00, 0x00, 0x00,  // REPO]...
                        /* 0098 */  0x01, 0x48, 0x4F, 0x00, 0x00, 0x00, 0x00, 0x00,  // .HO.....
                        /* 00A0 */  0x00, 0x00, 0x72, 0x87, 0xCD, 0xFF, 0x6D, 0x24,  // ..r...m$
                        /* 00A8 */  0x47, 0xDB, 0x3D, 0x24, 0x92, 0xB4, 0x16, 0x6F,  // G.=$...o
                        /* 00B0 */  0x45, 0xD8, 0xC3, 0xF5, 0x66, 0x14, 0x9F, 0x22,  // E...f.."
                        /* 00B8 */  0xD7, 0xF7, 0xDE, 0x67, 0x90, 0x9A, 0xA2, 0x0D,  // ...g....
                        /* 00C0 */  0x39, 0x25, 0xAD, 0xC3, 0x1A, 0xAD, 0x52, 0x0B,  // 9%....R.
                        /* 00C8 */  0x75, 0x38, 0xE1, 0xA4, 0x14, 0x40, 0xAE, 0x4A,  // u8...@.J
                        /* 00D0 */  0x5D, 0x4F, 0x2D, 0x04, 0x48, 0x6C, 0xFB, 0x0A,  // ]O-.Hl..
                        /* 00D8 */  0xCF, 0xBA, 0xE5, 0xA0, 0x78, 0x1A, 0x3C, 0x1A,  // ....x.<.
                        /* 00E0 */  0x30, 0xA5, 0xFB, 0x6B, 0x08, 0xDE, 0xB2, 0xDC,  // 0..k....
                        /* 00E8 */  0x62, 0xF1, 0x1D, 0x82, 0x8A, 0x91, 0x44, 0x77,  // b.....Dw
                        /* 00F0 */  0x65, 0xD2, 0xE7, 0xE4, 0x5A, 0xCB, 0x8A, 0xA9,  // e...Z...
                        /* 00F8 */  0x88, 0x28, 0xD5, 0xBF, 0x3E, 0xAA, 0xCD, 0xF1,  // .(..>...
                        /* 0100 */  0x29, 0xB2, 0xF9, 0xF5, 0x38, 0xB1, 0x7A, 0xA0,  // )...8.z.
                        /* 0108 */  0x7C, 0xD4, 0x07, 0x7A, 0xC3, 0x7F, 0x4C, 0x80,  // |..z..L.
                        /* 0110 */  0x6B, 0xFB, 0x57, 0xD7, 0x30, 0xBB, 0x46, 0xE8,  // k.W.0.F.
                        /* 0118 */  0x1C, 0x84, 0x28, 0x59, 0x5B, 0x2A, 0xC9, 0xA0,  // ..(Y[*..
                        /* 0120 */  0x36, 0xF1, 0x29, 0x15, 0x2F, 0xFB, 0x36, 0x5D,  // 6.)./.6]
                        /* 0128 */  0xEE, 0xC8, 0xB4, 0xAB, 0xA7, 0x1A, 0xA0, 0xF1,  // ........
                        /* 0130 */  0x91, 0x33, 0xC8, 0x5C, 0x14, 0xF5, 0x12, 0xC6,  // .3.\....
                        /* 0138 */  0x00, 0x8D, 0x22, 0xEF, 0x48, 0x9F, 0xC0, 0x1A,  // ..".H...
                        /* 0140 */  0x91, 0xA6, 0xBF, 0xE0, 0xA1, 0x2D, 0x62, 0xBA,  // .....-b.
                        /* 0148 */  0xAE, 0x6B, 0x05, 0x26, 0xF8, 0x42, 0x0C, 0xE3,  // .k.&.B..
                        /* 0150 */  0xF9, 0xB4, 0x51, 0xF5, 0xD5, 0xF2, 0xAF, 0x33,  // ..Q....3
                        /* 0158 */  0xA8, 0x1F, 0xC9, 0x06, 0xCF, 0xC3, 0xF3, 0x12,  // ........
                        /* 0160 */  0x44, 0x83, 0xCE, 0x29, 0xA6, 0x9B, 0x09, 0x1F,  // D..)....
                        /* 0168 */  0x4B, 0x72, 0xDA, 0x60, 0x0C, 0x8E, 0x4D, 0x91,  // Kr.`..M.
                        /* 0170 */  0x83, 0x95, 0x90, 0x51, 0xE1, 0xD3, 0xB0, 0x54,  // ...Q...T
                        /* 0178 */  0x92, 0x07, 0x0A, 0x11, 0x20, 0xA1, 0x9B, 0x2A,  // .... ..*
                        /* 0180 */  0x26, 0x86, 0x32, 0x42, 0x0C, 0x20, 0x5F, 0x6C,  // &.2B. _l
                        /* 0188 */  0x4B, 0x0C, 0x45, 0x8F, 0xBD, 0x12, 0x2C, 0x79,  // K.E...,y
                        /* 0190 */  0x78, 0xBA, 0xD4, 0x84, 0xAC, 0x64, 0x8A, 0xD6,  // x....d..
                        /* 0198 */  0xC8, 0x42, 0x05, 0x92, 0x4F, 0x24, 0x0B, 0x12,  // .B..O$..
                        /* 01A0 */  0xDE, 0x48, 0x53, 0xF2, 0x5D, 0x30, 0xEB, 0x4C,  // .HS.]0.L
                        /* 01A8 */  0x1C, 0x43, 0x66, 0xDF, 0x14, 0x9E, 0x2E, 0x13,  // .Cf.....
                        /* 01B0 */  0xDC, 0xF9, 0xDB, 0x7B, 0xD8, 0x24, 0xE3, 0xAE,  // ...{.$..
                        /* 01B8 */  0x47, 0xA1, 0x71, 0xD0, 0xAE, 0x85, 0xA7, 0x36,  // G.q....6
                        /* 01C0 */  0x79, 0x09, 0xDD, 0x11, 0xC9, 0x89, 0xC0, 0x6B,  // y......k
                        /* 01C8 */  0xEC, 0x39, 0x4A, 0x18, 0x90, 0x4D, 0x1A, 0x53,  // .9J..M.S
                        /* 01D0 */  0x51, 0xCC, 0x00, 0x76, 0x42, 0x26, 0xA6, 0x5A,  // Q..vB&.Z
                        /* 01D8 */  0xB4, 0xBB, 0xC9, 0x59, 0xF7, 0xB8, 0x23, 0xAA,  // ...Y..#.
                        /* 01E0 */  0x52, 0xF9, 0xE8, 0x05, 0x41, 0xE4, 0x3C, 0xD3,  // R...A.<.
                        /* 01E8 */  0xF3, 0x7A, 0x31, 0x91, 0x55, 0xD7, 0xCA, 0x6A,  // .z1.U..j
                        /* 01F0 */  0x78, 0x14, 0x9B, 0x4C, 0x01, 0x99, 0xA1, 0x05,  // x..L....
                        /* 01F8 */  0xBF, 0x21, 0x1F, 0x7F, 0x4D, 0xEA, 0x78, 0x51,  // .!..M.xQ
                        /* 0200 */  0x57, 0x7D, 0xF6, 0xD6, 0x12, 0x07, 0x9C, 0x76,  // W}.....v
                        /* 0208 */  0x05, 0xF7, 0x0D, 0x34, 0x0D, 0x0B, 0xD3, 0x08,  // ...4....
                        /* 0210 */  0xF3, 0x4B, 0x4C, 0xE6, 0x05, 0x0B, 0x68, 0x18,  // .KL...h.
                        /* 0218 */  0x0A, 0x08, 0x11, 0x0A, 0xC1, 0xE3, 0x18, 0xD9,  // ........
                        /* 0220 */  0x4C, 0xEB, 0x4E, 0x6A, 0xD7, 0x1C, 0x96, 0xCA,  // L.Nj....
                        /* 0228 */  0x76, 0xC6, 0x8F, 0x41, 0x0A, 0xBF, 0xBB, 0x2D,  // v..A...-
                        /* 0230 */  0xA1, 0x3A, 0xB2, 0x07, 0x71, 0x15, 0x6A, 0x6F,  // .:..q.jo
                        /* 0238 */  0x24, 0x53, 0xF5, 0x2C, 0x18, 0xA3, 0x90, 0x36,  // $S.,...6
                        /* 0240 */  0xEB, 0x3E, 0x97, 0xFB, 0x47, 0x6E, 0x77, 0x78,  // .>..Gnwx
                        /* 0248 */  0x08, 0x7A, 0x8E, 0xE6, 0x0D, 0x85, 0xD0, 0x18,  // .z......
                        /* 0250 */  0x2D, 0xF0, 0xC3, 0x9A, 0xF0, 0xD5, 0xC5, 0x66,  // -......f
                        /* 0258 */  0x83, 0x14, 0x2A, 0x8D, 0xDC, 0x22, 0xA7, 0xD7,  // ..*.."..
                        /* 0260 */  0xCB, 0x46, 0x8A, 0xE0, 0xF2, 0x27, 0xB5, 0x63,  // .F...'.c
                        /* 0268 */  0xD2, 0x00, 0xB9, 0x74, 0x4A, 0xF3, 0xCA, 0x75,  // ...tJ..u
                        /* 0270 */  0x66, 0xCA, 0x73, 0xE1, 0x93, 0x9B, 0x9D, 0x30,  // f.s....0
                        /* 0278 */  0x2A, 0x83, 0x72, 0xF0, 0x38, 0x26, 0x0F, 0xF5,  // *.r.8&..
                        /* 0280 */  0x0D, 0x0C, 0xB6, 0xF1, 0x00, 0xA5, 0x73, 0xE6,  // ......s.
                        /* 0288 */  0x70, 0x3D, 0x3A, 0x1F, 0x36, 0xD5, 0xC7, 0x0B,  // p=:.6...
                        /* 0290 */  0x14, 0xAA, 0x32, 0x8B, 0xC6, 0x97, 0xDC, 0x68,  // ..2....h
                        /* 0298 */  0x38, 0x18, 0x74, 0xB4, 0x17, 0x27, 0x48, 0x69,  // 8.t..'Hi
                        /* 02A0 */  0x89, 0xD1, 0x37, 0x98, 0x52, 0x03, 0x38, 0x39,  // ..7.R.89
                        /* 02A8 */  0x34, 0x52, 0xAB, 0xAB, 0x55, 0x02, 0x33, 0x3E,  // 4R..U.3>
                        /* 02B0 */  0x02, 0xF2, 0x9C, 0x0D, 0x23, 0x57, 0xC8, 0xB4,  // ....#W..
                        /* 02B8 */  0x49, 0x84, 0x85, 0x7A, 0x3A, 0x48, 0x96, 0x57,  // I..z:H.W
                        /* 02C0 */  0xF1, 0x98, 0x89, 0x42, 0x1A, 0xDE, 0x3C, 0xE4,  // ...B..<.
                        /* 02C8 */  0xCC, 0x0E, 0x5B, 0xC3, 0x73, 0xA5, 0x4C, 0x6D,  // ..[.s.Lm
                        /* 02D0 */  0xAF, 0x5E, 0xFB, 0xB4, 0xA0, 0xC9, 0x39, 0x4C,  // .^....9L
                        /* 02D8 */  0xE5, 0x9F, 0x6A, 0x21, 0xEC, 0xE3, 0xE4, 0x07,  // ..j!....
                        /* 02E0 */  0x69, 0x27, 0xF8, 0x5B, 0x21, 0x02, 0x09, 0xA5,  // i'.[!...
                        /* 02E8 */  0x18, 0xE4, 0xCA, 0x03, 0x27, 0x13, 0x8F, 0x3D,  // ....'..=
                        /* 02F0 */  0x55, 0xBC, 0x5A, 0xDF, 0x76, 0x4E, 0xBF, 0xA9,  // U.Z.vN..
                        /* 02F8 */  0x9D, 0x45, 0x6B, 0x98, 0xEA, 0xD2, 0x48, 0x5E,  // .Ek...H^
                        /* 0300 */  0x7C, 0x7D, 0x32, 0x17, 0x9A, 0xDB, 0x94, 0xC3,  // |}2.....
                        /* 0308 */  0x4E, 0x90, 0x2A, 0x85, 0x56, 0xD4, 0x94, 0x65,  // N.*.V..e
                        /* 0310 */  0xD0, 0xFB, 0x28, 0x05, 0x51, 0x54, 0x05, 0x5E,  // ..(.QT.^
                        /* 0318 */  0x17, 0xA2, 0xC3, 0x2B, 0xDA, 0x12, 0x9A, 0x80,  // ...+....
                        /* 0320 */  0xB6, 0x9D, 0xBD, 0xBC, 0x66, 0x6E, 0xB0, 0xB4,  // ....fn..
                        /* 0328 */  0x4B, 0x3C, 0xCD, 0x8F, 0x6A, 0x15, 0x34, 0x23,  // K<..j.4#
                        /* 0330 */  0x92, 0x88, 0x51, 0x00, 0xA1, 0x05, 0x09, 0x53,  // ..Q....S
                        /* 0338 */  0x24, 0x95, 0x69, 0x3D, 0x7D, 0x1D, 0x4B, 0x68,  // $.i=}.Kh
                        /* 0340 */  0x3F, 0x3F, 0xE5, 0xD9, 0x52, 0xB2, 0x84, 0x20,  // ??..R.. 
                        /* 0348 */  0x5B, 0x52, 0x05, 0x85, 0x52, 0x94, 0x42, 0x12,  // [R..R.B.
                        /* 0350 */  0x99, 0x63, 0x67, 0x72, 0x38, 0x2B, 0x34, 0x21,  // .cgr8+4!
                        /* 0358 */  0x5C, 0x61, 0xD6, 0x19, 0xCA, 0x69, 0x9B, 0x64,  // \a...i.d
                        /* 0360 */  0xD0, 0x4E, 0x60, 0x5B, 0xD1, 0xBA, 0xF3, 0xB8,  // .N`[....
                        /* 0368 */  0x3B, 0x2B, 0xFB, 0x74, 0x3E, 0xB1, 0xF3, 0xC0,  // ;+.t>...
                        /* 0370 */  0xF7, 0xDB, 0xD1, 0x1F, 0x9E, 0x9C, 0x78, 0x83,  // ......x.
                        /* 0378 */  0x0C, 0x14, 0x12, 0xD8, 0x41, 0x0D, 0x9B, 0xBA,  // ....A...
                        /* 0380 */  0xFC, 0xC1, 0x7A, 0xBA, 0x29, 0xF4, 0x94, 0x38,  // ..z.)..8
                        /* 0388 */  0xE6, 0x1A, 0x40, 0xA6, 0x9F, 0xE8, 0x8E, 0x85,  // ..@.....
                        /* 0390 */  0x48, 0x0C, 0x3C, 0xA2, 0xE4, 0xD9, 0x1C, 0x06,  // H.<.....
                        /* 0398 */  0xAD, 0xD3, 0x4C, 0xFC, 0x89, 0x2E, 0x69, 0xE1,  // ..L...i.
                        /* 03A0 */  0x74, 0x15, 0xE9, 0x7C, 0x9B, 0x0C, 0xBE, 0x0C,  // t..|....
                        /* 03A8 */  0xE6, 0xCC, 0x7A, 0x09, 0x0E, 0x89, 0x32, 0x54,  // ..z...2T
                        /* 03B0 */  0x55, 0x13, 0x26, 0x61, 0xE7, 0xB6, 0xE9, 0x7F,  // U.&a....
                        /* 03B8 */  0xB3, 0x0B, 0x9E, 0x51, 0xA3, 0x75, 0xB7, 0x5B,  // ...Q.u.[
                        /* 03C0 */  0x23, 0x5A, 0xE0, 0x72, 0xFB, 0xA7, 0xA2, 0x89,  // #Z.r....
                        /* 03C8 */  0x50, 0x9B, 0x26, 0x3F, 0x7D, 0x2E, 0xD8, 0xF4,  // P.&?}...
                        /* 03D0 */  0x54, 0x89, 0xF9, 0x43, 0xCA, 0x8F, 0x56, 0xCC,  // T..C..V.
                        /* 03D8 */  0xDE, 0x87, 0x1F, 0x0E, 0x25, 0xB9, 0x9B, 0x83,  // ....%...
                        /* 03E0 */  0xE3, 0x48, 0x05, 0x23, 0x2C, 0x72, 0xA4, 0x1A,  // .H.#,r..
                        /* 03E8 */  0xC3, 0x7C, 0x8E, 0xAA, 0x9E, 0xD6, 0xF0, 0xFE,  // .|......
                        /* 03F0 */  0x2A, 0xBC, 0xA1, 0x64, 0xFD, 0x38, 0x3A, 0x89,  // *..d.8:.
                        /* 03F8 */  0x41, 0x50, 0x31, 0x86, 0x9D, 0xE3, 0x43, 0x80,  // AP1...C.
                        /* 0400 */  0x11, 0x3D, 0x9A, 0x9F, 0xBA, 0xF2, 0x2E, 0x9D,  // .=......
                        /* 0408 */  0x85, 0xA1, 0xF4, 0xC2, 0x63, 0x7E, 0x8E, 0xBE,  // ....c~..
                        /* 0410 */  0xC9, 0xD0, 0xE1, 0x2C, 0x9C, 0x8F, 0xF5, 0x53,  // ...,...S
                        /* 0418 */  0x4D, 0x1F, 0x95, 0xEC, 0x50, 0x38, 0x8F, 0xEB,  // M...P8..
                        /* 0420 */  0x08, 0xC1, 0x91, 0x78, 0xD5, 0x82, 0x03, 0x26,  // ...x...&
                        /* 0428 */  0xB6, 0x28, 0x42, 0x86, 0x89, 0xAE, 0xFD, 0x15,  // .(B.....
                        /* 0430 */  0xB0, 0x2D, 0xCE, 0x8B, 0x2C, 0xBD, 0x5B, 0x10,  // .-..,.[.
                        /* 0438 */  0xA4, 0xF9, 0xB5, 0x68, 0xFD, 0x63, 0xF1, 0xF6,  // ...h.c..
                        /* 0440 */  0x33, 0x2A, 0x80, 0xDD, 0xBE, 0x37, 0x44, 0x7E,  // 3*...7D~
                        /* 0448 */  0x77, 0xD1, 0x58, 0x10, 0x41, 0x60, 0x47, 0x2C,  // w.X.A`G,
                        /* 0450 */  0xAA, 0x57, 0xDD, 0x91, 0x54, 0x25, 0x10, 0x24,  // .W..T%.$
                        /* 0458 */  0x88, 0xC1, 0xE5, 0xF4, 0x4F, 0xD4, 0x16, 0x9D,  // ....O...
                        /* 0460 */  0x93, 0x96, 0xFA, 0x49, 0x8F, 0xAE, 0x3C, 0xBC,  // ...I..<.
                        /* 0468 */  0xF4, 0x42, 0x1E, 0xD3, 0xBB, 0xD5, 0x99, 0x47,  // .B.....G
                        /* 0470 */  0xB8, 0x8F, 0xF7, 0x11, 0x16, 0x1E, 0xC3, 0xE9,  // ........
                        /* 0478 */  0xBB, 0x07, 0x72, 0x7E, 0x65, 0x2C, 0x59, 0x82,  // ..r~e,Y.
                        /* 0480 */  0x3F, 0x3C, 0x82, 0xAF, 0x4D, 0x7D, 0xCB, 0x84,  // ?<..M}..
                        /* 0488 */  0xFF, 0x1E, 0x80, 0x4A, 0xCD, 0x21, 0x18, 0xB0,  // ...J.!..
                        /* 0490 */  0xAB, 0xE4, 0xB6, 0xAD, 0xD7, 0x81, 0x7B, 0x67,  // ......{g
                        /* 0498 */  0xB1, 0xCC, 0x60, 0xD7, 0x5D, 0x5A, 0x86, 0xD5,  // ..`.]Z..
                        /* 04A0 */  0x0C, 0x78, 0xA6, 0x21, 0x01, 0xEE, 0x44, 0x3F,  // .x.!..D?
                        /* 04A8 */  0xBD, 0xC9, 0x03, 0x44, 0x46, 0x59, 0x7F, 0x79,  // ...DFY.y
                        /* 04B0 */  0x03, 0x47, 0xD4, 0x73, 0xCE, 0x43, 0x01, 0x3F,  // .G.s.C.?
                        /* 04B8 */  0x3D, 0x3D, 0x4F, 0x1D, 0x4A, 0x03, 0x97, 0xC3,  // ==O.J...
                        /* 04C0 */  0x94, 0x83, 0x3D, 0xF6, 0x14, 0xF5, 0x84, 0x2F,  // ..=..../
                        /* 04C8 */  0x83, 0x0C, 0xE2, 0xCE, 0x88, 0xC6, 0xA0, 0xEB,  // ........
                        /* 04D0 */  0xB0, 0x1D, 0x2A, 0x5E, 0xCA, 0x73, 0x52, 0xD4,  // ..*^.sR.
                        /* 04D8 */  0xC3, 0x3A, 0x62, 0x54, 0xAA, 0xA7, 0xF4, 0x59,  // .:bT...Y
                        /* 04E0 */  0x83, 0x3A, 0xE9, 0x2A, 0xBE, 0x3C, 0xFF, 0xE3,  // .:.*.<..
                        /* 04E8 */  0xBB, 0x7B, 0x82, 0x9E, 0xCC, 0x6B, 0x84, 0x5C,  // .{...k.\
                        /* 04F0 */  0x61, 0x9C, 0x86, 0x8A, 0x6D, 0x87, 0x79, 0x02,  // a...m.y.
                        /* 04F8 */  0xD1, 0x5B, 0xAD, 0x6A, 0xB7, 0x9D, 0x84, 0x92,  // .[.j....
                        /* 0500 */  0x3D, 0x73, 0xEB, 0x88, 0x3C, 0x78, 0x11, 0xCF,  // =s..<x..
                        /* 0508 */  0xAB, 0xF7, 0x21, 0x59, 0xAC, 0x20, 0x4B, 0x24,  // ..!Y. K$
                        /* 0510 */  0xCE, 0x7C, 0x1D, 0x5E, 0x44, 0x2B, 0xB6, 0x16,  // .|.^D+..
                        /* 0518 */  0xFC, 0x55, 0x26, 0x86, 0xA6, 0xE9, 0x86, 0x62,  // .U&....b
                        /* 0520 */  0xA2, 0x83, 0xA9, 0x47, 0xF5, 0x3C, 0xE0, 0x52   // ...G.<.R
                    }
                })
            }
            Else
            {
                Return (Package (0x01)
                {
                    Buffer (0x0643)
                    {
                        /* 0000 */  0xE5, 0x1F, 0x94, 0x00, 0x00, 0x00, 0x00, 0x02,  // ........
                        /* 0008 */  0x00, 0x00, 0x00, 0x40, 0x67, 0x64, 0x64, 0x76,  // ...@gddv
                        /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0018 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0028 */  0x00, 0x00, 0x00, 0x00, 0x4F, 0x45, 0x4D, 0x20,  // ....OEM 
                        /* 0030 */  0x45, 0x78, 0x70, 0x6F, 0x72, 0x74, 0x65, 0x64,  // Exported
                        /* 0038 */  0x20, 0x44, 0x61, 0x74, 0x61, 0x56, 0x61, 0x75,  //  DataVau
                        /* 0040 */  0x6C, 0x74, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // lt......
                        /* 0048 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0050 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0058 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                        /* 0068 */  0x00, 0x00, 0x00, 0x00, 0x6E, 0x59, 0x63, 0xD6,  // ....nYc.
                        /* 0070 */  0x5E, 0xD9, 0x99, 0x65, 0x3F, 0xB9, 0xDD, 0xE7,  // ^..e?...
                        /* 0078 */  0xAA, 0xFF, 0x27, 0xAC, 0xF3, 0xEF, 0xD4, 0x84,  // ..'.....
                        /* 0080 */  0xAF, 0xA5, 0x7F, 0x5D, 0x4E, 0xB2, 0x0C, 0xE9,  // ...]N...
                        /* 0088 */  0x69, 0xD3, 0x1F, 0x50, 0xAF, 0x05, 0x00, 0x00,  // i..P....
                        /* 0090 */  0x52, 0x45, 0x50, 0x4F, 0x5D, 0x00, 0x00, 0x00,  // REPO]...
                        /* 0098 */  0x01, 0x6A, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // .jr.....
                        /* 00A0 */  0x00, 0x00, 0x72, 0x87, 0xCD, 0xFF, 0x6D, 0x24,  // ..r...m$
                        /* 00A8 */  0x47, 0xDB, 0x3D, 0x24, 0x92, 0xB4, 0x16, 0x6F,  // G.=$...o
                        /* 00B0 */  0x45, 0xD8, 0xC3, 0xF5, 0x66, 0x14, 0x9F, 0x22,  // E...f.."
                        /* 00B8 */  0xD7, 0xF7, 0xDE, 0x67, 0x90, 0x9A, 0xA2, 0x0D,  // ...g....
                        /* 00C0 */  0x39, 0x25, 0xAD, 0xC3, 0x1A, 0xAD, 0x52, 0x0B,  // 9%....R.
                        /* 00C8 */  0x75, 0x38, 0xE1, 0xA4, 0x14, 0x44, 0x99, 0xB3,  // u8...D..
                        /* 00D0 */  0x63, 0x65, 0x9F, 0x13, 0x16, 0x81, 0x99, 0x0E,  // ce......
                        /* 00D8 */  0x7D, 0xFF, 0xDA, 0x31, 0x64, 0x92, 0x16, 0x18,  // }..1d...
                        /* 00E0 */  0xBF, 0x42, 0x0E, 0xA2, 0x44, 0x00, 0x89, 0x10,  // .B..D...
                        /* 00E8 */  0x40, 0x15, 0x01, 0xB3, 0x73, 0x32, 0x79, 0x57,  // @...s2yW
                        /* 00F0 */  0x11, 0x98, 0xDA, 0x1E, 0x81, 0x5E, 0x41, 0x44,  // .....^AD
                        /* 00F8 */  0x7E, 0xC1, 0x19, 0xC1, 0x26, 0xE7, 0x5C, 0x24,  // ~...&.\$
                        /* 0100 */  0xB4, 0x0F, 0xE7, 0xF1, 0xC4, 0xDF, 0x55, 0x5D,  // ......U]
                        /* 0108 */  0x92, 0xD0, 0x06, 0x53, 0x76, 0x1A, 0x77, 0xF8,  // ...Sv.w.
                        /* 0110 */  0x67, 0xAB, 0x0E, 0xEA, 0x9C, 0x00, 0x65, 0x2A,  // g.....e*
                        /* 0118 */  0x32, 0xB3, 0xE0, 0xE5, 0x13, 0x5C, 0x94, 0x93,  // 2....\..
                        /* 0120 */  0xF6, 0x8C, 0xBF, 0xA2, 0x6E, 0x0B, 0xAF, 0x0F,  // ....n...
                        /* 0128 */  0x86, 0xA7, 0xA8, 0x9B, 0x70, 0x82, 0xAE, 0x6D,  // ....p..m
                        /* 0130 */  0xCA, 0xC8, 0xC9, 0x0B, 0x0D, 0x66, 0x3E, 0xCF,  // .....f>.
                        /* 0138 */  0x47, 0xB2, 0x1A, 0xCB, 0x0C, 0x32, 0xFF, 0x04,  // G....2..
                        /* 0140 */  0xEC, 0x24, 0x42, 0x79, 0xFB, 0xA5, 0x16, 0x21,  // .$By...!
                        /* 0148 */  0xE3, 0x96, 0xBB, 0x32, 0xEA, 0x71, 0xB9, 0xD0,  // ...2.q..
                        /* 0150 */  0x74, 0xFA, 0x6F, 0xC7, 0x03, 0x85, 0xB2, 0xD0,  // t.o.....
                        /* 0158 */  0xB3, 0xBE, 0x5B, 0xA6, 0x68, 0x8C, 0xA4, 0x4B,  // ..[.h..K
                        /* 0160 */  0xFA, 0x89, 0x60, 0xF4, 0x7C, 0x00, 0x65, 0x17,  // ..`.|.e.
                        /* 0168 */  0x0E, 0x52, 0x31, 0xD9, 0x06, 0x0A, 0x32, 0x6A,  // .R1...2j
                        /* 0170 */  0x2B, 0x11, 0xF2, 0x04, 0x91, 0x08, 0xEA, 0xCB,  // +.......
                        /* 0178 */  0x1A, 0xE1, 0xF3, 0xDC, 0x56, 0x1B, 0x9D, 0xCE,  // ....V...
                        /* 0180 */  0x33, 0x93, 0x58, 0x9A, 0x59, 0x8E, 0xD4, 0xC7,  // 3.X.Y...
                        /* 0188 */  0x23, 0xD7, 0x31, 0xFB, 0x84, 0x10, 0xB3, 0x80,  // #.1.....
                        /* 0190 */  0xB5, 0x62, 0x73, 0x91, 0x14, 0xB0, 0xD0, 0x05,  // .bs.....
                        /* 0198 */  0xA3, 0x39, 0x40, 0x2E, 0x83, 0x85, 0x7E, 0x1B,  // .9@...~.
                        /* 01A0 */  0x8C, 0xAB, 0x38, 0x3A, 0xF7, 0x54, 0xFE, 0x00,  // ..8:.T..
                        /* 01A8 */  0x0F, 0x0F, 0xBD, 0x84, 0x5D, 0xDE, 0xDE, 0x68,  // ....]..h
                        /* 01B0 */  0xC8, 0xEA, 0xBD, 0x75, 0x4A, 0xC9, 0xE0, 0x6C,  // ...uJ..l
                        /* 01B8 */  0x85, 0xD1, 0x50, 0xD4, 0x2B, 0x4D, 0x0E, 0x99,  // ..P.+M..
                        /* 01C0 */  0x7A, 0x3A, 0xA8, 0x08, 0x13, 0xB4, 0xC6, 0x98,  // z:......
                        /* 01C8 */  0xE4, 0xFF, 0xC1, 0x69, 0xEC, 0x13, 0x0F, 0x1E,  // ...i....
                        /* 01D0 */  0x6A, 0x35, 0x98, 0x4D, 0x80, 0xA1, 0x10, 0x86,  // j5.M....
                        /* 01D8 */  0x38, 0x35, 0x3F, 0x7A, 0xB8, 0x80, 0x54, 0x3D,  // 85?z..T=
                        /* 01E0 */  0x7A, 0xE4, 0x00, 0xA1, 0xC4, 0x79, 0x4F, 0x1F,  // z....yO.
                        /* 01E8 */  0xB5, 0x48, 0xBC, 0xCE, 0xCA, 0x5B, 0x1D, 0x4B,  // .H...[.K
                        /* 01F0 */  0xC6, 0xEC, 0x21, 0xFF, 0x8D, 0x86, 0x83, 0x17,  // ..!.....
                        /* 01F8 */  0xBE, 0xD2, 0xBE, 0x4E, 0xF3, 0xD4, 0xD6, 0xFE,  // ...N....
                        /* 0200 */  0xEE, 0xB1, 0x73, 0x4F, 0xCA, 0x46, 0x7E, 0xDC,  // ..sO.F~.
                        /* 0208 */  0xAD, 0xBC, 0x41, 0x00, 0xCA, 0x25, 0xE6, 0xD5,  // ..A..%..
                        /* 0210 */  0xFE, 0xCC, 0x5E, 0x83, 0x40, 0xA7, 0xA3, 0x3E,  // ..^.@..>
                        /* 0218 */  0x02, 0xA0, 0xEF, 0xED, 0xE3, 0xB0, 0x04, 0xC6,  // ........
                        /* 0220 */  0x8A, 0x6B, 0xFF, 0x42, 0xB3, 0x70, 0x63, 0xA2,  // .k.B.pc.
                        /* 0228 */  0xB1, 0x15, 0x2F, 0x9C, 0x33, 0xC9, 0x78, 0xF2,  // ../.3.x.
                        /* 0230 */  0x8B, 0xD4, 0x5E, 0xC1, 0xE0, 0x2A, 0x38, 0x7F,  // ..^..*8.
                        /* 0238 */  0x90, 0x34, 0x1C, 0x6B, 0x05, 0xB1, 0xE4, 0x11,  // .4.k....
                        /* 0240 */  0xDD, 0xD6, 0x5B, 0x0A, 0xA1, 0x6F, 0x0D, 0x64,  // ..[..o.d
                        /* 0248 */  0x7C, 0xD4, 0xBE, 0xC2, 0xAF, 0x72, 0xCB, 0x60,  // |....r.`
                        /* 0250 */  0xD0, 0x48, 0xD4, 0xE1, 0xA8, 0xC1, 0xA4, 0x59,  // .H.....Y
                        /* 0258 */  0x7A, 0x17, 0xA6, 0x66, 0xB8, 0xD1, 0x46, 0xAF,  // z..f..F.
                        /* 0260 */  0x66, 0x39, 0x28, 0x30, 0x86, 0x81, 0xB8, 0x81,  // f9(0....
                        /* 0268 */  0x61, 0xD8, 0x88, 0x82, 0xFD, 0x1A, 0x83, 0xDF,  // a.......
                        /* 0270 */  0x03, 0xCD, 0x5E, 0x50, 0x8A, 0x01, 0xE1, 0x37,  // ..^P...7
                        /* 0278 */  0xDA, 0x7B, 0x7F, 0xA0, 0x6A, 0x6F, 0x81, 0x11,  // .{..jo..
                        /* 0280 */  0xBF, 0xC1, 0xFA, 0x4F, 0x46, 0xE8, 0x97, 0xA9,  // ...OF...
                        /* 0288 */  0x18, 0xDF, 0xF6, 0x47, 0x41, 0x9B, 0xF4, 0x65,  // ...GA..e
                        /* 0290 */  0xCB, 0x57, 0xE1, 0x12, 0x06, 0xFD, 0x5F, 0x84,  // .W...._.
                        /* 0298 */  0x28, 0x40, 0x2D, 0x5A, 0x89, 0x42, 0x49, 0x55,  // (@-Z.BIU
                        /* 02A0 */  0x0C, 0x71, 0x0C, 0x70, 0x12, 0xD0, 0x37, 0x3D,  // .q.p..7=
                        /* 02A8 */  0x14, 0x26, 0x8A, 0x5F, 0xEF, 0x3F, 0xD0, 0x63,  // .&._.?.c
                        /* 02B0 */  0xE1, 0x56, 0x91, 0xC5, 0xE4, 0x21, 0x7B, 0x4A,  // .V...!{J
                        /* 02B8 */  0xD6, 0x60, 0x4C, 0xC0, 0x4B, 0x6F, 0x85, 0x73,  // .`L.Ko.s
                        /* 02C0 */  0xD1, 0x13, 0x7B, 0x88, 0xDF, 0x90, 0x77, 0x9E,  // ..{...w.
                        /* 02C8 */  0x40, 0x63, 0x38, 0x01, 0xF6, 0x08, 0x10, 0x67,  // @c8....g
                        /* 02D0 */  0xC1, 0x84, 0x87, 0x40, 0xB5, 0x90, 0x3F, 0x11,  // ...@..?.
                        /* 02D8 */  0x55, 0xA1, 0x02, 0x13, 0x51, 0x4A, 0xAA, 0x63,  // U...QJ.c
                        /* 02E0 */  0xDF, 0x0E, 0x92, 0xEA, 0x43, 0x65, 0xE0, 0x6D,  // ....Ce.m
                        /* 02E8 */  0xAF, 0x45, 0xFD, 0x01, 0x34, 0x16, 0x7E, 0x51,  // .E..4.~Q
                        /* 02F0 */  0xB2, 0x26, 0x64, 0xA7, 0xCE, 0x8A, 0x5D, 0xF5,  // .&d...].
                        /* 02F8 */  0xD6, 0x41, 0x1A, 0xA6, 0xE1, 0xA2, 0xB6, 0x29,  // .A.....)
                        /* 0300 */  0x8F, 0x8D, 0xE0, 0x5D, 0x33, 0xAE, 0x70, 0x89,  // ...]3.p.
                        /* 0308 */  0x13, 0x0D, 0xCD, 0x19, 0x8D, 0x47, 0xE8, 0x0C,  // .....G..
                        /* 0310 */  0x9D, 0x6B, 0x89, 0xE6, 0x51, 0xA9, 0x39, 0x33,  // .k..Q.93
                        /* 0318 */  0x00, 0x1F, 0x65, 0xBE, 0x66, 0xD0, 0x1A, 0xDB,  // ..e.f...
                        /* 0320 */  0x99, 0x7A, 0xB4, 0x6C, 0xE6, 0x11, 0x3F, 0x19,  // .z.l..?.
                        /* 0328 */  0x1E, 0xF9, 0x76, 0x13, 0x76, 0x2E, 0xD4, 0x8A,  // ..v.v...
                        /* 0330 */  0xA8, 0x1F, 0x93, 0xB9, 0xD1, 0x08, 0x1B, 0xE8,  // ........
                        /* 0338 */  0xC0, 0x82, 0xB3, 0x90, 0x52, 0x33, 0x9E, 0xC5,  // ....R3..
                        /* 0340 */  0x41, 0x27, 0x19, 0xFE, 0xA8, 0x25, 0x14, 0x56,  // A'...%.V
                        /* 0348 */  0x5F, 0x2E, 0x64, 0x28, 0xAA, 0xA2, 0x3B, 0x47,  // _.d(..;G
                        /* 0350 */  0x22, 0x62, 0xDC, 0x8E, 0xA5, 0xBC, 0xBE, 0xFB,  // "b......
                        /* 0358 */  0x5F, 0xEF, 0x38, 0x72, 0xC0, 0xEB, 0x1A, 0x6E,  // _.8r...n
                        /* 0360 */  0x31, 0xDB, 0xE4, 0x9D, 0x96, 0x15, 0x78, 0x9C,  // 1.....x.
                        /* 0368 */  0x2F, 0x4A, 0xCE, 0x11, 0x9E, 0x86, 0x35, 0xCF,  // /J....5.
                        /* 0370 */  0x1A, 0xCD, 0x36, 0x1A, 0x39, 0x20, 0x35, 0xBB,  // ..6.9 5.
                        /* 0378 */  0x94, 0xCF, 0x25, 0xAD, 0x65, 0xC7, 0xF0, 0xED,  // ..%.e...
                        /* 0380 */  0x18, 0x16, 0xAC, 0xE8, 0x78, 0xA4, 0x9F, 0xB9,  // ....x...
                        /* 0388 */  0xC8, 0x1F, 0xA6, 0x19, 0xCF, 0xD7, 0x18, 0x46,  // .......F
                        /* 0390 */  0xB5, 0x64, 0xF9, 0x0E, 0xBD, 0xAC, 0xA7, 0x7B,  // .d.....{
                        /* 0398 */  0xAE, 0xB4, 0xCA, 0xAA, 0x0A, 0xA9, 0x5B, 0x7D,  // ......[}
                        /* 03A0 */  0xBC, 0x14, 0x6E, 0xA4, 0xDF, 0x9B, 0x76, 0xDF,  // ..n...v.
                        /* 03A8 */  0xEA, 0x24, 0x04, 0x6E, 0xA2, 0x6F, 0x76, 0x5D,  // .$.n.ov]
                        /* 03B0 */  0x9C, 0x6A, 0xB7, 0x02, 0x96, 0x1F, 0x11, 0x23,  // .j.....#
                        /* 03B8 */  0x9B, 0xC6, 0xA1, 0x0B, 0xED, 0x1F, 0x3E, 0x97,  // ......>.
                        /* 03C0 */  0xEA, 0x02, 0x4A, 0xA6, 0xEE, 0xD3, 0xFB, 0xE7,  // ..J.....
                        /* 03C8 */  0xA3, 0x0C, 0x44, 0x4D, 0x32, 0x9B, 0x45, 0x26,  // ..DM2.E&
                        /* 03D0 */  0x1D, 0x35, 0xAF, 0xE0, 0x89, 0x92, 0xB0, 0x39,  // .5.....9
                        /* 03D8 */  0xE4, 0x77, 0x22, 0x5E, 0x05, 0xFD, 0x10, 0x27,  // .w"^...'
                        /* 03E0 */  0x72, 0x4E, 0x30, 0x2B, 0x5C, 0xD4, 0x7F, 0x02,  // rN0+\...
                        /* 03E8 */  0x57, 0x95, 0xED, 0x13, 0x1B, 0xF7, 0xB3, 0xF9,  // W.......
                        /* 03F0 */  0x02, 0x26, 0xB4, 0x3F, 0xFA, 0xCE, 0xC4, 0xA9,  // .&.?....
                        /* 03F8 */  0x1D, 0x1A, 0x28, 0x5C, 0x04, 0xBA, 0xDE, 0x06,  // ..(\....
                        /* 0400 */  0x09, 0x6C, 0xB8, 0x1F, 0xD9, 0xB5, 0xC1, 0xA6,  // .l......
                        /* 0408 */  0xE6, 0x94, 0x83, 0x47, 0xF7, 0xA0, 0x97, 0x7A,  // ...G...z
                        /* 0410 */  0xA9, 0xC4, 0x1F, 0x6A, 0xFD, 0x37, 0xAE, 0xC7,  // ...j.7..
                        /* 0418 */  0x78, 0xEB, 0x8B, 0x4F, 0x9F, 0x02, 0x80, 0x9A,  // x..O....
                        /* 0420 */  0x5B, 0x3E, 0x81, 0xFA, 0x8A, 0x63, 0x3F, 0x81,  // [>...c?.
                        /* 0428 */  0xB0, 0x8C, 0x65, 0x0F, 0x8D, 0x79, 0x99, 0xDA,  // ..e..y..
                        /* 0430 */  0x58, 0x82, 0xCA, 0x0E, 0x4E, 0xC8, 0x4A, 0x73,  // X...N.Js
                        /* 0438 */  0x15, 0xCC, 0x5E, 0xB3, 0xAF, 0x0B, 0xF0, 0x83,  // ..^.....
                        /* 0440 */  0xE0, 0x42, 0xF8, 0x0D, 0xE0, 0xD1, 0x44, 0xB7,  // .B....D.
                        /* 0448 */  0xC9, 0xD6, 0x15, 0x9D, 0xC8, 0xC9, 0x56, 0x97,  // ......V.
                        /* 0450 */  0x6B, 0x31, 0xDB, 0x37, 0xB2, 0xED, 0xA4, 0xE7,  // k1.7....
                        /* 0458 */  0x4D, 0x4A, 0xF3, 0xBC, 0xAB, 0x6D, 0x7B, 0x74,  // MJ...m{t
                        /* 0460 */  0x61, 0xFC, 0x98, 0x69, 0x48, 0x80, 0xCD, 0xED,  // a..iH...
                        /* 0468 */  0xFC, 0x13, 0xFA, 0x11, 0x76, 0x85, 0x39, 0x32,  // ....v.92
                        /* 0470 */  0xB1, 0xA0, 0x80, 0x6C, 0xC4, 0x4D, 0x4F, 0xFD,  // ...l.MO.
                        /* 0478 */  0x01, 0x5E, 0xAC, 0x52, 0x1F, 0xD7, 0xD8, 0xBA,  // .^.R....
                        /* 0480 */  0xB9, 0xA6, 0x56, 0x06, 0xA3, 0x3C, 0xCA, 0xF6,  // ..V..<..
                        /* 0488 */  0xB9, 0x8F, 0xE2, 0x7F, 0xD6, 0xAA, 0x3A, 0x6E,  // ......:n
                        /* 0490 */  0xEC, 0x63, 0x91, 0x57, 0x74, 0x39, 0x80, 0x3E,  // .c.Wt9.>
                        /* 0498 */  0xBC, 0x38, 0x2F, 0x31, 0x66, 0xB8, 0xA9, 0xE4,  // .8/1f...
                        /* 04A0 */  0x97, 0xB1, 0x89, 0xEB, 0x08, 0xE6, 0xBA, 0x3B,  // .......;
                        /* 04A8 */  0x25, 0x16, 0x8D, 0x74, 0x7F, 0x8B, 0x68, 0x7A,  // %..t..hz
                        /* 04B0 */  0x67, 0x7E, 0x3D, 0xCD, 0x4D, 0x2B, 0x7D, 0xD3,  // g~=.M+}.
                        /* 04B8 */  0xE7, 0x57, 0x13, 0x6A, 0x99, 0x69, 0xDC, 0x81,  // .W.j.i..
                        /* 04C0 */  0xB2, 0x80, 0x44, 0x86, 0x2A, 0x16, 0x90, 0xC9,  // ..D.*...
                        /* 04C8 */  0xC7, 0x08, 0x09, 0x3D, 0x06, 0x4C, 0x04, 0xF6,  // ...=.L..
                        /* 04D0 */  0x28, 0xBA, 0x7A, 0x42, 0xB9, 0x34, 0xBB, 0xB1,  // (.zB.4..
                        /* 04D8 */  0x67, 0x0A, 0x12, 0xFA, 0x41, 0x64, 0x4B, 0xB6,  // g...AdK.
                        /* 04E0 */  0x2B, 0x00, 0xF1, 0xB0, 0xB6, 0x60, 0x9F, 0x77,  // +....`.w
                        /* 04E8 */  0x79, 0x4A, 0xF6, 0x8D, 0xCC, 0x80, 0x8A, 0xE6,  // yJ......
                        /* 04F0 */  0x53, 0x35, 0xBF, 0x78, 0x71, 0xF4, 0x1C, 0xA7,  // S5.xq...
                        /* 04F8 */  0x0A, 0x33, 0xE8, 0xCA, 0xBF, 0x72, 0x7F, 0xEB,  // .3...r..
                        /* 0500 */  0xD9, 0x3D, 0x11, 0x1C, 0x05, 0xB2, 0x6A, 0x28,  // .=....j(
                        /* 0508 */  0x9C, 0x00, 0x3A, 0xFA, 0x6D, 0xE6, 0x0B, 0xF5,  // ..:.m...
                        /* 0510 */  0x84, 0x4B, 0x02, 0xD8, 0x98, 0x56, 0x53, 0x18,  // .K...VS.
                        /* 0518 */  0xE6, 0x9A, 0x75, 0xBD, 0x8F, 0x1B, 0x39, 0xE0,  // ..u...9.
                        /* 0520 */  0x62, 0x60, 0x1A, 0x0D, 0x86, 0x9F, 0x0B, 0x19,  // b`......
                        /* 0528 */  0x9F, 0xD3, 0x12, 0xBE, 0x3F, 0xE2, 0x24, 0xAA,  // ....?.$.
                        /* 0530 */  0x47, 0x7E, 0xB9, 0xE0, 0xA1, 0x91, 0xB2, 0xDE,  // G~......
                        /* 0538 */  0xEF, 0x64, 0x5F, 0x08, 0x0F, 0xCF, 0x8B, 0x86,  // .d_.....
                        /* 0540 */  0x14, 0x9D, 0xCF, 0x34, 0x37, 0xC6, 0xA5, 0x91,  // ...47...
                        /* 0548 */  0xCB, 0xC0, 0xB7, 0xD8, 0x24, 0xAF, 0x1B, 0xEE,  // ....$...
                        /* 0550 */  0xEC, 0x13, 0x76, 0x5C, 0x57, 0xB1, 0x7D, 0x23,  // ..v\W.}#
                        /* 0558 */  0xDD, 0x13, 0x13, 0x7D, 0x90, 0xF7, 0xBB, 0x4B,  // ...}...K
                        /* 0560 */  0x39, 0x6B, 0x8C, 0x57, 0x50, 0x7B, 0x6E, 0x4F,  // 9k.WP{nO
                        /* 0568 */  0x0F, 0x24, 0xF4, 0x7E, 0x23, 0x75, 0xD3, 0xC0,  // .$.~#u..
                        /* 0570 */  0x88, 0xFE, 0x8C, 0x0B, 0x06, 0x8E, 0x38, 0xD3,  // ......8.
                        /* 0578 */  0xA1, 0xE3, 0x4F, 0xC9, 0xD1, 0x50, 0x5E, 0xD2,  // ..O..P^.
                        /* 0580 */  0x63, 0xB4, 0xED, 0x0E, 0xD1, 0xF9, 0xCE, 0x5F,  // c......_
                        /* 0588 */  0xEC, 0xCC, 0xBE, 0xA6, 0x07, 0xE5, 0x8C, 0x88,  // ........
                        /* 0590 */  0x13, 0x99, 0xA0, 0x44, 0xFE, 0xA3, 0xAC, 0x8A,  // ...D....
                        /* 0598 */  0x34, 0x83, 0xE3, 0x3C, 0x97, 0xBC, 0xBB, 0xEC,  // 4..<....
                        /* 05A0 */  0x0E, 0x44, 0x2E, 0x7A, 0xCB, 0xA4, 0x54, 0x9B,  // .D.z..T.
                        /* 05A8 */  0x3A, 0xE3, 0x2E, 0xEE, 0x51, 0x0D, 0xB2, 0x13,  // :...Q...
                        /* 05B0 */  0x9E, 0x21, 0xF3, 0x32, 0x25, 0xC5, 0x8C, 0xC5,  // .!.2%...
                        /* 05B8 */  0xF8, 0x86, 0x0A, 0xFF, 0x42, 0x3B, 0x14, 0xA5,  // ....B;..
                        /* 05C0 */  0xC7, 0x7A, 0x6E, 0xB7, 0xE3, 0x96, 0x2F, 0x16,  // .zn.../.
                        /* 05C8 */  0x29, 0xA7, 0xF9, 0xF7, 0x4C, 0xD7, 0xEB, 0x53,  // )...L..S
                        /* 05D0 */  0xD9, 0x9D, 0x9F, 0xF0, 0x4B, 0x63, 0x75, 0xB0,  // ....Kcu.
                        /* 05D8 */  0xEB, 0x09, 0x42, 0x42, 0xFE, 0xE9, 0xC1, 0xB7,  // ..BB....
                        /* 05E0 */  0x3E, 0x25, 0xF5, 0x06, 0x7F, 0xFF, 0x8A, 0x2A,  // >%.....*
                        /* 05E8 */  0x95, 0x8F, 0x66, 0x22, 0xFC, 0x7D, 0x7E, 0x10,  // ..f".}~.
                        /* 05F0 */  0xD4, 0x9F, 0x58, 0xD1, 0x0D, 0xB1, 0x21, 0xB7,  // ..X...!.
                        /* 05F8 */  0x3E, 0x9C, 0xD3, 0x3A, 0x06, 0x38, 0x96, 0x66,  // >..:.8.f
                        /* 0600 */  0x6C, 0xC5, 0x0E, 0x83, 0x3E, 0x1C, 0x08, 0xD5,  // l...>...
                        /* 0608 */  0x0B, 0x9F, 0x93, 0xB2, 0x70, 0x2D, 0x47, 0x67,  // ....p-Gg
                        /* 0610 */  0x33, 0x91, 0xF8, 0xBC, 0x16, 0xCB, 0x1A, 0x09,  // 3.......
                        /* 0618 */  0xCD, 0x0C, 0x72, 0x06, 0x2B, 0x85, 0x04, 0x26,  // ..r.+..&
                        /* 0620 */  0x6B, 0xFA, 0x24, 0xBE, 0x72, 0xBE, 0xB2, 0x82,  // k.$.r...
                        /* 0628 */  0xEA, 0xAE, 0x6C, 0x9E, 0xEA, 0xB1, 0xC7, 0x20,  // ..l.... 
                        /* 0630 */  0xC5, 0x04, 0xC4, 0xAF, 0x66, 0xA8, 0x9F, 0x72,  // ....f..r
                        /* 0638 */  0xEE, 0xA3, 0x12, 0x59, 0x3A, 0xC9, 0xC9, 0xD9,  // ...Y:...
                        /* 0640 */  0x59, 0x15, 0x16                                 // Y..
                    }
                })
            }
        }

        Method (IMOK, 1, NotSerialized)
        {
            Return (Arg0)
        }
    }
}

