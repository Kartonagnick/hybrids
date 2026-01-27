
'--- local/hybrids                                       [sources][diffdate.vbs]
'[2026-01-28][15:40:00] 001 Kartonagnick    

Option Explicit

'...............................................................................

sub main()
  dim d_txt, b_txt, e_txt 
  dim d_obj, b_obj, e_obj
  dim b_sec, e_sec
  dim allow_negative
  dim diff, result

  set d_obj = new DTSValue
  d_txt = d_obj.dateStamp  & " " &  d_obj.timeOnly

  b_txt = fromEnvironment("eBEG_DATE" , d_txt)
  e_txt = fromEnvironment("eEND_DATE" , d_txt)
  allow_negative = fromEnvironment("eALLOW_NEGATIVE", "")

  set b_obj = (new DTSValue)(b_txt, nothing)
  set e_obj = (new DTSValue)(e_txt, nothing)

  b_sec = b_obj.posix
  e_sec = e_obj.posix

  if b_sec <= e_sec then
    diff = e_sec - b_sec
    result = ""
  elseif allow_negative then
    diff = b_sec - e_sec
    result = "- "
  else
    exitByAssert "main", "beg_date must be <= end_date"  
  end if

  result = result & durationFromSeconds(diff)

  dbg 1, "beg: " & b_obj.logsStamp() 
  dbg 1, "end: " & e_obj.logsStamp()

  if gDEBUG then 
    echo 1, "duration: " &  result
  else
    echo 0, result
  end if

end sub

main()
