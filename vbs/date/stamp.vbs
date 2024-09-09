'--- local/hybrids                                              [date/stamp.vbs]
'[2024-09-09][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                                       [date/stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick
'
' includeVBS("../numeric.vbs")
' includeVBS("../padding.vbs")
' includeVBS("../errCode.vbs")
' includeVBS("../assert.vbs")
' includeVBS("../glob.vbs")
' includeVBS("value.vbs")
' includeVBS("import.vbs")
' includeVBS("export.vbs")

class DTStamp

  private m_value  'DSTValue
  private m_import 'DSTImport
  private m_export 'DSTExport

 'in: DTStamp, DTSValue, Date, Numeric, String
 'in: Nothing, Null, Empty -> used by default
  public default function init(v) 
    input(v): set init = me
  end function

 'String
  property Get import() import = m_import.format end property
  property Get export() export = m_export.format end property

 'DTSValue
  property Get value() set value = m_value end property   

 'in: DTStamp, DTSValue, Date, Numeric, String
 'in: Nothing, Null, Empty -> used by default
  property Let value(v) setValue v end property   
  property Set value(v) setValue v end property   

 'String: by user-export-format
  property Get stamp() stamp = m_export.stamp(m_value) end property

 'String, Null, Empty
  property Let import(v) setImportFormat v end property
 'DTStamp, DTSImport, Nothing
  property Set import(v) setImportFormat v end property

 'String, Null, Empty
  property Let export(v) setExportFormat v end property
 'DTStamp, DTSExport, Nothing
  property Set export(v) setExportFormat v end property

 'Numeric
  property Let ms(v) m_value.ms = v end property 

 'DTStamp, DTSValue, String, Date, Numeric
  property Let date(v) setDate v end property   
  property Set date(v) setDate v end property   

 'getters:
  property Get date() date = m_value.date end property  'DTSValue
  property Get yy()   yy = m_value.yy     end property  'String
  property Get mo()   mo = m_value.mo     end property  'String
  property Get dd()   dd = m_value.dd     end property  'String
  property Get hh()   hh = m_value.hh     end property  'String
  property Get mm()   mm = m_value.mm     end property  'String
  property Get ss()   ss = m_value.ss     end property  'String
  property Get ms()   ms = m_value.ms     end property  'String

  property Get timeOnly()  'String  : 23:19:55
    timeOnly = m_value.timeOnly()
  end property

  property Get timeStamp() 'String  : 23:19:55.123
    timeStamp = m_value.timeStamp()
  end property

  property Get dateStamp() 'String  : 2024-08-09
    dateStamp = m_value.dateStamp()
  end property

  property Get logsStamp() 'String  : [2024-08-09][23:19:55.123]
    logsStamp = m_value.logsStamp()
  end property

  property Get fileStamp() 'String  : [2024-08m-09][23h-19m]
    fileStamp = m_value.fileStamp()
  end property

  property Let posix(sec) 'Numeric: POSIX-seconds
    m_value.posix = sec
  end property

  property Get posix() 'Int
    posix = m_value.posix
  end property

  sub addSeconds(sec) 'Numeric
    m_value.addSeconds(sec)
  end sub

  sub addMilliseconds(msec) 'Numeric
    m_value.addMilliseconds(msec)
  end sub

  sub now() 'set current datetime with ms
    m_value.now()
  end sub

  function clone
    dim obj: set obj = (new DTStamp)(m_value.clone())
    set obj.export = m_export.clone()
    set obj.import = m_import.clone()
    set clone = obj
  end function

'---[PRIVATE]-------------------------

 'DTStamp, DTSImport, Null, Nothing, Empty
  private sub setImportFormat(v) 
    dim tn: tn = typename(v)
    if tn = "DTStamp" then
      m_import.format = v.import
    elseif tn = "DTSImport" then
      m_import.format = v.format
    else
      m_import.format = v
    end if
  end sub

 'DTStamp, DTSExport, Null, Nothing, Empty
  private sub setExportFormat(v) 
    dim tn: tn = typename(v)
    if tn = "DTStamp" then
      m_export.format = v.export
    elseif tn = "DTSExport" then
      m_export.format = v.format
    else
      m_export.format = v
    end if
  end sub

  private sub setValue(v)
    if typename(v) = "DTSValue" then
      set m_value = v.clone()
    else
      set m_value = v
    end if
  end sub

 'String, Date, Numeric
  private sub setDate(v) 
    if vartype(v) = vbString then
      dim dt: set dt = m_import.parse(v)
      set m_value.date = dt
    else
      m_value.date = v 
    end if
  end sub   

 'DTStamp, DTSImport, Null, Nothing, Empty
  private sub input(v)
    if isArray(v) then
      exitByAssert typename(me), "unexpected type: 'Array'"
    elseif IsObject(v) then
      if v is nothing then
        defValues()
      elseif typename(v) = "DTSValue" then
        date = v
      elseif typename(v) = "DTSImport" then
        m_import.format = v.format
      elseif typename(v) = "DTSExport" then
        m_export.format = v.format
      elseif typename(v) = "DTStamp" then
        m_import.format = v.format
        m_export.format = v.format
        m_value.date = v.value.clone()
      else
        exitByAssert "DTStamp.input", "unexpected object: '" & typename(v) & "'"
      end if
    elseif IsNull(v) then
      defValues()
    elseif vartype(v) = vbEmpty then
      defValues()
    elseif vartype(v) = vbString then
      if v = Empty then
        defValues()
      else
        dim dt: set dt = m_import.parse(v)
        set m_value.date = dt
      end if
    else
      m_value.date = v
    end if
  end sub

  private sub defValues()
    m_value.date = 0
  end sub

  private sub Class_Initialize()
    set m_import = new DTSImport
    set m_export = new DTSExport
    set m_value  = new DTSValue
  end sub
end class
