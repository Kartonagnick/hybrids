
'--- local/hybrids                                           [date/duration.vbs]
'[2024-09-20][19:00:00] 002 Kartonagnick PRE
'  --- CastleOfDreams/vbs                                    [date/duration.vbs]
'  [2021-09-06][19:00:00] 002 Kartonagnick
'  [2021-09-04][18:00:00] 001 Kartonagnick

function durationFrom(ms, sec, min, hours, byval days)
  dim years, result

  years  = days / 365
  days   = days mod 365
  result = ""   

  if(years = 1) then
    result = ", 1 year"
  elseif(years > 1) Then
    result = ", " & years & " years"
  end if

  if(days = 1) then
    result = result & ", 1 day"
  elseif(days > 1) then
    result = result & ", " & days & " days"
  end if

  if(hours = 1) then
    result = result & ", 1 hour"
  elseif(hours > 1) then
    result = result & ", " & hours & " hours"
  end if

  if(min <> 0) then
    result = result & ", " & min & " min"
  end if

  if(sec <> 0) then
    result = result & ", " & sec & " sec"
  end if

  if(ms <> 0) then
   result = result & ", " & ms & " ms"
  end if

  if(result <> "") then
    result = right(result, len(result) - 2)
  end if

  durationFrom = result
end function

function durationFromSeconds(seconds)
  dim v, s, m, h, d
  v = int(seconds / 60)
  s = seconds     mod 60
  m =     v       mod 60
  h = int(v / 60) mod 24
  d = int(v / 60 / 24)
  durationFromSeconds = durationFrom(0, s, m, h, d)
  if(durationFromSeconds = Empty) then
    durationFromSeconds = "0 sec"
  end if
end function

function durationFromMS(milliseconds)
  dim v, ms, s, m, h, d
  v = int(milliseconds / 1000)
  ms = milliseconds mod 1000
  s  =     v            mod 60
  m  = int(v / 60)      mod 60
  h  = int(v / 60 / 60) mod 24
  d  = int(v / 60 / 60 / 24)
  durationFromMS = durationFrom(ms, s, m, h, d)
  if(durationFromMS = Empty) then
    durationFromMS = "0 ms"
  end if
end function
