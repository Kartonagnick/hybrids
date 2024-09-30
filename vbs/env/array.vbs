
'--- local/hybrids                                               [env/array.vbs]
'[2024-09-30][19:00:00] 001 Kartonagnick PRE
' includeVBS("../runCmd.vbs")

function fromEnvironmentArray(arr_name)
  set fromEnvironmentArray = CreateObject("System.Collections.ArrayList")
  dim elem, pos, result: set result = runCmd("set " & arr_name & "[")
  if result.code <> 0 then exit function
  for each elem in Split(result.stdout, vbNewLine)
    elem = trim(elem)
    if elem <> empty then 
      pos = Instr(1, elem, "=")
      if pos <> 0 then 
        if len(elem) > pos then 
          elem = Right(elem, len(elem) - pos)
          fromEnvironmentArray.add elem
        end if
      end if
    end if
  next
end function
