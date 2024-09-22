
'--- local/hybrids                                              [date/point.vbs]
'[2024-09-22][19:00:00] 001 Kartonagnick PRE
'
' includeVBS("../numeric.vbs")
' includeVBS("../padding.vbs")
' includeVBS("../errCode.vbs")
' includeVBS("../assert.vbs")
' includeVBS("../glob.vbs")
' includeVBS("value.vbs")
' includeVBS("duration.vbs")

' determining the duration of the procedures:
'   sub begTimePoint()                          ' make timepoint
'   function endTimePoint()                     ' TimePoint: return timepoint with current time
'   function durationTimerPointSeconds()        ' String: duration: 2 min, 5 sec
'   function durationTimePointMS()              ' String: duration: 2 min, 5 sec, 123 ms
'
' class TimePoint
'   sub start()                                 ' set current time: DTSValue.now 
'   function elapsedSeconds()                   ' Int: number of seconds elapsed
'   function elapsedMS()                        ' Int: number of milliseconds elapsed
'   function durationSeconds()                  ' String: duration: 2 min, 5 sec
'   function durationMS()                       ' String: duration: 2 min, 5 sec, 123 ms

class TimePoint
  private dtv 'DTSValue

  sub start()
    dtv.now
  end sub

  function elapsedSeconds()
    dim cur: set cur = new DTSValue
    elapsedSeconds = cur.posix - dtv.posix 
  end function

  function elapsedMS()
    dim sec, ms, cur: set cur = new DTSValue
   'echo 10, "beg " & dtv.logsStamp & " --- end " & cur.logsStamp 
    sec = cur.posix - dtv.posix
    if cur.ms >= dtv.ms then
      ms = cur.ms - dtv.ms
    else
      ms = 1000 - dtv.ms + cur.ms
      sec = sec - 1
    end if
    elapsedMS = sec * 1000 + ms
  end function

  function durationSeconds()
    durationSeconds = durationFromSeconds(elapsedSeconds())
  end function

  function durationMS()
    durationMS = durationFromMS(elapsedMS())
  end function

  private sub Class_Initialize()
    set dtv = new DTSValue
  end sub
end class

dim g_stack_timepoint_423gh4g2h3
set g_stack_timepoint_423gh4g2h3 = CreateObject("System.Collections.ArrayList")

sub begTimePoint()
  g_stack_timepoint_423gh4g2h3.add new TimePoint
end sub

function endTimePoint()
  dim cnt: cnt = g_stack_timepoint_423gh4g2h3.count  
  if cnt = 0 then exit function
  set endTimePoint = g_stack_timepoint_423gh4g2h3(cnt - 1)
  g_stack_timepoint_423gh4g2h3.RemoveAt(cnt - 1)
end function

function durationTimerPointSeconds()
  durationTimerPointSeconds = endTimePoint().durationSeconds()
end function

function durationTimePointMS()
  durationTimePointMS = endTimePoint().durationMS()
end function
