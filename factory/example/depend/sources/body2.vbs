
'--- local/hybrids                                   [example/depend][body2.vbs]
'[2024-02-15][09:00:00] 001 Kartonagnick    

includeVBS("body1.vbs")
includeVBS("body2.vbs")
includeVBS("additional/xxxx.vbs")

WScript.Echo "body2.vbs"
sub body2()
  WScript.Echo "body2(): begin..."
  WScript.Echo "body2(): done"
end sub
