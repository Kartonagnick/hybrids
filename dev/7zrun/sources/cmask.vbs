
'--- local/hybrids                                        [dev/7zrun][cmask.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick    
'  based on the story:
'  --- local/hybrids                                              [vbs/mask.vbs]
'  [2024-03-08][19:00:00] 002 Kartonagnick
'  [2024-02-23][06:50:00] 001 Kartonagnick
'    --- CastleOfDreams\hybrids                                       [mask.vbs]
'    [2022-02-06][19:00:00] 001 Kartonagnick
'      --- CastleOfDreams\vbs                                         [mask.vbs]
'      [2021-08-08][19:00:00] 002 Kartonagnick
'      [2021-07-29][23:30:00] 001 Kartonagnick

class CMask
  private m_regexp
  private m_list

  public default function init(list_of_masks)
    me.pattern = list_of_masks
    set init = me
  end function

  property let pattern(v) 
    set m_list = masksToRegexp(v)
  end property

  ' IgnoreCase
  ' Empty VS Value -> check
  ' Empty VS Once --> false
  ' Empty VS Empty -> true
  ' Empty VS Any ---> true
  ' Value VS Any ---> true
  ' Value VS Empty -> true
  ' Value VS Once --> check
  ' Value VS Value -> check
  function match(text)
    if typeName(text) = "File" then
      match = match(text.Name)
    elseif typeName(text) = "Folder" then
      match = match(text.Name)
    else
      dim rxp
      for each rxp in m_list
        m_regexp.Pattern = rxp
        if m_regexp.Test(text) then
          match = true
          exit function
        end if
      next
      match = false
    end if
  end function

'---[PRIVATE]-------------------------

  private function masksToRegexp(masks)
    dim el, result
    set result = CreateObject("System.Collections.ArrayList")
    m_regexp.Pattern = "([\(\)\{\}\[\]\|\\\/\.\^\$])"
    for each el in split(masks, ";")
      el = trim(el)
      if el <> Empty then
        result.add maskToRegexp(el)
      end if
    next
    set masksToRegexp = result
  end function

  ' escaping service characters: ( ) { } [ ] | \ / . ^ \ $
  ' * -> .*
  ' ? -> .
  ' add ^ to the beginning: ^mask
  ' add an $ to the end: mask$
  ' example: "*.*" -> "^.*\..*$"
  private function maskToRegexp(mask)
    dim tmp
    tmp = m_regexp.Replace(mask, "\$1")
    tmp = Replace(tmp, "*", ".*")
    tmp = Replace(tmp, "?", ".")
    maskToRegexp = "^" + tmp + "$"
  end function

  private sub Class_Initialize()
    set m_regexp = new RegExp
    m_regexp.IgnoreCase = true
    m_regexp.Global = true
    set m_list = CreateObject("System.Collections.ArrayList")
  end sub
end class
