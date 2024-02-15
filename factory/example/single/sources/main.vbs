
'--- local/hybrids                                    [example/single][main.vbs]
'[2024-02-15][09:00:00] 001 Kartonagnick    
'  --- Kartonagnick/hybrids                                  [example][main.vbs]
'  [2020-12-31][19:00:00] 001 Kartonagnick

WScript.Echo "main.vbs"
function main()
  WScript.Echo "main(): begin..."
    body1
    body2
  WScript.Echo "main(): done"
end function

On Error Resume Next
Err.Clear
main()
On Error Goto 0
