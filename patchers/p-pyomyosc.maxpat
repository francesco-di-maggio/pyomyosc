{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 2,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ -243.0, -1022.0, 1920.0, 1022.0 ],
        "openrect": [ 0.0, 0.0, 533.0, 293.0 ],
        "openrectmode": 0,
        "bglocked": 1,
        "openinpresentation": 1,
        "default_fontname": "Avenir Next",
        "gridonopen": 2,
        "gridsize": [ 10.0, 10.0 ],
        "toolbars_unpinned_last_save": 15,
        "subpatcher_template": " ",
        "helpsidebarclosed": 1,
        "title": " ",
        "boxes": [
            {
                "box": {
                    "id": "obj-51",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 887.0, 185.0, 78.0, 25.0 ],
                    "text": "s #0-voice"
                }
            },
            {
                "box": {
                    "id": "obj-42",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 59.0, 110.0, 299.0, 388.0 ],
                        "subpatcher_template": " ",
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-86",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.5, 155.0, 33.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 50.0, 286.0, 105.0, 22.0 ],
                                    "text": "OSC-route /index"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-157",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 163.5, 100.0, 92.0, 22.0 ],
                                    "text": "sprintf set 1 /%i"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-148",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "" ],
                                    "patching_rect": [ 50.5, 197.0, 98.0, 22.0 ],
                                    "text": "OSC-route /myo"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-101",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.5, 319.0, 104.0, 22.0 ],
                                    "text": "s #0-pyomyosc"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-32",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 117.5, 40.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-33",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 64.5, 40.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-39",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 163.5, 40.0, 75.0, 22.0 ],
                                    "text": "r #0-voice"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-101", 0 ],
                                    "midpoints": [ 59.5, 315.0, 60.0, 315.0 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 60.0, 282.0, 59.5, 282.0 ],
                                    "source": [ "obj-148", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "midpoints": [ 173.0, 273.0, 59.5, 273.0 ],
                                    "source": [ "obj-157", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-86", 0 ],
                                    "midpoints": [ 127.0, 141.0, 60.0, 141.0 ],
                                    "source": [ "obj-32", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-86", 1 ],
                                    "midpoints": [ 74.0, 72.0, 74.0, 72.0 ],
                                    "source": [ "obj-33", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-157", 0 ],
                                    "midpoints": [ 173.0, 72.0, 173.0, 72.0 ],
                                    "source": [ "obj-39", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-148", 0 ],
                                    "midpoints": [ 60.0, 180.0, 60.0, 180.0 ],
                                    "source": [ "obj-86", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 46.0, 286.0, 63.0, 25.0 ],
                    "text": "p receiver"
                }
            },
            {
                "box": {
                    "id": "obj-168",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 59.0, 111.0, 271.0, 322.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "int" ],
                                    "patching_rect": [ 85.0, 86.0, 29.5, 22.0 ],
                                    "text": "+ 0"
                                }
                            },
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
                                    "text": "/myo/1/vibrate 1"
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
                                    "outlettype": [ "int" ],
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
                                    "destination": [ "obj-16", 1 ],
                                    "source": [ "obj-1", 0 ]
                                }
                            },
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
                                    "destination": [ "obj-1", 0 ],
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
                    "patching_rect": [ 1324.0, 251.0, 80.0, 25.0 ],
                    "text": "p commands"
                }
            },
            {
                "box": {
                    "id": "obj-34",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1324.0, 291.0, 141.0, 25.0 ],
                    "text": "udpsend localhost 8001"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.301961, 0.301961, 0.301961, 1.0 ],
                    "bgcolor2": [ 0.301961, 0.301961, 0.301961, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.2, 0.2, 0.2, 0.0 ],
                    "bgfillcolor_color1": [ 0.301961, 0.301961, 0.301961, 1.0 ],
                    "bgfillcolor_color2": [ 0.2, 0.2, 0.2, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "dontreplace": 1,
                    "fontname": "Krungthep",
                    "fontsize": 10.0,
                    "gradient": 1,
                    "id": "obj-152",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 579.0, 685.0, 134.79999214410782, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 245.1111129373312, 12.666666761040688, 173.9311601817608, 21.0 ],
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-100",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 41.0, 465.0, 71.0, 25.0 ],
                    "text": "loadmess 1"
                }
            },
            {
                "box": {
                    "id": "obj-149",
                    "maxclass": "newobj",
                    "numinlets": 4,
                    "numoutlets": 7,
                    "outlettype": [ "", "", "", "", "", "", "" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 1,
                            "revision": 2,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "box",
                        "rect": [ 51.0, -631.0, 934.0, 530.0 ],
                        "subpatcher_template": " ",
                        "boxes": [
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 772.2857142857143, 363.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 657.5714285714286, 363.0, 72.0, 22.0 ],
                                    "text": "prepend set"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-1",
                                    "index": 7,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 772.2857142857143, 444.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-53",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 428.14285714285717, 178.0, 94.0, 22.0 ],
                                    "text": "vexpr $f1 / 128."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-51",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 313.42857142857144, 178.0, 108.0, 22.0 ],
                                    "text": "vexpr $f1 / 16384."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-42",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 198.71428571428572, 178.0, 101.0, 22.0 ],
                                    "text": "vexpr $f1 / 4096."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-39",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 84.0, 178.0, 101.0, 22.0 ],
                                    "text": "vexpr $f1 / 2048."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-34",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 8,
                                    "outlettype": [ "", "", "", "", "", "", "", "" ],
                                    "patching_rect": [ 84.0, 138.0, 822.0, 22.0 ],
                                    "text": "OSC-route /accel /gyro /quat /emg /battery /pose /arm"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-33",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 84.0, 100.0, 101.0, 22.0 ],
                                    "text": "r #0-pyomyosc"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-93",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 235.0, 363.0, 53.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-92",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 172.0, 363.0, 53.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-91",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 113.0, 363.0, 53.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-89",
                                    "maxclass": "newobj",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 363.0, 53.0, 22.0 ],
                                    "text": "gate"
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-107",
                                    "index": 1,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 50.0, 40.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-109",
                                    "index": 2,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 113.0, 227.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-115",
                                    "index": 3,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 172.0, 227.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-123",
                                    "index": 4,
                                    "maxclass": "inlet",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 234.21428571428572, 227.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-125",
                                    "index": 1,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 50.0, 448.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-129",
                                    "index": 6,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 658.0, 444.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-131",
                                    "index": 5,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 543.0, 444.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-136",
                                    "index": 2,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 113.0, 448.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-138",
                                    "index": 3,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 172.0, 448.0, 30.0, 30.0 ]
                                }
                            },
                            {
                                "box": {
                                    "comment": "",
                                    "id": "obj-139",
                                    "index": 4,
                                    "maxclass": "outlet",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 235.0, 448.0, 30.0, 30.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-89", 0 ],
                                    "midpoints": [ 59.5, 72.0, 59.5, 72.0 ],
                                    "source": [ "obj-107", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-91", 0 ],
                                    "midpoints": [ 122.5, 258.0, 122.5, 258.0 ],
                                    "source": [ "obj-109", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 0 ],
                                    "midpoints": [ 181.5, 258.0, 181.5, 258.0 ],
                                    "source": [ "obj-115", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-93", 0 ],
                                    "midpoints": [ 243.71428571428572, 258.0, 244.5, 258.0 ],
                                    "source": [ "obj-123", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-129", 0 ],
                                    "source": [ "obj-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-34", 0 ],
                                    "midpoints": [ 93.5, 123.0, 93.5, 123.0 ],
                                    "source": [ "obj-33", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-131", 0 ],
                                    "midpoints": [ 552.3571428571429, 162.0, 552.5, 162.0 ],
                                    "source": [ "obj-34", 4 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-3", 0 ],
                                    "source": [ "obj-34", 5 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-39", 0 ],
                                    "midpoints": [ 93.5, 162.0, 93.5, 162.0 ],
                                    "source": [ "obj-34", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-4", 0 ],
                                    "source": [ "obj-34", 6 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-42", 0 ],
                                    "midpoints": [ 208.21428571428572, 162.0, 208.21428571428572, 162.0 ],
                                    "source": [ "obj-34", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-51", 0 ],
                                    "midpoints": [ 322.92857142857144, 162.0, 322.92857142857144, 162.0 ],
                                    "source": [ "obj-34", 2 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-53", 0 ],
                                    "midpoints": [ 437.64285714285717, 162.0, 437.64285714285717, 162.0 ],
                                    "source": [ "obj-34", 3 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-89", 1 ],
                                    "midpoints": [ 93.5, 201.0, 93.5, 201.0 ],
                                    "source": [ "obj-39", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-1", 0 ],
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-91", 1 ],
                                    "midpoints": [ 208.21428571428572, 213.0, 156.5, 213.0 ],
                                    "source": [ "obj-42", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-92", 1 ],
                                    "midpoints": [ 322.92857142857144, 348.0, 215.5, 348.0 ],
                                    "source": [ "obj-51", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-93", 1 ],
                                    "midpoints": [ 437.64285714285717, 348.0, 278.5, 348.0 ],
                                    "source": [ "obj-53", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-125", 0 ],
                                    "midpoints": [ 59.5, 387.0, 59.5, 387.0 ],
                                    "source": [ "obj-89", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-136", 0 ],
                                    "midpoints": [ 122.5, 387.0, 122.5, 387.0 ],
                                    "source": [ "obj-91", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-138", 0 ],
                                    "midpoints": [ 181.5, 387.0, 181.5, 387.0 ],
                                    "source": [ "obj-92", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-139", 0 ],
                                    "midpoints": [ 244.5, 387.0, 244.5, 387.0 ],
                                    "source": [ "obj-93", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 41.0, 594.0, 210.0, 25.0 ],
                    "text": "p data"
                }
            },
            {
                "box": {
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 767.0, 465.0, 62.0, 25.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 750.0, 185.0, 111.0, 25.0 ],
                    "text": "sprintf set /myo/%i"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Avenir Next",
                    "id": "obj-37",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 766.0, 278.0, 79.0, 23.0 ],
                    "text": "device name",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.301961, 0.301961, 0.301961, 1.0 ],
                    "bgcolor2": [ 0.301961, 0.301961, 0.301961, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.2, 0.2, 0.2, 0.0 ],
                    "bgfillcolor_color1": [ 0.301961, 0.301961, 0.301961, 1.0 ],
                    "bgfillcolor_color2": [ 0.2, 0.2, 0.2, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "dontreplace": 1,
                    "fontname": "Krungthep",
                    "fontsize": 10.0,
                    "gradient": 1,
                    "id": "obj-44",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 750.0, 250.0, 110.71739077568054, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 139.5, 12.5, 90.79283714294434, 21.0 ],
                    "text": "/myo/1",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-31",
                    "linecolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "maxclass": "live.line",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 938.0, 409.0, 49.0, 5.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.355224028229713, 91.55012339353561, 5.0, 67.57207206885022 ],
                    "saved_attribute_attributes": {
                        "linecolor": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 7,
                    "outlettype": [ "bang", "int", "int", "int", "int", "int", "int" ],
                    "patching_rect": [ 346.0, 119.0, 82.0, 25.0 ],
                    "text": "t b i i i i i i"
                }
            },
            {
                "box": {
                    "id": "obj-130",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 296.0, 185.0, 48.0, 25.0 ],
                    "text": "recall 1"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "linecolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "maxclass": "live.line",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 938.0, 390.0, 49.0, 5.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.333333671092987, 170.0000050663948, 5.0, 111.14414413770045 ],
                    "saved_attribute_attributes": {
                        "linecolor": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-87",
                    "linecolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "maxclass": "live.line",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 938.0, 400.0, 49.0, 5.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 132.0, 95.25, 5.0, 184.75 ],
                    "saved_attribute_attributes": {
                        "linecolor": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-75",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 564.0, 185.0, 151.0, 25.0 ],
                    "text": "sprintf read p-pymyosc-%i"
                }
            },
            {
                "box": {
                    "id": "obj-159",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 378.0, 185.0, 171.0, 25.0 ],
                    "text": "sprintf name p-pyomyoosc-%i"
                }
            },
            {
                "box": {
                    "id": "obj-156",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 356.0, 327.0, 200.0, 25.0 ],
                    "text": "sprintf pattrstorage p-pyomyosc-%i"
                }
            },
            {
                "box": {
                    "autorestore": "p-myo-1.json",
                    "id": "obj-71",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 378.0, 248.0, 251.0, 25.0 ],
                    "saved_object_attributes": {
                        "client_rect": [ 3, 90, 498, 781 ],
                        "parameter_enable": 0,
                        "parameter_mappable": 0,
                        "storage_rect": [ 11, 100, 462, 780 ]
                    },
                    "text": "pattrstorage @changemode 1 @savemode 3",
                    "varname": "p-pyomyoosc-1"
                }
            },
            {
                "box": {
                    "id": "obj-189",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1092.0, 1149.0, 93.0, 25.0 ],
                    "restore": [ 1 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr @bindto e",
                    "varname": "u491009245[7]"
                }
            },
            {
                "box": {
                    "id": "obj-190",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1092.0, 1095.0, 94.0, 25.0 ],
                    "restore": [ 1 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr @bindto g",
                    "varname": "u491009245[8]"
                }
            },
            {
                "box": {
                    "id": "obj-191",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1092.0, 1122.0, 94.0, 25.0 ],
                    "restore": [ 1 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr @bindto q",
                    "varname": "u491009245[9]"
                }
            },
            {
                "box": {
                    "id": "obj-192",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 1092.0, 1068.0, 93.0, 25.0 ],
                    "restore": [ 1 ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr @bindto a",
                    "varname": "u491009245[10]"
                }
            },
            {
                "box": {
                    "id": "obj-188",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 960.0, 1149.0, 111.0, 25.0 ],
                    "restore": [ "/emg" ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr @bindto emg",
                    "varname": "u491009245[6]"
                }
            },
            {
                "box": {
                    "id": "obj-185",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 960.0, 1095.0, 111.0, 25.0 ],
                    "restore": [ "/gyro" ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr @bindto gyro",
                    "varname": "u491009245[3]"
                }
            },
            {
                "box": {
                    "id": "obj-186",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 960.0, 1122.0, 111.0, 25.0 ],
                    "restore": [ "/quat" ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr @bindto quat",
                    "varname": "u491009245[4]"
                }
            },
            {
                "box": {
                    "id": "obj-187",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 960.0, 1068.0, 114.0, 25.0 ],
                    "restore": [ "/accel" ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr @bindto accel",
                    "varname": "u491009245[5]"
                }
            },
            {
                "box": {
                    "id": "obj-184",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 818.0, 1095.0, 110.0, 25.0 ],
                    "restore": [ "127.0.0.1" ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr @bindto host",
                    "varname": "u491009245[2]"
                }
            },
            {
                "box": {
                    "id": "obj-183",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 818.0, 1122.0, 126.0, 25.0 ],
                    "restore": [ "8000" ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr @bindto receive",
                    "varname": "u491009245[1]"
                }
            },
            {
                "box": {
                    "id": "obj-182",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 818.0, 1068.0, 113.0, 25.0 ],
                    "restore": [ "7000" ],
                    "saved_object_attributes": {
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "pattr @bindto send",
                    "varname": "u491009245"
                }
            },
            {
                "box": {
                    "active1": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "embed": 0,
                    "emptycolor": [ 0.19999997317791, 0.199999943375587, 0.19999997317791, 1.0 ],
                    "fontname": "Krungthep",
                    "id": "obj-180",
                    "maxclass": "preset",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "preset", "int", "preset", "int", "" ],
                    "patching_rect": [ 356.0, 363.0, 88.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 104.00000309944153, 10.666666984558105, 28.77577848194312, 52.0 ],
                    "stored1": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-167",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 46.0, 31.0, 92.0, 25.0 ],
                    "text": "loadmess 8000"
                }
            },
            {
                "box": {
                    "arrows": 2,
                    "id": "obj-147",
                    "linecolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "maxclass": "live.line",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 330.0, 616.0, 45.75, 8.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 461.0, 47.0, 15.135667532682419, 7.0 ],
                    "saved_attribute_attributes": {
                        "linecolor": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "arrows": 2,
                    "id": "obj-144",
                    "linecolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "maxclass": "live.line",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 578.0, 711.0, 50.0, 8.52850537963755 ],
                    "presentation": 1,
                    "presentation_rect": [ 228.5, 19.0, 15.135667532682419, 7.0 ],
                    "saved_attribute_attributes": {
                        "linecolor": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "arrows": 2,
                    "id": "obj-102",
                    "linecolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "maxclass": "live.line",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1551.0, 280.0, 50.0, 8.52850537963755 ],
                    "presentation": 1,
                    "presentation_rect": [ 228.5, 47.0, 15.135667532682419, 7.0 ],
                    "saved_attribute_attributes": {
                        "linecolor": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "fontname": "Krungthep",
                    "id": "obj-95",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 361.0, 683.0, 20.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 499.25, 39.0, 20.75, 22.0 ],
                    "text": "%",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-84",
                    "linecolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "maxclass": "live.line",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 55.33333361148834, 350.6666685938835, 49.0, 5.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.688557371497154, 115.55012410879135, 121.33333966135979, 5.066666930913925 ],
                    "saved_attribute_attributes": {
                        "linecolor": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "id": "obj-99",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1176.0, 525.0, 91.0, 25.0 ],
                    "text": "set /emg, bang"
                }
            },
            {
                "box": {
                    "id": "obj-98",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1046.0, 525.0, 91.0, 25.0 ],
                    "text": "set /quat, bang"
                }
            },
            {
                "box": {
                    "id": "obj-97",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 916.0, 525.0, 91.0, 25.0 ],
                    "text": "set /gyro, bang"
                }
            },
            {
                "box": {
                    "id": "obj-96",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 767.0, 525.0, 95.0, 25.0 ],
                    "text": "set /accel, bang"
                }
            },
            {
                "box": {
                    "id": "obj-54",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 767.0, 703.0, 73.0, 25.0 ],
                    "text": "s #0-data"
                }
            },
            {
                "box": {
                    "id": "obj-43",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1222.0, 291.0, 72.0, 25.0 ],
                    "text": "r #0-data"
                }
            },
            {
                "box": {
                    "id": "obj-72",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1176.0, 594.0, 61.0, 25.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "id": "obj-73",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1176.0, 654.0, 94.0, 25.0 ],
                    "text": "join @triggers 1"
                }
            },
            {
                "box": {
                    "id": "obj-76",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1046.0, 594.0, 61.0, 25.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "id": "obj-77",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1046.0, 654.0, 94.0, 25.0 ],
                    "text": "join @triggers 1"
                }
            },
            {
                "box": {
                    "id": "obj-66",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 916.0, 594.0, 61.0, 25.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "id": "obj-70",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 916.0, 654.0, 94.0, 25.0 ],
                    "text": "join @triggers 1"
                }
            },
            {
                "box": {
                    "id": "obj-52",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 767.0, 594.0, 61.0, 25.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "id": "obj-46",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 767.0, 654.0, 94.0, 25.0 ],
                    "text": "join @triggers 1"
                }
            },
            {
                "box": {
                    "fontname": "Avenir Next",
                    "id": "obj-40",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 159.0, 185.0, 116.0, 25.0 ],
                    "text": "text $1, texton $1, 1"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 46.0, 185.0, 70.0, 25.0 ],
                    "text": "udpreceive"
                }
            },
            {
                "box": {
                    "fontname": "Avenir Next",
                    "fontsize": 12.0,
                    "id": "obj-24",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 46.0, 132.0, 48.0, 25.0 ],
                    "text": "port $1"
                }
            },
            {
                "box": {
                    "fontname": "Avenir Next",
                    "fontsize": 12.0,
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 46.0, 99.0, 61.0, 25.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "fontname": "Krungthep",
                    "fontsize": 10.0,
                    "id": "obj-13",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 106.0, 69.0, 32.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 55.3552253395319, 119.2167908847332, 34.0, 19.0 ],
                    "text": "port",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Krungthep",
                    "id": "obj-9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 52.000000178813934, 320.66666769981384, 59.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 41.688558265566826, 91.55012339353561, 61.0, 22.0 ],
                    "text": "RECEIVE",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Krungthep",
                    "id": "obj-8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 943.0, 351.0, 40.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 50.666668176651, 166.6666716337204, 43.0, 22.0 ],
                    "text": "SEND",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Avenir Next",
                    "fontsize": 12.0,
                    "id": "obj-118",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 346.0, 31.0, 62.0, 25.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-117",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 346.0, 63.0, 74.0, 25.0 ],
                    "text": "patcherargs"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "fontface": 1,
                    "fontname": "Krungthep",
                    "id": "obj-69",
                    "ignoreclick": 1,
                    "legacytextcolor": 1,
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 1,
                    "patching_rect": [ 159.0, 32.0, 40.0, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.538461655378342, 66.66666734218597, 121.50427475571632, 23.931624174118042 ],
                    "saved_attribute_attributes": {
                        "valueof": {
                            "parameter_enum": [ "off", "on" ],
                            "parameter_initial": [ 1 ],
                            "parameter_initial_enable": 1,
                            "parameter_longname": "textbutton[1]",
                            "parameter_mmax": 1,
                            "parameter_modmode": 0,
                            "parameter_shortname": "textbutton",
                            "parameter_type": 2
                        }
                    },
                    "text": "OSC",
                    "textcolor": [ 1.0, 0.0, 0.0, 1.0 ],
                    "texton": "OSC",
                    "textoncolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "varname": "textbutton"
                }
            },
            {
                "box": {
                    "fontname": "Avenir Next",
                    "fontsize": 12.0,
                    "id": "obj-63",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 996.0, 253.0, 61.0, 25.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "fontname": "Krungthep",
                    "fontsize": 10.0,
                    "id": "obj-58",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1271.0, 221.0, 33.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 55.66666832566261, 195.00000581145287, 33.0, 19.0 ],
                    "text": "host",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Avenir Next",
                    "fontsize": 12.0,
                    "id": "obj-57",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 1145.0, 253.0, 61.0, 25.0 ],
                    "text": "route text"
                }
            },
            {
                "box": {
                    "fontname": "Krungthep",
                    "fontsize": 10.0,
                    "id": "obj-55",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1058.0, 222.0, 32.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 55.66666832566261, 239.66667380928993, 34.0, 19.0 ],
                    "text": "port",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Avenir Next",
                    "fontsize": 12.0,
                    "id": "obj-20",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 996.0, 291.0, 48.0, 25.0 ],
                    "text": "port $1"
                }
            },
            {
                "box": {
                    "fontname": "Avenir Next",
                    "fontsize": 12.0,
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1145.0, 291.0, 49.0, 25.0 ],
                    "text": "host $1"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-50",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 996.0, 349.0, 143.0, 25.0 ],
                    "text": "udpsend 127.0.0.1 7400"
                }
            },
            {
                "box": {
                    "bgcolor": [ 1.0, 0.0, 0.0, 1.0 ],
                    "bgoncolor": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "fontface": 1,
                    "fontname": "Krungthep",
                    "fontsize": 30.0,
                    "id": "obj-47",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 159.0, 220.0, 28.0, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.11111056804657, 11.616161048412323, 87.3737331032753, 51.01009851694107 ],
                    "text": "1",
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "texton": "1",
                    "textoncolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "usebgoncolor": 1
                }
            },
            {
                "box": {
                    "fontname": "Avenir Next",
                    "id": "obj-38",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 330.0, 711.0, 47.0, 23.0 ],
                    "text": "battery",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "fontname": "Krungthep",
                    "fontsize": 10.0,
                    "id": "obj-35",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1552.0, 254.0, 48.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 137.0, 41.0, 93.5, 19.0 ],
                    "text": "vibrate",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "id": "obj-2",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 164.0, 679.0, 43.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 328.0, 95.0, 91.0, 163.0 ],
                    "setminmax": [ -3.0, 3.0 ],
                    "setstyle": 3,
                    "size": 4,
                    "slidercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "spacing": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "id": "obj-6",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 105.0, 679.0, 43.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 233.5, 95.0, 91.0, 163.0 ],
                    "setminmax": [ -1000.0, 1000.0 ],
                    "setstyle": 3,
                    "size": 3,
                    "slidercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "spacing": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "id": "obj-48",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 227.0, 679.0, 82.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 423.21428167819977, 95.08928480744362, 98.0, 163.0 ],
                    "setstyle": 3,
                    "size": 8,
                    "slidercolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.137254901960784, 0.137254901960784, 0.137254901960784, 0.0 ],
                    "fontname": "Krungthep",
                    "fontsize": 13.0,
                    "id": "obj-45",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1548.0, 132.0, 24.8499755859375, 25.626276284456253 ],
                    "presentation": 1,
                    "presentation_rect": [ 300.1549736261368, 37.75737358132998, 24.778524219989777, 24.48525283734004 ],
                    "rounded": 113.0,
                    "text": "3",
                    "texton": "3",
                    "textoncolor": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "varname": "live.text[3]"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.137254901960784, 0.137254901960784, 0.137254901960784, 0.0 ],
                    "fontname": "Krungthep",
                    "fontsize": 13.0,
                    "id": "obj-41",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1466.0, 131.0, 24.8499755859375, 25.626276284456253 ],
                    "presentation": 1,
                    "presentation_rect": [ 272.17183562119794, 37.75737358132998, 24.778524219989777, 24.48525283734004 ],
                    "rounded": 113.0,
                    "text": "2",
                    "texton": "2",
                    "textoncolor": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "varname": "live.text[2]"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.137254901960784, 0.137254901960784, 0.137254901960784, 0.0 ],
                    "fontname": "Krungthep",
                    "fontsize": 13.0,
                    "id": "obj-36",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1384.0, 132.0, 24.8499755859375, 25.626276284456253 ],
                    "presentation": 1,
                    "presentation_rect": [ 243.5, 38.0, 24.778524219989777, 24.48525283734004 ],
                    "rounded": 113.0,
                    "text": "1",
                    "texton": "1",
                    "textoncolor": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "varname": "live.text[1]"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1384.0, 185.0, 56.0, 25.0 ],
                    "text": "vibrate 1"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1466.0, 187.0, 56.0, 25.0 ],
                    "text": "vibrate 2"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1548.0, 185.0, 56.0, 25.0 ],
                    "text": "vibrate 3"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Avenir Next",
                    "id": "obj-90",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 444.0, 711.0, 56.0, 23.0 ],
                    "text": "postures",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.301961, 0.301961, 0.301961, 1.0 ],
                    "bgcolor2": [ 0.301961, 0.301961, 0.301961, 1.0 ],
                    "bgfillcolor_angle": 270.0,
                    "bgfillcolor_autogradient": 0.0,
                    "bgfillcolor_color": [ 0.2, 0.2, 0.2, 0.0 ],
                    "bgfillcolor_color1": [ 0.301961, 0.301961, 0.301961, 1.0 ],
                    "bgfillcolor_color2": [ 0.2, 0.2, 0.2, 1.0 ],
                    "bgfillcolor_proportion": 0.5,
                    "bgfillcolor_type": "color",
                    "dontreplace": 1,
                    "fontname": "Krungthep",
                    "fontsize": 10.0,
                    "gradient": 1,
                    "id": "obj-29",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 430.0, 684.0, 103.0, 21.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 422.0253208577633, 13.0, 100.05802804231644, 21.0 ],
                    "text": "rest",
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "linecolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "maxclass": "live.line",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 938.0, 381.0, 49.0, 5.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.333333671092987, 188.33333894610405, 121.466673001647, 5.0 ],
                    "saved_attribute_attributes": {
                        "linecolor": {
                            "expression": ""
                        }
                    }
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "id": "obj-7",
                    "maxclass": "multislider",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 42.0, 679.0, 44.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 138.0, 95.0, 91.0, 163.0 ],
                    "setminmax": [ -3.0, 3.0 ],
                    "setstyle": 3,
                    "size": 3,
                    "slidercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "spacing": 1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1.0,
                    "bordercolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "fontname": "Krungthep",
                    "fontsize": 10.0,
                    "id": "obj-62",
                    "keymode": 1,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1176.0, 559.0, 84.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 421.8749959766865, 262.946426063776, 100.89285618066788, 19.196428388357162 ],
                    "rounded": 0.0,
                    "text": "/emg",
                    "textcolor": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "textjustification": 1,
                    "varname": "emg"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1.0,
                    "bordercolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "fontname": "Krungthep",
                    "fontsize": 10.0,
                    "id": "obj-61",
                    "keymode": 1,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1046.0, 559.0, 84.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 327.0, 263.0, 94.0, 19.0 ],
                    "rounded": 0.0,
                    "text": "/quat",
                    "textcolor": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "textjustification": 1,
                    "varname": "quat"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1.0,
                    "bordercolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "fontname": "Krungthep",
                    "fontsize": 10.0,
                    "id": "obj-60",
                    "keymode": 1,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 916.0, 559.0, 84.00000000000011, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 232.5, 263.0, 94.0, 19.0 ],
                    "rounded": 0.0,
                    "text": "/gyro",
                    "textcolor": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "textjustification": 1,
                    "varname": "gyro"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1.0,
                    "bordercolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "fontname": "Krungthep",
                    "fontsize": 10.0,
                    "id": "obj-59",
                    "keymode": 1,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 767.0, 559.0, 84.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 137.0, 263.0, 94.0, 19.0 ],
                    "rounded": 0.0,
                    "text": "/accel",
                    "textcolor": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "textjustification": 1,
                    "varname": "accel"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.19999997317791, 0.199999943375587, 0.19999997317791, 1.0 ],
                    "fontface": 1,
                    "fontname": "Krungthep",
                    "id": "obj-49",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 41.0, 533.0, 55.434781551361084, 22.108707666397095 ],
                    "presentation": 1,
                    "presentation_rect": [ 138.0, 67.0, 91.43349805474281, 24.0 ],
                    "text": "ACCEL",
                    "textcolor": [ 1.0, 0.0, 0.0, 1.0 ],
                    "texton": "ACCEL",
                    "textoncolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "varname": "a"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.19999997317791, 0.199999943375587, 0.19999997317791, 1.0 ],
                    "fontface": 1,
                    "fontname": "Krungthep",
                    "id": "obj-68",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 169.0, 533.0, 55.434781551361084, 22.108707666397095 ],
                    "presentation": 1,
                    "presentation_rect": [ 328.0, 67.0, 91.43349784612656, 24.0 ],
                    "text": "QUAT",
                    "textcolor": [ 1.0, 0.0, 0.0, 1.0 ],
                    "texton": "QUAT",
                    "textoncolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "varname": "q"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.19999997317791, 0.199999943375587, 0.19999997317791, 1.0 ],
                    "fontface": 1,
                    "fontname": "Krungthep",
                    "id": "obj-67",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 105.0, 533.0, 55.434781551361084, 22.108707666397095 ],
                    "presentation": 1,
                    "presentation_rect": [ 233.5, 67.0, 91.43349784612656, 24.0 ],
                    "text": "GYRO",
                    "textcolor": [ 1.0, 0.0, 0.0, 1.0 ],
                    "texton": "GYRO",
                    "textoncolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "varname": "g"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.19999997317791, 0.199999943375587, 0.19999997317791, 1.0 ],
                    "fontface": 1,
                    "fontname": "Krungthep",
                    "id": "obj-74",
                    "maxclass": "textbutton",
                    "mode": 1,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 233.0, 533.0, 55.434781551361084, 22.108707666397095 ],
                    "presentation": 1,
                    "presentation_rect": [ 423.21428167819977, 66.96428507566452, 99.10714191198349, 24.107142627239227 ],
                    "text": "EMG",
                    "textcolor": [ 1.0, 0.0, 0.0, 1.0 ],
                    "texton": "EMG",
                    "textoncolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "varname": "e"
                }
            },
            {
                "box": {
                    "autofit": 1,
                    "data": [ 4597, "png", "IBkSG0fBZn....PCIgDQRA..B....H..HX.....83Qs9....DLmPIQEBHf.B7g.YHB..QvZRDEDU3wY6c2GrscWWeG+88lKDHAhAL3.DJEhHgDwVfhLfBTzFdnALlHoNVz9fCSmoS+y1+pclN8Imo8+5zoOLRGGFmwVssl.AiMfHpwjonXoHJNIJfgGzBBgLfPBAxCb6erSJIgaRt2b260284rd8Zl0bu2SNmy2O68j0Y+47as1qUA..........................................................................................................................................................................................................................................................................................................................bBbjGCeMmU04W8zqNysab..1J97U2R0sOcP1WcxV.3kUc4UWV028tKN..aMGu5CVcMUuypad13re4Qq.vKq5ec0O3BjE.fcoe4p+gUeroCx9fy3g4ielUusp+iUWvxEG.fclme0e+66ueiSFj8AmnU.37pt5pW8BmE.fkxUU82s5NFNGi4gV.3oV8ApddCjE.fkz0W85pt6gywHdfGBfiU8tpdoCkE.fkzyo5Y0lW6a04AV.3eU0emoBB.v.dwUe7pOxzAYoc+GBfyuMmUjOwAyB.vD9+V8cUcmSGjkz8uB.+aaya4O.f0lyo5KU89mNHKoiT8jpt0pmvvYA.XJe71rJ.qFGs5MjW7G.V2ddUWzzgXIczp23zg..XOvkMc.VRGs5hmND..6AdQSGfkzQayc0O.f0tm8zAXIo...vFmyzAXIczpG+zg..XOvC2MHuCkN5zA..fkmB...qPJ...rBo...vJjB...qPJ...rBo...vJjB...qPJ...rBo...vJjB...qPJ...rBo...vJzwFb1uuAmM.r+5rqdESGh0fiOz1QVhGb.vANWTy75R2zR7faegCA..vJjB...qPJ...rBo...vJjB...qPJ...rBo...vJjB...qPJ...rBo...vJjB...qPJ...rBo...vJjB...qPJ...rBo...vJjB...qPJ...rBo...vJjB...qPJ...rBo...vJjB...qPJ...rBo...vJjB...qPJ...rBo...vJzwlN...6IN6pKY5P7XvsU8Ip9RmJeQGo536j37n6nCNa.X+0EUcSSGhCftop2U00T86bx7Eb7g1Nxo4CT.3voKp4dsoCKau+pW4izSxNG...N74UTcCU+LUm4I5SPA..fCmNR0as55qd5Oz+iJ...b31Ku5FqdpOvOn2E.vx6IU8CW88VcgUWv88w+JU+4U+AU+lU+JU2wDAD3PmmWaN4.ujp659+fNI.gkw2S0OW0s2I29Hekpe5pm6DgEFjSBvc21O0C7IZE.fcqys5eW0c2is8U95U+yqNiEN2vTT.X2scmU+Et+mnmJDJ.vZvET8wZ6rOy0W8LWzzCyPAfc61Oy8+D8TAPA.Nr6kU84a6teymn5YrjOHfAn.vtc6qU8j8t..1Mtvp2S0SaK+884zlSNvycK+8EX83LqdsJ..aemY06n5ori99+8T8edG88FXc3GRA.X66eb0EuimweipW6NdF.Gd8hcy.B1t9Nptk1bWEaW6Or5EVcuKvrfkjaFP6deQq..rc82qk4E+q5ET8CtPyB3vkyQA.X64HU+jK7L+IV34Ab3vYn..r87xq9NW3Yd44d5AviA9AGv1yO9.y7b5AbU8BfSVJ..aGGqMmY9S3BGZt.Gfo..rc7FZy6.fI3xCLvoLE.fsiIV9+62cN3rANfRA.3z2St5xFb92wfyF3.JE.fSeWQ0YM37+bCNafCnT..N8M46E+6p5iL37ANfRA.3zyynYuZ7cCs4V6I.mRT..N87iUcFCN+qYvYCb.lB.vomIW9+6o5Wbv4Cb.lB.vicufpWxfy+8T84Gb9.Gfo..7X2z2Hd9uN77AN.6XSG.3.piT8VFb92Q00N37gCitipeqAl6kLvLU..dL56u54N37upbA.B119zUu1Al6wGXlND.viQSdo+sr7+.mlT..N083ptxAm+ms5Wev4CbHfB.votKs57Fb9+BU26fyG3P.E.fScV9efC7T..N0bNUuoAm+eX0GZv4CbHgB.vol2b0Sbv4+eYvYCbHhB.volIW9+i2li+O.m1T..N48LqdMCN+2e0sL37ANDQA.3j2aoYuy+4j+CXqQA.3j2jK++cm67e.aQJ..mbtnpWzfy+cW8EFb9.Gxn..bx4u0vy2x+CrUo..7n6HU+MGb9e4bm+CXKSA.3Q2qp54L37u5p6bv4CbHjB.viNW5eANzQA.3Q1iuMW8+lxmo55Gb9.GRo..7H6MV8sO37+4yc9Ofc.E.fGYV9efCkT..d3cNUW5fy+lq9vCNefCwT..d38i1r24+94Fb1.Gxo..7vyc9OfCsT..NwN+179+eJ2X0mbv4CbHmB.vI1Odty+AbHlB.vI1jK++c0lq9e.ryn..7s56t5uzfy++Y0sM37AVAT..9V82d34a4+A14T..dvNRad6+Mkub00M37AVIT..dv9q1r24+9Eyc9OfEfB.vClK8u.qBJ..eSOgpqbv4+YptgAmOvJxwlN.vdjKs5bGb9Oyp6YK986KV84p98aysT3qs5OcK98G3.tiOz1QVhGbvof2Qys+vRrcuUuypW115ILXG4hZl8Qtok3A2IvH+LAGB.XimRydm+aIbzpKu52t5s2l61g.qTJ..abkUm4zgXgbjpexpOX0EObV.FhB.vF+DSGfA7c0lyMf+xCmCfAn..TO6pW4zgXHOsp2c0yZ5f.rrT..p2Rq68EdFs45OfSLWXEYM+C8f62zW7e1G7pqdqSGBfkiB.r18hpdgSGh8D+ypd7SGBfkgB.r1429+a5Y0r2Hj.VPJ.vZ2OxzAXOyO1zA.XYn..qYWX0ELcH1y7CT83lND.6dJ.vZ1KY5.rG5rx4DArJn..qYO+oCvdpmyzA.X2SA.Vybsv+D67lN..6dJ.vZl+++Sr6c5..r64G.xZ1sMc.1S8mOc..18T.f0r+3oCvdpO9zA.X2SA.Vy9PSGf8P2Q0MOcH.18T.f0r+nrJ.OT2X0cMcH.18T.f0t+aSGf8LWyzA.XYn..qc+6q9ZSGh8D2a06b5P.rLT.f0tOW0+goCwdhar5yOcH.VFJ..0+hpOwzgXOvUMc..VNJ..0sWcEUe0oCxf9FY4+gUEE.fM98ptxVumO.u+pOyzg.X4n..7M8tqtzpac5fL.K+Orxn..7f8aT8Wo55lNHKniW8NlND.KKE.fuU+IUuw6a62b3rrD9.s4wLvJxwlN.vdrq691d9UWd0qn5EV8zp91FLWaaW8zA.XFGensirDO3fC.9G0b6Gd7pKX2+PDNkbQMy9B2zR7f6DXj88cH.f48lGb1+uqtkAmOvPT..l04W8xGb9V9eXkRA.XVWYyd3vT..VoT..l0jK++ua0Gev4CLHE.f47zq99Fb99s+gULE.f47lqNiAmuK9OvJlB.vblb4++Cpt4AmOvvT..lw4U8pFb9V9eXkSA.XF+HM6UhS27efUNE.fYL4x++Qayg..XESA.X48TpdMCN++GCNaf8DJ..Kuqn5wO37c7+AT..FvjK++sT8gGb9.6IT..VVma0kL37s7+.UJ..KsKKK+Ovd.E.fk0jK++mr5+yfyGXOhB.vx4IW85Fb9WU0wGb9.6QT..VN+PUOgAmuk+G3+OE.fkyjK++eZ0GXv4CrmQA.XYbVUu9Amuk+G3AQA.XY7lpN6Amuk+G3AQA.XYL4x++mU8aM37A1Co..r68DqtzAm+UWcuCNef8PJ..6d+0qdRCNeK+Ov2BE.fcuIW9+uP0MN37A1So..racls4D.bJWc08L37A1So..ra85pNmAmuk+G3DRA.X2Zxk++1p9MFb9.6wT..1cdbs4x+6Ttlr7+.OLT..1ctjpm5fy2x+C7v5XSG.3PrIW9+uT0u1fyGNH5YW8qNcHVJJ..6FGq5xFb9uqp6Zv4CGDc1sYk6VEbH.fciefpm1fy2x+C7HRA.X2Xxk++qzJZYLAdrQA.X66LpthAm+uT0Wav4Cb.fB.v12qt56Xv4a4+AdTo..r8M4x++UqduCNefCHT..1tNZyt7++xU2wfyG3.BE.fsqu+pm4fy2x+CbRQA.X6Zxk++NqttAmOvAHJ..aWW9fy98Tc6CNefCPT..1ddAU+EGb9V9efSZJ..aOuzAm8Wu5ZGb9.Gvn..r87bGb1u2pu7fyG3.FE.fsmG2fy9pFb1.G.o..r8LUAf6NK+Ovol6RA.X6YpK.Ouupu3PyF3foOiB.v1yGYn4Z4+ANU8YU..1d98FXl2Sat6+AvohaVA.X64SU8QW3Y9qW8EV3YBbv20p..r8b7p29BOy21BOOfC995UuOE.fsqe11ry0R3OIK+Ovote1paWA.X65yU8uYgl0+j1bN..vIq6r5m59+GGensirSeHBy4Lqt41s6+79x9Pb30E0bu1zg8s+kOvmnmJD9gWbX1Kt5K0tYemOY0yXwdj.KOE.1Mau2pi8.ehdpfn..G18JayEGns49M2Z0EujOHfAn.v1e6iV8TdnOQOUXT.f0fWSadQ6sw9L2T024hldXFJ.rc29eU8zOQOQOUfT.f0hmc000i88Utmp+SUeaKcvggn.v1Y6aT8SW83e3dhVA.XY7FptgN42G4tp9uW8RlHrvfT.3ze6Ws5k9H8j7QtuOwIbzAmMLoKr50W8pqdgUmWaN1beg1b3B9PU2XatC+8mMTFgIcQs4Pdwole+17yMtlpO3i1mrB..v9loJ.7oqdqCL2SGespOa0moMuG+OocrG8OE.fUg6nMWiMVEbk.D.XERA..fUHE...VgT...XERA..fUHE...VgT...XERA..fUHE...VgT...XERA..fUHE...VgT...XERA..fUHE...VgT...XERA..fUHE...VgT...XERA..fUHE...VgT...XERA..fUHE...VgT...XERA..fUHE...VgT...XE5XCN626fyF.1ec1SGf0fIK.bICNa.fUMGB..fUHE...VgT...XERA..fUHE...VgT...XERA..fUHE...VgT...XERA..fUHE...VgT...XERA..fUniVcuSGB.f8.qpWO7nU29zg..XOvWd5.rjNZ0md5P..rG3SMc.VRGs52c5P..rG3COc.VRGs5ZmND..6A9klN.KoiT8jpt0pmvvYA.XJerpm+zgXIc+mDf+BSGD.fA81lN.Ksibe+44W8QqNqAyB.vD9TUWX0We5frjNi66O+JUmc0qZvr..Lg+AsxNA.qu4J.T0wpdOU+0FJK..Ks2d0ac5PLgi7P92e6U+1UOuAxB.vR55qdcU28v4XDOz6E.2V02W0MLPV..VJWU0apU5K9Wm3aFP2Z0quMKKxwW13..rScWU+Sq9QqtigyxnNiGlO98zlKHBWWaNb.O2EKQ..aeGuM+V+u4pqY3rrW3gdN.7v46s5Jp9gqt3cWb..1Z9FU+NUuqp2Y0ezrwY+xIaAfGnys54Tcda2n..rU7MZygy9Ot5qNbV...........................................................................................................................................................................................................................................................................................................................NX4+G.QLVF21qGTOC....PRE4DQtJDXBB" ],
                    "embed": 1,
                    "forceaspect": 1,
                    "id": "obj-146",
                    "maxclass": "fpic",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "jit_matrix" ],
                    "patching_rect": [ 335.0, 569.0, 40.0, 40.0 ],
                    "pic": "",
                    "presentation": 1,
                    "presentation_rect": [ 420.6666792035103, 27.000000804662704, 48.4690018594265, 48.4690018594265 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "fontname": "Krungthep",
                    "id": "obj-30",
                    "ignoreclick": 1,
                    "maxclass": "number",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 330.0, 682.0, 53.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 477.5, 38.33333447575569, 47.5, 24.0 ],
                    "textcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "triangle": 0,
                    "varname": "Chans-NB"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 1144.0, 122.0, 62.0, 25.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1145.0, 185.0, 113.0, 25.0 ],
                    "text": "set 127.0.0.1, bang"
                }
            },
            {
                "box": {
                    "id": "obj-110",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 996.0, 185.0, 90.0, 25.0 ],
                    "text": "set 7000, bang"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-122",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1145.0, 221.0, 121.2222222238779, 19.053796688105876 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.000000327825546, 216.33333978056908, 122.75, 19.75 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-121",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 996.0, 222.0, 58.0, 19.440926719479307 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.000000327825546, 262.00000780820847, 122.75, 19.75 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-120",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 47.0, 68.0, 58.0, 19.440926719479307 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.387900352478027, 140.2135230898857, 122.4199287891388, 19.57295373082161 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "border": 1.0,
                    "bordercolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "fontface": 1,
                    "fontname": "Krungthep",
                    "fontsize": 12.0,
                    "id": "obj-11",
                    "keymode": 1,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 46.0, 68.0, 59.0, 19.440926719479307 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.387900352478027, 140.9252668619156, 122.4199287891388, 18.505338072776794 ],
                    "rounded": 0.0,
                    "text": "8000",
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "textjustification": 1,
                    "varname": "receive"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "border": 1.0,
                    "bordercolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "fontface": 1,
                    "fontname": "Krungthep",
                    "fontsize": 12.0,
                    "id": "obj-64",
                    "keymode": 1,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 996.0, 222.0, 58.05090108513832, 19.356206912569746 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.000000327825546, 262.3333411514759, 122.78632605075836, 18.80341899394989 ],
                    "rounded": 0.0,
                    "text": "7000",
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "textjustification": 1,
                    "varname": "send"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.164705882352941, 0.733333333333333, 0.862745098039216, 1.0 ],
                    "border": 1.0,
                    "bordercolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "fontface": 1,
                    "fontname": "Krungthep",
                    "fontsize": 12.0,
                    "id": "obj-56",
                    "keymode": 1,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1145.0, 221.0, 121.22228245437145, 19.01544682215342 ],
                    "presentation": 1,
                    "presentation_rect": [ 10.666666984558105, 216.33333978056908, 123.21367648243904, 18.80341899394989 ],
                    "rounded": 0.0,
                    "text": "127.0.0.1",
                    "textcolor": [ 0.0, 0.0, 0.0, 1.0 ],
                    "textjustification": 1,
                    "varname": "host"
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-132",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1384.0, 134.0, 24.8499755859375, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 243.5, 38.0, 25.12219546238581, 24.0 ],
                    "proportion": 0.5,
                    "rounded": 30
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-133",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1466.0, 133.0, 24.8499755859375, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 272.0, 38.0, 25.12219546238581, 24.0 ],
                    "proportion": 0.5,
                    "rounded": 30
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-134",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1548.0, 133.0, 24.8499755859375, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 300.1549736261368, 38.157373587290444, 25.12219546238581, 24.0 ],
                    "proportion": 0.5,
                    "rounded": 30
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-181",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 356.0, 363.0, 88.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 102.66666972637177, 10.666666984558105, 30.509204437749872, 52.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-113",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 227.0, 679.0, 82.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 423.21428167819977, 95.08928480744362, 99.10714191198349, 162.94642701745033 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-124",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1551.0, 252.0, 50.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 138.0, 38.0, 91.5, 24.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-127",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 578.0, 683.0, 135.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 243.11111292243004, 10.666666746139526, 175.9311601817608, 24.00000035762787 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-137",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 429.0, 683.0, 104.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 422.0, 11.0, 100.08334890007973, 24.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-135",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 330.0, 682.0, 50.0, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 476.5, 38.75, 45.75, 24.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-145",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 333.0, 571.0, 42.5, 37.94166620075703 ],
                    "presentation": 1,
                    "presentation_rect": [ 422.4444475919008, 39.3333336263895, 40.666666969656944, 22.444444611668587 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-18",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 232.0, 533.0, 55.434781551361084, 22.108707666397095 ],
                    "presentation": 1,
                    "presentation_rect": [ 423.21428167819977, 66.96428507566452, 99.10714191198349, 24.107142627239227 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-83",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 169.0, 533.0, 55.434781551361084, 22.108707666397095 ],
                    "presentation": 1,
                    "presentation_rect": [ 328.0, 67.0, 91.43349784612656, 24.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-85",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 104.0, 533.0, 55.434781551361084, 22.108707666397095 ],
                    "presentation": 1,
                    "presentation_rect": [ 233.5, 67.0, 91.43349784612656, 24.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-94",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 41.0, 533.0, 55.434781551361084, 22.108707666397095 ],
                    "presentation": 1,
                    "presentation_rect": [ 138.0, 67.0, 91.43349784612656, 24.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-112",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1176.0, 559.0, 84.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 423.21428167819977, 262.0535689294338, 99.10714191198349, 19.196428388357162 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-111",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 1046.0, 559.0, 84.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 328.0, 262.0, 91.43349784612656, 19.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-108",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 916.0, 559.0, 84.00000000000011, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 233.5, 262.0, 91.43349784612656, 19.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-104",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 767.0, 559.0, 84.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 138.0, 262.0, 91.43349784612656, 19.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-114",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 164.0, 679.0, 43.5, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 328.0, 95.0, 91.0, 163.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-116",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 105.0, 679.0, 43.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 233.5, 95.0, 91.0, 163.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-119",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 42.0, 679.0, 44.0, 30.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 138.0, 95.0, 91.0, 163.0 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-126",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 159.0, 32.0, 39.71739077568054, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.666667014360428, 66.66666865348816, 121.66667029261589, 24.000000715255737 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-140",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 159.0, 220.0, 28.0, 23.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 11.11111056804657, 11.11111056804657, 87.3737331032753, 52.02019947767258 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            },
            {
                "box": {
                    "angle": 270.0,
                    "background": 1,
                    "bgcolor": [ 0.2, 0.2, 0.2, 0.0 ],
                    "border": 1,
                    "bordercolor": [ 1.0, 1.0, 1.0, 1.0 ],
                    "id": "obj-81",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 749.0, 249.0, 112.71739077568054, 25.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 138.00000616908073, 11.142857640981674, 91.49999383091927, 24.000001072883606 ],
                    "proportion": 0.5,
                    "rounded": 0
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-49", 0 ],
                    "midpoints": [ 50.5, 492.0, 50.5, 492.0 ],
                    "order": 3,
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-67", 0 ],
                    "midpoints": [ 50.5, 519.0, 114.5, 519.0 ],
                    "order": 2,
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-68", 0 ],
                    "midpoints": [ 50.5, 519.0, 178.5, 519.0 ],
                    "order": 1,
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-74", 0 ],
                    "midpoints": [ 50.5, 519.0, 242.5, 519.0 ],
                    "order": 0,
                    "source": [ "obj-100", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-22", 0 ],
                    "midpoints": [ 55.5, 90.0, 55.5, 90.0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-64", 0 ],
                    "midpoints": [ 1005.5, 213.0, 1005.5, 213.0 ],
                    "source": [ "obj-110", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "midpoints": [ 355.5, 90.0, 355.5, 90.0 ],
                    "order": 0,
                    "source": [ "obj-117", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-40", 0 ],
                    "midpoints": [ 355.5, 105.0, 168.5, 105.0 ],
                    "order": 1,
                    "source": [ "obj-117", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-117", 0 ],
                    "midpoints": [ 355.5, 57.0, 355.5, 57.0 ],
                    "source": [ "obj-118", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "midpoints": [ 305.5, 234.0, 387.5, 234.0 ],
                    "source": [ "obj-130", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-110", 0 ],
                    "midpoints": [ 1153.5, 171.0, 1005.5, 171.0 ],
                    "order": 1,
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "midpoints": [ 1153.5, 150.0, 1154.5, 150.0 ],
                    "order": 0,
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-152", 0 ],
                    "midpoints": [ 241.5, 666.0, 588.5, 666.0 ],
                    "source": [ "obj-149", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "midpoints": [ 114.16666666666666, 666.0, 173.5, 666.0 ],
                    "order": 1,
                    "source": [ "obj-149", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-29", 0 ],
                    "midpoints": [ 209.66666666666666, 666.0, 439.5, 666.0 ],
                    "source": [ "obj-149", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-30", 0 ],
                    "midpoints": [ 177.83333333333331, 666.0, 339.5, 666.0 ],
                    "source": [ "obj-149", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 1 ],
                    "midpoints": [ 50.5, 639.0, 851.5, 639.0 ],
                    "order": 0,
                    "source": [ "obj-149", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-48", 0 ],
                    "midpoints": [ 146.0, 666.0, 236.5, 666.0 ],
                    "source": [ "obj-149", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "midpoints": [ 82.33333333333333, 666.0, 114.5, 666.0 ],
                    "order": 1,
                    "source": [ "obj-149", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "midpoints": [ 50.5, 675.0, 51.5, 675.0 ],
                    "order": 1,
                    "source": [ "obj-149", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 1 ],
                    "midpoints": [ 82.33333333333333, 639.0, 1000.5, 639.0 ],
                    "order": 0,
                    "source": [ "obj-149", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 1 ],
                    "midpoints": [ 114.16666666666666, 639.0, 1130.5, 639.0 ],
                    "order": 0,
                    "source": [ "obj-149", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-56", 0 ],
                    "midpoints": [ 1154.5, 213.0, 1154.5, 213.0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-180", 0 ],
                    "midpoints": [ 365.5, 354.0, 365.5, 354.0 ],
                    "source": [ "obj-156", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "midpoints": [ 387.5, 213.0, 387.5, 213.0 ],
                    "source": [ "obj-159", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-168", 1 ],
                    "midpoints": [ 1557.5, 237.0, 1394.5, 237.0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "midpoints": [ 55.5, 57.0, 55.5, 57.0 ],
                    "source": [ "obj-167", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-34", 0 ],
                    "midpoints": [ 1333.5, 279.0, 1333.5, 279.0 ],
                    "source": [ "obj-168", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-130", 0 ],
                    "midpoints": [ 355.5, 171.0, 305.5, 171.0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-156", 0 ],
                    "midpoints": [ 366.0, 147.0, 365.5, 147.0 ],
                    "source": [ "obj-19", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-159", 0 ],
                    "midpoints": [ 376.5, 171.0, 387.5, 171.0 ],
                    "source": [ "obj-19", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-168", 0 ],
                    "midpoints": [ 418.5, 171.0, 1333.5, 171.0 ],
                    "source": [ "obj-19", 6 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "midpoints": [ 408.0, 171.0, 759.5, 171.0 ],
                    "source": [ "obj-19", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-51", 0 ],
                    "midpoints": [ 397.5, 171.0, 896.5, 171.0 ],
                    "source": [ "obj-19", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-75", 0 ],
                    "midpoints": [ 387.0, 171.0, 573.5, 171.0 ],
                    "source": [ "obj-19", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "midpoints": [ 1005.5, 318.0, 1005.5, 318.0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "midpoints": [ 1154.5, 336.0, 1005.5, 336.0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 0 ],
                    "midpoints": [ 55.5, 126.0, 55.5, 126.0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-168", 1 ],
                    "midpoints": [ 1475.5, 237.0, 1394.5, 237.0 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-25", 0 ],
                    "midpoints": [ 55.5, 159.0, 55.5, 159.0 ],
                    "source": [ "obj-24", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 0 ],
                    "midpoints": [ 55.5, 213.0, 55.5, 213.0 ],
                    "source": [ "obj-25", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-96", 0 ],
                    "midpoints": [ 776.5, 492.0, 776.5, 492.0 ],
                    "order": 3,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-97", 0 ],
                    "midpoints": [ 776.5, 510.0, 925.5, 510.0 ],
                    "order": 2,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-98", 0 ],
                    "midpoints": [ 776.5, 510.0, 1055.5, 510.0 ],
                    "order": 1,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-99", 0 ],
                    "midpoints": [ 776.5, 510.0, 1185.5, 510.0 ],
                    "order": 0,
                    "source": [ "obj-27", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-168", 1 ],
                    "midpoints": [ 1393.5, 213.0, 1394.5, 213.0 ],
                    "source": [ "obj-28", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-28", 0 ],
                    "midpoints": [ 1393.5, 159.0, 1393.5, 159.0 ],
                    "source": [ "obj-36", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-47", 0 ],
                    "midpoints": [ 168.5, 213.0, 168.5, 213.0 ],
                    "source": [ "obj-40", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "midpoints": [ 1475.5, 159.0, 1475.5, 159.0 ],
                    "source": [ "obj-41", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-50", 0 ],
                    "midpoints": [ 1231.5, 336.0, 1005.5, 336.0 ],
                    "source": [ "obj-43", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "midpoints": [ 1557.5, 159.0, 1557.5, 159.0 ],
                    "source": [ "obj-45", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-54", 0 ],
                    "midpoints": [ 776.5, 681.0, 776.5, 681.0 ],
                    "source": [ "obj-46", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-42", 1 ],
                    "midpoints": [ 168.5, 273.0, 99.5, 273.0 ],
                    "source": [ "obj-47", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-149", 0 ],
                    "midpoints": [ 50.5, 558.0, 50.5, 558.0 ],
                    "source": [ "obj-49", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-44", 0 ],
                    "midpoints": [ 759.5, 213.0, 759.5, 213.0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-46", 0 ],
                    "midpoints": [ 776.5, 621.0, 776.5, 621.0 ],
                    "source": [ "obj-52", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-57", 0 ],
                    "midpoints": [ 1154.5, 243.0, 1154.5, 243.0 ],
                    "source": [ "obj-56", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "midpoints": [ 1154.5, 279.0, 1154.5, 279.0 ],
                    "source": [ "obj-57", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-52", 0 ],
                    "midpoints": [ 776.5, 582.0, 776.5, 582.0 ],
                    "source": [ "obj-59", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-66", 0 ],
                    "midpoints": [ 925.5, 582.0, 925.5, 582.0 ],
                    "source": [ "obj-60", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-76", 0 ],
                    "midpoints": [ 1055.5, 582.0, 1055.5, 582.0 ],
                    "source": [ "obj-61", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-72", 0 ],
                    "midpoints": [ 1185.5, 582.0, 1185.5, 582.0 ],
                    "source": [ "obj-62", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "midpoints": [ 1005.5, 279.0, 1005.5, 279.0 ],
                    "source": [ "obj-63", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-63", 0 ],
                    "midpoints": [ 1005.5, 243.0, 1005.5, 243.0 ],
                    "source": [ "obj-64", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-70", 0 ],
                    "midpoints": [ 925.5, 621.0, 925.5, 621.0 ],
                    "source": [ "obj-66", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-149", 1 ],
                    "midpoints": [ 114.5, 558.0, 114.16666666666666, 558.0 ],
                    "source": [ "obj-67", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-149", 2 ],
                    "midpoints": [ 178.5, 558.0, 177.83333333333331, 558.0 ],
                    "source": [ "obj-68", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-73", 0 ],
                    "midpoints": [ 1185.5, 621.0, 1185.5, 621.0 ],
                    "source": [ "obj-72", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-149", 3 ],
                    "midpoints": [ 242.5, 558.0, 241.5, 558.0 ],
                    "source": [ "obj-74", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-71", 0 ],
                    "midpoints": [ 573.5, 234.0, 387.5, 234.0 ],
                    "source": [ "obj-75", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-77", 0 ],
                    "midpoints": [ 1055.5, 621.0, 1055.5, 621.0 ],
                    "source": [ "obj-76", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-59", 0 ],
                    "midpoints": [ 776.5, 552.0, 776.5, 552.0 ],
                    "source": [ "obj-96", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-60", 0 ],
                    "midpoints": [ 925.5, 552.0, 925.5, 552.0 ],
                    "source": [ "obj-97", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-61", 0 ],
                    "midpoints": [ 1055.5, 552.0, 1055.5, 552.0 ],
                    "source": [ "obj-98", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-62", 0 ],
                    "midpoints": [ 1185.5, 552.0, 1185.5, 552.0 ],
                    "source": [ "obj-99", 0 ]
                }
            }
        ],
        "bgcolor": [ 0.0, 0.0, 0.0, 1.0 ],
        "editing_bgcolor": [ 0.0, 0.0, 0.0, 1.0 ]
    }
}