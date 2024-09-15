
'--- local/hybrids                                              [date/range.vbs]
'[2024-09-17][19:00:00] 003 Kartonagnick PRE
'  --- CastleOfDreams/vbs                                       [date/range.vbs]
'  [2021-09-06][19:00:00] 001 Kartonagnick
'  [2021-09-03][18:00:00] 001 Kartonagnick
'
' includeVBS("../numeric.vbs")
' includeVBS("../padding.vbs")
' includeVBS("../errCode.vbs")
' includeVBS("../assert.vbs")
' includeVBS("../glob.vbs")
' includeVBS("value.vbs")

'begD  - begin data of range
'endD  - end data of range
'count - number of dates in the range
'
'in: date     -> ArrayList of date
'in: string   -> ArrayList of DTSValue
'in: DTSValue -> ArrayList of DTSValue
'in: DTStamp  -> ArrayList of DTStamp
'assert(typename(begDate) = typename(endDate))
'assert(begDate <= endDate)
'assert(count >= 0)
function dateRange(begDate, endDate, count) 
  dim help, tn, vt: vt = vartype(begDate)
  set help = new dateRangePrivate
  help.checkType begDate, endDate
  help.checkCount count
  if vt = vbDate then
    set dateRange = help.forDate(begDate, endDate, count)
  elseif vt = vbString then  
    dim bv: set bv = (new DTSValue)(begDate, nothing)
    dim ev: set ev = (new DTSValue)(endDate, nothing)
    set dateRange = help.forValue(bv, ev, count)
  else
    tn = typename(begDate)
    if tn = "DTSValue" or tn = "DTStamp" then      
      set dateRange = help.forValue(begDate, endDate, count)
    else
      exitByAssert "dateRange", "invalid type: " & tn
    end if
  end if
end function

class dateRangePrivate

  sub checkType(b, e) 
    dim bt, et: bt = typename(b): et = typename(e)
    if bt <> et then
      exitByAssert "dateRange", "invalid type: " & bt & " VS " & et
    end if
  end sub

  sub checkDate(b, e) 
    if b > e then
      dim reason: reason = "beg " & b & " must be >= end " & e
      err.Raise errorOutRange, "dateRange", reason
    end if
  end sub

  sub checkValue(b, e) 
    dim bs, es: bs = b.logsStamp(): es = e.logsStamp()
    dim reason: reason = "beg " & bs & " must be >= end " & es
    if b.posix > e.posix then
      err.Raise errorOutRange, "dateRange", reason
    elseif b.posix = e.posix then
      if b.ms > e.ms then
        err.Raise errorOutRange, "dateRange", reason
      end if
    end if
  end sub

  sub checkCount(count)
    if count < 0 then 
      dim reason
      reason = "count = " & count & ", must be >=0"
      err.Raise errorOutRange, "dateRange", reason
    end if
  end sub

  function forDate(byval begDate, byval endDate, count) 
    checkDate begDate, endDate 

    dim beg_seconds, end_seconds, diff_seconds
    dim from: from = #1970-01-01 00:00:00#
    dim offset, result

    beg_seconds = DateDiff("s", from, begDate)
    end_seconds = DateDiff("s", from, endDate)
    diff_seconds = end_seconds - beg_seconds
    offset = diff_seconds / count

    set result = CreateObject("System.Collections.ArrayList")
    result.add begDate
    dim i, cur: cur = begDate
    for i = 1 to count - 1
      cur = DateAdd("s", offset, cur)
      result.add cur
    next
    result.add endDate
    set forDate = result
  end function

  function forValue(begD, endD, count) 
    checkValue begD, endD

    dim offset_sec, offset_ms, result 
    dim diff_seconds, diff_ms, cur, i
    dim begPosix: begPosix = begD.posix
    dim endPosix: endPosix = endD.posix

    if endD.ms >= begD.ms then
      diff_ms = endD.ms - begD.ms
    else
      diff_ms = 1000 - begD.ms + endD.ms
    end if

    diff_seconds = endPosix - begPosix
    offset_sec = diff_seconds / count
    offset_ms  = diff_ms / count
  
    set result = CreateObject("System.Collections.ArrayList")
    result.add begD.clone
    set cur = begD.clone
    for i = 1 to count - 1
      cur.addSeconds(offset_sec)
      cur.addMilliseconds(offset_ms)
      result.add cur.clone
    next
    result.add endD.clone
    set forValue = result
  end function
end class
