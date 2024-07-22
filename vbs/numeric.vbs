
'--- local/hybrids                                                 [numeric.vbs]
'[2024-07-24][19:00:00] 001 Kartonagnick PRE
'
' includeVBS("errCode.vbs")
'
' functions:
'   function toNumeric(v)
'   function toDouble(v)

' if v: String -> correct point or comma
' if v: Nothing, Empty, Null -> 0
' if v: Bool -> 1 or 0
function toNumeric(v)
  if vartype(v) = vbBoolean then
    if(v) then toNumeric = 1 else toNumeric = 0
  elseif IsNumeric(v) then
    toNumeric = v
  elseif IsObject(v) then
    if v is nothing then
      toNumeric = 0
    else
      assertNumeric "unexpected object: '" & typename(v) & "'"
    end if
  elseif isArray(v) then
    assertNumeric "unexpected type: 'Array'"
  elseif IsNull(v) or v = Empty then
    toNumeric = 0
  elseif vartype(v) = vbString then
    dim txt: txt = replace(v, ".", ",")
    if IsNumeric(txt) then
      toNumeric = txt
    else
      txt = replace(v, ",", ".")
      if IsNumeric(txt) then
        toNumeric = txt
      else
        dim errorInvalidText: errorInvalidText = vbObjectError + 12
        dim reason: reason = "invalid string: '" & v & "'"
        err.Raise errorInvalidText, "toNumeric", reason
      end if
    end if
  else
    assertNumeric "unexpected type: '" & typename(v) & "'"
  end if
end function

function toDouble(v)
  toDouble = Cdbl(toNumeric(v))
end function

sub assertNumeric(desc)
  WScript.Echo "[ERROR][ASSERT] toNumeric: " & desc
  WScript.Quit 1
end sub
