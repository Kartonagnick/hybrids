
'--- local/hybrids                                                    [path.vbs]
'[2024-02-21][12:30:00] 001 Kartonagnick    
'  --- CastleOfDreams\hybrids                                         [path.vbs]
'  [2022-02-10][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                           [path.vbs]
'    [2021-08-08][19:00:00] 002 Kartonagnick
'    [2021-07-24][20:00:00] 001 Kartonagnick

' functions:
'   isAbsolutePath(path)
'   relativePath(general, target)
'   canonicalPathList(path)
'   canonicalPath(path)

' example:
'   isAbsolutePath("C:\") -----> true
'   isAbsolutePath("C:/") -----> true
'   isAbsolutePath("\path") ---> true
'   isAbsolutePath("\\path") --> true
'   isAbsolutePath("/path") ---> true
'   isAbsolutePath("//path") --> true
'   isAbsolutePath("path") ----> false
'   isAbsolutePath("./path") --> false

function isAbsolutePath(path)
  isAbsolutePath = true
  dim a: a = UCase(Left(path, 1))
  if (a >= "A" and a <= "Z") or (a >= "a" and a <= "z") then 
    dim b: b = UCase(Mid(path, 2, 2))
    if b = ":\" or b = ":/" then 
      exit Function
    end if
  end if
  if a = "\" or a = "/" then exit function
  isAbsolutePath = false
end function

' make normalized Windows`s path:
' 1. convert slash: '/' --> '\'
' 2. remove points.
' example:
'   a/b/../c/d          --> a\c\d
'   a/b/../../c/d       --> c\d
'   a/b/../../../c/d    --> ..\c\d
'   a/b/../../../../c/d --> ..\..\c\d

function canonicalPathList(path)
  dim winpath: dim collect: dim elem

  winpath = Replace(path, "/", "\")
  dim arr: arr = Split(winpath, "\", -1, 0)
  set collect = CreateObject("System.Collections.ArrayList")

  for each elem in arr
    if elem <> Empty and elem <> "." then
      if collect.Count = 0 or elem <> ".." then
        collect.Add(elem)
      else
        dim last: last = collect.Count - 1
        if collect.Item(last) = ".." then 
          collect.Add(elem)
        else
          collect.RemoveAt(last)
        end if
      end if
    end if
  next
  set canonicalPathList = collect
end function

function canonicalPath(path)
  dim lst: set lst = canonicalPathList(path)
  dim arr: arr = lst.toArray
  canonicalPath = Join(arr, "\")
end function

'===============================================================================
'===============================================================================

' this function make relative path:
'   target = general + relative
'   relative = target - general
'
' example:
'   relativePath("a/b", "a/b/c/d") ------------------------> "c\d"
'   relativePath("a/b", "a/b/c/d/../../") -----------------> ""
'   relativePath("a/b", "a/b/c/d/../../f") ----------------> "f"
'   relativePath("a/b/../c", "a/c/f/h") -------------------> "f/h"

'   relativePath("a/b", "a/b/c/d/../../../f") -------------> "..\f"
'   relativePath("a/b", "a/b/c/d/../../../../../f") -------> "..\..\..\f"
'   relativePath("a/b/../c", "a/b/c/d/../../../../../f") --> "..\..\..\f"

'   relativePath("a/c"  , "../f") -------------------------> "..\..\..\f"
'   relativePath("a/c"  , "f") ----------------------------> "..\..\f"
'   relativePath("a/b/c", "a/f") --------------------------> "..\..\f"
'   relativePath("a/b/c", "b/f") --------------------------> "..\..\..\b\f"
               
function relativePath(general, target)

  dim g_list: set g_list = canonicalPathList(general)
  dim t_list: set t_list = canonicalPathList(target)

  if g_list.count = 0 then
    relativePath = relativeA_(t_list)
    exit function
  end if

  if t_list.count = 0 then
    relativePath = relativeA_(g_list)
    exit function
  end if

  dim g_bound: g_bound = g_list.count - 1
  dim t_bound: t_bound = t_list.count - 1
  dim bound: bound = minElementPath_(g_bound, t_bound)

  dim i
  for i = 0 to bound
    if g_list(i) <> t_list(i) then
      exit for
    end if
  next

  if i > bound and bound = t_bound then
    exit function
  end if

  dim l_part: l_part = relativeL_(g_bound - i)
  dim r_part: r_part = relativeR_(i, t_bound, t_list)
  relativePath = l_part & r_part
end function

function minElementPath_(a, b)
  if a > b then
    minElementPath_ = b
  else
    minElementPath_ = a
  end if
end function

function relativeL_(bound)
  dim i
  for i = 0 to bound
    relativeL_ = relativeL_ & "..\"
  next
end function

function relativeR_(beg, bound, collect)
  dim i: dim re: re = ""
  for i = beg to bound
    re = re & collect(i) & "\"
  next
  if len(re) > 0 then
    relativeR_ = left(re, len(re) - 1)
  else 
    relativeR_ = ""
  end if
end function

function relativeA_(collect)
  if collect.count = 0 then
    relativeA_ = ""
    exit function
  end if 
  dim el: dim re: re = ""
  for each el in collect
    re = re & el & "\"
  next
  relativeA_ = left(re, len(re) - 1)
end function
