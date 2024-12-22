
'--- local/hybrids                                        [dev/7zrun][stamp.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick PRE
Option Explicit

function myTimeStamp()
  dim dt: dt = now()
  dim tt: tt = timer()
  dim yy: yy = year(dt)
  dim mo: mo = right("0" & month(dt) , 2)
  dim dd: dd = right("0" & day(dt)   , 2) 
  dim hh: hh = right("0" & hour(dt)  , 2)
  dim mm: mm = right("0" & minute(dt), 2) 
 'dim ss: ss = right("0" & second(dt), 2) 
 'dim ms: ms = int((tt - int(tt)) * 1000 + 0.5): ms = right("0" & ms, 3)
  myTimeStamp = "[" & yy & "-" & mo & "m-" & dd & "][" & hh & "h-" & mm & "m" & "]"
end function

