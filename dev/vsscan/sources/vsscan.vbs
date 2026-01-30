
'--- local/hybrids                                      [dev/vsscan][vsscan.vbs]
'[2026-01-30][11:50:00] 001 Kartonagnick PRE
Option Explicit

sub main()
  dim deep: deep = 0

  echo deep, "beg: " & datestamp()
  dim mark: set mark = new Elapsed  

  dim setup: set setup = new CSettings
  setup.showDebug deep + 1

  dim paths_solutions: set paths_solutions = setup.solutions() 
  echo deep + 1, "found solutions: " & paths_solutions.Count
  dim f_sln, solution, list_vcxproj, f_vcxproj, project
  for each f_sln in paths_solutions
    echo deep + 2, "process: " & f_sln
    set solution = (new CSolution)(setup.dir_repo, f_sln)
    set list_vcxproj = solution.projects()
    for each f_vcxproj in list_vcxproj
      echo deep + 3, "load: " & f_vcxproj
      set project = (new CProject)(deep + 4, setup.dir_repo, f_vcxproj)
      project.run deep + 4
    next
  next
  echo deep, "end: " & datestamp() 
  echo deep, "elapsed: " & mark.value()
end sub

main()
