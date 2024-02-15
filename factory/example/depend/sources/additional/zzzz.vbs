
'--- local/hybrids                                    [example/depend][zzzz.vbs]
'[2024-02-15][09:00:00] 001 Kartonagnick PRE

includeVBS("..\body1.vbs")
includeVBS("..\body2.vbs")
includeVBS("zzzz.vbs")
includeVBS("xxxx.vbs")

WScript.Echo "zzzz.vbs"
