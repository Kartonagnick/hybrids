
'--- local/hybrids                                                  [minmax.vbs]
'[2024-02-21][18:50:00] 001 Kartonagnick PRE
'  --- CastleOfDreams\hybrids                                       [common.vbs]
'  [2022-01-04][19:00:00] 001 Kartonagnick
'  [2021-12-29][19:00:00] 001 Kartonagnick
'  [2021-12-28][13:55:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                         [common.vbs]
'    [2021-07-19][14:27:00] 001 Kartonagnick

function maxElement(a, b)
  if a > b then
    maxElement = a
  else
    maxElement = b
  end if
end function

function minElement(a, b)
  if a > b then
    minElement = b
  else
    minElement = a
  end if
end function
