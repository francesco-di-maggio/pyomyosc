{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 34.0, 92.0, 1372.0, 711.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1188.0, 492.0, 70.0, 22.0 ],
                    "text": "loadmess 2"
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1188.0, 528.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 945.0, 528.0, 79.0, 22.0 ],
                    "text": "prepend gyro"
                }
            },
            {
                "box": {
                    "id": "obj-101",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 829.0, 528.0, 84.0, 22.0 ],
                    "text": "prepend accel"
                }
            },
            {
                "box": {
                    "id": "obj-102",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 713.0, 528.0, 79.0, 22.0 ],
                    "text": "prepend emg"
                }
            },
            {
                "box": {
                    "id": "obj-103",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1062.0, 528.0, 79.0, 22.0 ],
                    "text": "prepend quat"
                }
            },
            {
                "box": {
                    "id": "obj-106",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 713.0, 577.0, 63.0, 22.0 ],
                    "text": "prepend 2"
                }
            },
            {
                "box": {
                    "id": "obj-107",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 713.0, 626.0, 41.0, 22.0 ],
                    "text": "s myo"
                }
            },
            {
                "box": {
                    "dontreplace": 1,
                    "id": "obj-108",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1188.0, 373.0, 168.0, 22.0 ],
                    "text": "right x_toward_elbow"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-109",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1188.0, 300.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "dontreplace": 1,
                    "id": "obj-110",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1188.0, 337.0, 97.0, 22.0 ],
                    "text": "rest"
                }
            },
            {
                "box": {
                    "id": "obj-111",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1062.0, 300.0, 105.0, 22.0 ],
                    "text": "vexpr $f1 / 16384."
                }
            },
            {
                "box": {
                    "id": "obj-112",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 945.0, 300.0, 98.0, 22.0 ],
                    "text": "vexpr $f1 / 4096."
                }
            },
            {
                "box": {
                    "id": "obj-113",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 713.0, 300.0, 91.0, 22.0 ],
                    "text": "vexpr $f1 / 128."
                }
            },
            {
                "box": {
                    "id": "obj-114",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 829.0, 300.0, 98.0, 22.0 ],
                    "text": "vexpr $f1 / 2048."
                }
            },
            {
                "box": {
                    "candycane": 8,
                    "contdata": 1,
                    "id": "obj-115",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1062.0, 337.0, 91.0, 177.0 ],
                    "setstyle": 3,
                    "signed": 1,
                    "size": 4,
                    "spacing": 2
                }
            },
            {
                "box": {
                    "candycane": 8,
                    "contdata": 1,
                    "id": "obj-116",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 945.0, 337.0, 91.0, 177.0 ],
                    "setstyle": 3,
                    "signed": 1,
                    "size": 3,
                    "spacing": 2
                }
            },
            {
                "box": {
                    "candycane": 8,
                    "contdata": 1,
                    "id": "obj-117",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 829.0, 337.0, 91.0, 177.0 ],
                    "setstyle": 3,
                    "signed": 1,
                    "size": 3,
                    "spacing": 2
                }
            },
            {
                "box": {
                    "id": "obj-118",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 8,
                    "outlettype": [ "", "", "", "", "", "", "", "FullPacket" ],
                    "patching_rect": [ 713.0, 238.0, 274.0, 22.0 ],
                    "text": "o.route /emg /accel /gyro /quat /battery /pose /arm"
                }
            },
            {
                "box": {
                    "candycane": 8,
                    "contdata": 1,
                    "id": "obj-119",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 713.0, 337.0, 91.0, 177.0 ],
                    "setstyle": 3,
                    "signed": 1,
                    "size": 8,
                    "spacing": 2
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 493.5, 491.5, 70.0, 22.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "obj-95",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 493.5, 528.0, 72.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-92",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 250.66666666666669, 528.0, 79.0, 22.0 ],
                    "text": "prepend gyro"
                }
            },
            {
                "box": {
                    "id": "obj-91",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 134.33333333333334, 528.0, 84.0, 22.0 ],
                    "text": "prepend accel"
                }
            },
            {
                "box": {
                    "id": "obj-90",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 18.0, 528.0, 79.0, 22.0 ],
                    "text": "prepend emg"
                }
            },
            {
                "box": {
                    "id": "obj-85",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 367.0, 528.0, 79.0, 22.0 ],
                    "text": "prepend quat"
                }
            },
            {
                "box": {
                    "id": "obj-82",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 18.0, 577.0, 63.0, 22.0 ],
                    "text": "prepend 1"
                }
            },
            {
                "box": {
                    "id": "obj-65",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 458.0, 13.0, 37.0, 20.0 ],
                    "text": "index"
                }
            },
            {
                "box": {
                    "id": "obj-63",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 627.0, 37.0, 55.0, 22.0 ],
                    "text": "vibrate 3"
                }
            },
            {
                "box": {
                    "id": "obj-62",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 568.0, 37.0, 55.0, 22.0 ],
                    "text": "vibrate 2"
                }
            },
            {
                "box": {
                    "id": "obj-61",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 59.0, 111.0, 271.0, 322.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-49",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 32.0, 195.0, 29.5, 22.0 ],
                                    "text": "join"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-48",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 191.0, 86.0, 55.0, 22.0 ],
                                    "text": "zl.slice 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-41",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 76.0, 266.0, 165.0, 22.0 ],
                                    "text": "/myo/1/led 0 200 30"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-16",
                                    "maxclass": "newobj",
                                    "numinlets": 4,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 32.0, 139.0, 178.0, 22.0 ],
                                    "text": "combine /myo/ 1 / s @triggers 3"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-58",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 85.0, 23.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-59",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 191.0, 23.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-60",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 32.0, 262.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-49", 0 ],
                                    "midpoints": [ 41.5, 163.0000001982422, 41.5, 163.0000001982422 ],
                                    "source": [ "obj-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 3 ],
                                    "midpoints": [ 200.5, 109.00000019824219, 200.5, 109.00000019824219 ],
                                    "source": [ "obj-48", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-49", 1 ],
                                    "midpoints": [ 236.5, 181.0000001982422, 52.0, 181.0000001982422 ],
                                    "source": [ "obj-48", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-41", 1 ],
                                    "midpoints": [ 41.5, 247.00000019824222, 231.5, 247.00000019824222 ],
                                    "order": 0,
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-60", 0 ],
                                    "midpoints": [ 41.5, 220.0000001982422, 41.5, 220.0000001982422 ],
                                    "order": 1,
                                    "source": [ "obj-49", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-16", 1 ],
                                    "midpoints": [ 94.5, 55.00000019824219, 94.5, 55.00000019824219 ],
                                    "source": [ "obj-58", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-48", 0 ],
                                    "midpoints": [ 200.5, 55.00000019824219, 200.5, 55.00000019824219 ],
                                    "source": [ "obj-59", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 451.0, 82.0, 77.0, 22.0 ],
                    "text": "p commands"
                }
            },
            {
                "box": {
                    "dontreplace": 1,
                    "id": "obj-51",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 602.0, 134.0, 185.0, 22.0 ],
                    "text": "/myo/1/led 0 200 30"
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 509.0, 37.0, 55.0, 22.0 ],
                    "text": "vibrate 1"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "number",
                    "maximum": 2,
                    "minimum": 1,
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 451.0, 37.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "FullPacket" ],
                    "patching_rect": [ 18.0, 186.0, 73.0, 22.0 ],
                    "text": "o.route /1 /2"
                }
            },
            {
                "box": {
                    "id": "obj-44",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 18.0, 626.0, 41.0, 22.0 ],
                    "text": "s myo"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 791.0, 37.0, 75.0, 22.0 ],
                    "text": "led 0 200 30"
                }
            },
            {
                "box": {
                    "id": "obj-37",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 719.0, 37.0, 68.0, 22.0 ],
                    "text": "led 255 0 0"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 451.0, 134.0, 135.0, 22.0 ],
                    "text": "udpsend localhost 8001"
                }
            },
            {
                "box": {
                    "dontreplace": 1,
                    "id": "obj-32",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 493.5, 373.0, 168.0, 22.0 ],
                    "text": "left x_toward_elbow"
                }
            },
            {
                "box": {
                    "format": 6,
                    "id": "obj-15",
                    "maxclass": "flonum",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 493.5, 300.0, 50.0, 22.0 ]
                }
            },
            {
                "box": {
                    "dontreplace": 1,
                    "id": "obj-8",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 493.5, 336.5, 97.0, 22.0 ],
                    "text": "wave_in"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 367.0, 300.0, 105.0, 22.0 ],
                    "text": "vexpr $f1 / 16384."
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 250.66666666666669, 300.0, 98.0, 22.0 ],
                    "text": "vexpr $f1 / 4096."
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 18.0, 300.0, 91.0, 22.0 ],
                    "text": "vexpr $f1 / 128."
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 134.33333333333334, 300.0, 98.0, 22.0 ],
                    "text": "vexpr $f1 / 2048."
                }
            },
            {
                "box": {
                    "candycane": 8,
                    "contdata": 1,
                    "id": "obj-13",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 367.0, 336.5, 91.0, 177.0 ],
                    "setstyle": 3,
                    "signed": 1,
                    "size": 4,
                    "spacing": 2
                }
            },
            {
                "box": {
                    "candycane": 8,
                    "contdata": 1,
                    "id": "obj-12",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 250.66666666666669, 336.5, 91.0, 177.0 ],
                    "setstyle": 3,
                    "signed": 1,
                    "size": 3,
                    "spacing": 2
                }
            },
            {
                "box": {
                    "candycane": 8,
                    "contdata": 1,
                    "id": "obj-11",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 134.33333333333334, 336.5, 91.0, 177.0 ],
                    "setstyle": 3,
                    "signed": 1,
                    "size": 3,
                    "spacing": 2
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 8,
                    "outlettype": [ "", "", "", "", "", "", "", "FullPacket" ],
                    "patching_rect": [ 18.0, 238.0, 274.0, 22.0 ],
                    "text": "o.route /emg /accel /gyro /quat /battery /pose /arm"
                }
            },
            {
                "box": {
                    "candycane": 8,
                    "contdata": 1,
                    "id": "obj-9",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 18.0, 336.5, 91.0, 177.0 ],
                    "setstyle": 3,
                    "signed": 1,
                    "size": 8,
                    "spacing": 2
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "FullPacket" ],
                    "patching_rect": [ 18.0, 134.0, 75.0, 22.0 ],
                    "text": "o.route /myo"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 18.0, 82.0, 97.0, 22.0 ],
                    "text": "udpreceive 8000"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "midpoints": [ 27.5, 105.0, 27.5, 105.0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "midpoints": [ 173.21428571428572, 285.0, 503.0, 285.0 ],
                    "source": [ "obj-10", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "midpoints": [ 63.92857142857143, 285.0, 143.83333333333334, 285.0 ],
                    "source": [ "obj-10", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "midpoints": [ 27.5, 261.0, 27.5, 261.0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "midpoints": [ 100.35714285714286, 285.0, 260.1666666666667, 285.0 ],
                    "source": [ "obj-10", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 1 ],
                    "midpoints": [ 246.07142857142858, 285.0, 652.0, 285.0 ],
                    "source": [ "obj-10", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 136.78571428571428, 285.0, 376.5, 285.0 ],
                    "source": [ "obj-10", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 1 ],
                    "midpoints": [ 209.64285714285714, 285.0, 581.0, 285.0 ],
                    "source": [ "obj-10", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "midpoints": [ 954.5, 564.0, 722.5, 564.0 ],
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "midpoints": [ 838.5, 564.0, 722.5, 564.0 ],
                    "source": [ "obj-101", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "midpoints": [ 722.5, 552.0, 722.5, 552.0 ],
                    "source": [ "obj-102", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "midpoints": [ 1071.5, 564.0, 722.5, 564.0 ],
                    "source": [ "obj-103", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-107", 0 ],
                    "midpoints": [ 722.5, 600.0, 722.5, 600.0 ],
                    "source": [ "obj-106", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-91", 0 ],
                    "midpoints": [ 143.83333333333334, 516.0, 143.83333333333334, 516.0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-115", 0 ],
                    "midpoints": [ 1071.5, 324.0, 1071.5, 324.0 ],
                    "source": [ "obj-111", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-116", 0 ],
                    "midpoints": [ 954.5, 324.0, 954.5, 324.0 ],
                    "source": [ "obj-112", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-119", 0 ],
                    "midpoints": [ 722.5, 324.0, 722.5, 324.0 ],
                    "source": [ "obj-113", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-117", 0 ],
                    "midpoints": [ 838.5, 324.0, 838.5, 324.0 ],
                    "source": [ "obj-114", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-103", 0 ],
                    "midpoints": [ 1071.5, 516.0, 1071.5, 516.0 ],
                    "source": [ "obj-115", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-100", 0 ],
                    "midpoints": [ 954.5, 516.0, 954.5, 516.0 ],
                    "source": [ "obj-116", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-101", 0 ],
                    "midpoints": [ 838.5, 516.0, 838.5, 516.0 ],
                    "source": [ "obj-117", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-108", 1 ],
                    "midpoints": [ 941.0714285714286, 285.0, 1346.5, 285.0 ],
                    "source": [ "obj-118", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-109", 0 ],
                    "midpoints": [ 868.2142857142858, 285.0, 1197.5, 285.0 ],
                    "source": [ "obj-118", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-110", 1 ],
                    "midpoints": [ 904.6428571428571, 285.0, 1275.5, 285.0 ],
                    "source": [ "obj-118", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-111", 0 ],
                    "midpoints": [ 831.7857142857143, 285.0, 1071.5, 285.0 ],
                    "source": [ "obj-118", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-112", 0 ],
                    "midpoints": [ 795.3571428571429, 285.0, 954.5, 285.0 ],
                    "source": [ "obj-118", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-113", 0 ],
                    "midpoints": [ 722.5, 261.0, 722.5, 261.0 ],
                    "source": [ "obj-118", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-114", 0 ],
                    "midpoints": [ 758.9285714285714, 285.0, 838.5, 285.0 ],
                    "source": [ "obj-118", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-102", 0 ],
                    "midpoints": [ 722.5, 516.0, 722.5, 516.0 ],
                    "source": [ "obj-119", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-92", 0 ],
                    "midpoints": [ 260.1666666666667, 516.0, 260.1666666666667, 516.0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-85", 0 ],
                    "midpoints": [ 376.5, 516.0, 376.5, 516.0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "midpoints": [ 143.83333333333334, 324.0, 143.83333333333334, 324.0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "midpoints": [ 27.5, 324.0, 27.5, 324.0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "midpoints": [ 460.5, 60.0, 460.5, 60.0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 1 ],
                    "midpoints": [ 518.5, 60.0, 518.5, 60.0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "midpoints": [ 260.1666666666667, 324.0, 260.1666666666667, 324.0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 1 ],
                    "midpoints": [ 728.5, 69.0, 518.5, 69.0 ],
                    "source": [ "obj-37", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 1 ],
                    "midpoints": [ 800.5, 69.0, 518.5, 69.0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "midpoints": [ 27.5, 159.0, 27.5, 159.0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-13", 0 ],
                    "midpoints": [ 376.5, 324.0, 376.5, 324.0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "midpoints": [ 460.5, 105.0, 460.5, 105.0 ],
                    "order": 1,
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 1 ],
                    "midpoints": [ 460.5, 120.0, 777.5, 120.0 ],
                    "order": 0,
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 1 ],
                    "midpoints": [ 577.5, 69.0, 518.5, 69.0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 1 ],
                    "midpoints": [ 636.5, 69.0, 518.5, 69.0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "midpoints": [ 27.5, 210.0, 27.5, 210.0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-118", 0 ],
                    "midpoints": [ 54.5, 225.0, 722.5, 225.0 ],
                    "source": [ "obj-7", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "midpoints": [ 27.5, 600.0, 27.5, 600.0 ],
                    "source": [ "obj-82", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "midpoints": [ 376.5, 564.0, 27.5, 564.0 ],
                    "source": [ "obj-85", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-90", 0 ],
                    "midpoints": [ 27.5, 516.0, 27.5, 516.0 ],
                    "source": [ "obj-9", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "midpoints": [ 27.5, 552.0, 27.5, 552.0 ],
                    "source": [ "obj-90", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "midpoints": [ 143.83333333333334, 564.0, 27.5, 564.0 ],
                    "source": [ "obj-91", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "midpoints": [ 260.1666666666667, 564.0, 27.5, 564.0 ],
                    "source": [ "obj-92", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-82", 0 ],
                    "midpoints": [ 503.0, 564.0, 27.5, 564.0 ],
                    "source": [ "obj-95", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-95", 0 ],
                    "midpoints": [ 503.0, 516.0, 503.0, 516.0 ],
                    "source": [ "obj-96", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-98", 0 ],
                    "midpoints": [ 1197.5, 516.0, 1197.5, 516.0 ],
                    "source": [ "obj-97", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-106", 0 ],
                    "midpoints": [ 1197.5, 564.0, 722.5, 564.0 ],
                    "source": [ "obj-98", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}