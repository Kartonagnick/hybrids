
'--- local/hybrids                                           [numeric/check.vbs]
'[2024-07-26][19:00:00] 001 Kartonagnick PRE
'
' if v: String -> сorrect dot or comma symbol
' if v: Nothing, Empty, Null -> 0
' if v: Bool -> 1 or 0
' if success -> return empty string
' if error -> reteturn error message
function checkNumeric(v)
  checkNumeric = ""
  if vartype(v) = vbBoolean then
    if(v) then v = 1 else v = 0
  elseif IsNumeric(v) then
    'nothing
  elseif IsObject(v) then
    if v is nothing then
      v = 0
    else
      checkNumeric = "unexpected object: '" & typename(v) & "'"
    end if
  elseif isArray(v) then
    checkNumeric = "unexpected type: Array"
  elseif IsNull(v) or v = Empty then  
    v = 0
  elseif vartype(v) = vbString then
    dim txt: txt = replace(v, ".", ",")
    if IsNumeric(txt) then
      v = txt
    else
      txt = replace(v, ",", ".")
      if IsNumeric(txt) then
        v = txt
      else
        checkNumeric = "invalid string: '" & v & "'"
      end if
    end if
  else
    checkNumeric = "unexpected type: '" & typename(v) & "'"
  end if
end function
