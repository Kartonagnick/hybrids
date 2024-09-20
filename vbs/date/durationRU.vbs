
'--- local/hybrids                                         [date/durationRU.vbs]
'[2024-09-20][19:00:00] 002 Kartonagnick    
'  --- CastleOfDreams/vbs                                  [date/duration.vbs]
'  [2021-09-06][19:00:00] 002 Kartonagnick
'  [2021-09-04][18:00:00] 001 Kartonagnick

function durationFrom_RU(ms, sec, min, hours, byval days)
  dim years, result

  years  = Fix(days / 365)
  days   = days mod 365
  result = ""   

  if(years > 0) then
    if(years = 1) then
      result = ", 1 год"
    elseif(years < 5) then    
      result = ", " & years & " года"  
    else
      result = ", " & years & " лет"
    end if
  end if  

  if(days > 0) then
    if(days = 1) then
      result = result & ", 1 день"
    elseif(days < 5) then    
      result = ", " & years & " дня"  
    else
      result = result & ", " & days & " дней"
    end if
  end if  

  if(hours > 0) then
    if(hours = 1) then
      result = result & ", 1 час"
    elseif(hours < 5) then    
      result = result & ", " & hours & " часа"  
    else
      result = result & ", " & hours & " часов"
    end if
  end if  

  if(min > 0) then
    result = result & ", " & min & " мин"
  end if

  if(sec > 0) then
    result = result & ", " & sec & " сек"
  end if

  if(ms > 0) then
   result = result & ", " & ms & " мс"
  end if

  if(result <> "") then
    result = right(result, len(result) - 2)
  end if

  durationFrom_RU = result
end function

function durationFromSeconds_RU(seconds)
  dim v, s, m, h, d
  v = int(seconds / 60)
  s = seconds     mod 60
  m =     v       mod 60
  h = int(v / 60) mod 24
  d = int(v / 60 / 24)
  durationFromSeconds_RU = durationFrom_RU(0, s, m, h, d)
  if(durationFromSeconds_RU = Empty) then
    durationFromSeconds_RU = "0 сек"
  end if
end function

function durationFromMS_RU(milliseconds)
  dim v, ms, s, m, h, d
  v = int(milliseconds / 1000)
  ms = milliseconds mod 1000
  s  =     v            mod 60
  m  = int(v / 60)      mod 60
  h  = int(v / 60 / 60) mod 24
  d  = int(v / 60 / 60 / 24)
  durationFromMS_RU = durationFrom_RU(ms, s, m, h, d)
  if(durationFromMS_RU = Empty) then
    durationFromMS_RU = "0 мс"
  end if
end function
