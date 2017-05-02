********************************************************************************
*!* ctl32.h include file for ctl32 classes
*!*
*!* This file has 4 parts:
*!* 1: Custom defines
*!* 2: Windows API defines
*!* 3: Defines from Windows SDK vsstyle.h uxtheme.h
*!* 4: A subset of defines from foxpro.h
********************************************************************************

********************************************************************************
*!* CTL CUSTOM
********************************************************************************
*!* 20061004 Replaced the CTL prefix with CON (Constant) to avoid conflict with
*!* Win API constants that start also with CTL_

#Define TRUE                                                         .T. 
#Define FALSE                                                        .F. 

#Define CR                                                           chr(0xd) 
#Define LF                                                           chr(0xa) 
#Define CRLF                                                         chr(0xd)+chr(0xa) 
#Define NULA                                                         chr(0x0) 
#Define NULW                                                         chr(0x0)+chr(0x0) 
#Define NULCHAR                                                      chr(0x0) 
#Define TABCHAR                                                      chr(0x9) 

*!* Pemstatus Values
#Define CTLPEMSTATUS_CHANGED                                          0 
#Define CTLPEMSTATUS_READONLY                                         1 
#Define CTLPEMSTATUS_PROTECTED                                        2 
#Define CTLPEMSTATUS_TYPE                                             3 
#Define CTLPEMSTATUS_USERDEFINED                                      4 
#Define CTLPEMSTATUS_DEFINED                                          5 
#Define CTLPEMSTATUS_INHERITED                                        6 

*!* TabOrientation Enum
#Define CTLTABORIENTATION_TOP                                         0 
#Define CTLTABORIENTATION_BOTTOM                                      1 
#Define CTLTABORIENTATION_LEFT                                        2 
#Define CTLTABORIENTATION_RIGHT                                       3 

*!* Orientation Enum
#Define CTLORIENTATION_HORIZONTAL                                    0
#Define CTLORIENTATION_VERTICAL                                      1

*!* TickStyle Enum
#Define CTLTICKSTYLE_NONE                                            0
#Define CTLTICKSTYLE_TOPLEFT                                         1
#Define CTLTICKSTYLE_BOTTOMRIGHT                                     2
#Define CTLTICKSTYLE_BOTH                                            3

*!* Missing MousePointer constants in foxpro.h
#Define MOUSE_HAND                                                   15 
#Define MOUSE_DN_ARROW                                               16 
#Define MOUSE_MGLASS                                                 17 

* This are used to clear certain style bits
#Define CON_BIT_WS_BORDER                                            23 
#Define CON_BIT_WS_EX_LAYOUTRTL                                      22 
#Define CON_BIT_WS_EX_STATICEDGE                                     17 
#Define CON_BIT_TTS_BALLOON                                          6 
#Define CON_BIT_TTS_CLOSE                                            7 
#Define CON_BIT_WS_VISIBLE                                           28 

*!* BorderStyle
#Define CON_BS_NONE                                                  0 
#Define CON_BS_FIXEDSINGLE                                           1 
#Define CON_BS_FIXEDDIALOG                                           2 
#Define CON_BS_SIZABLE                                               3 

#Define CON_BTPOS_NONE                                               1 
#Define CON_BTPOS_LEFTTOP                                            1 
#Define CON_BTPOS_ACTIVECTRL                                         2 
#Define CON_BTPOS_CARET                                              3 
#Define CON_BTPOS_SYS1270                                            4 
#Define CON_BTPOS_CTRLREF                                            5 
#Define CON_BTPOS_MOUSE                                              6 

#Define CON_BTSTYLE_BALLOON                                          1 
#Define CON_BTSTYLE_RECT                                             2 
#Define CON_BTSTYLE_NOBORDER                                         3 

#Define CON_EFFECT_RAISED                                            0 
#Define CON_EFFECT_SUNKEN                                            1 
#Define CON_EFFECT_FLAT                                              2 

#Define CON_FORMTYPE_DEFAULT                                         0 
#Define CON_FORMTYPE_TOPLEVEL                                        1 
#Define CON_FORMTYPE_SCREEN                                          2 

*!* ObjToClient parameters
#Define CON_OBJTOCLI_TOP                                             1 
#Define CON_OBJTOCLI_LEFT                                            2 
#Define CON_OBJTOCLI_WIDTH                                           3 
#Define CON_OBJTOCLI_HEIGHT                                          4 

*!* Alignment Values
#Define CON_ALIGN_MIDDLELEFT                                         0 
#Define CON_ALIGN_MIDDLERIGHT                                        1 
#Define CON_ALIGN_MIDDLECENTER                                       2 
#Define CON_ALIGN_AUTOMATIC                                          3 
#Define CON_ALIGN_TOPLEFT                                            4 
#Define CON_ALIGN_TOPRIGHT                                           5 
#Define CON_ALIGN_TOPCENTER                                          6 
#Define CON_ALIGN_BOTTOMLEFT                                         7 
#Define CON_ALIGN_BOTTOMRIGHT                                        8 
#Define CON_ALIGN_BOTTOMCENTER                                       9 

*!* Pemstatus Values
#Define CON_PEMSTAT_CHANGED                                          0 
#Define CON_PEMSTAT_READONLY                                         1 
#Define CON_PEMSTAT_PROTECTED                                        2 
#Define CON_PEMSTAT_TYPE                                             3 
#Define CON_PEMSTAT_USERDEFINED                                      4 
#Define CON_PEMSTAT_DEFINED                                          5 
#Define CON_PEMSTAT_INHERITED                                        6 

#Define CON_SBBORDER_HORIZONTAL                                      1 
#Define CON_SBBORDER_VERTICAL                                        2 
#Define CON_SBBORDER_SEPARATOR                                       3 

*!* ShowWindow
#Define CON_SHOWWIN_INSCREEN                                         0 
#Define CON_SHOWWIN_INTOPLEVELFORM                                   1 
#Define CON_SHOWWIN_ASTOPLEVELFORM                                   2 

#Define CON_STYLE_BALLOON                                            1 
#Define CON_STYLE_RECT                                               2 
#Define CON_STYLE_NOBORDER                                           3 

*!* TabOrientation parameters
#Define CON_TABOR_TOP                                                0 
#Define CON_TABOR_BOTTOM                                             1 
#Define CON_TABOR_LEFT                                               2 
#Define CON_TABOR_RIGHT                                              3 

*!* VFP VERSION()
#Define CON_VER_DATESERIAL                                           1 
#Define CON_VER_TYPE                                                 2 
#Define CON_VER_LANG                                                 3 
#Define CON_VER_CHAR                                                 4 
#Define CON_VER_NUM                                                  5 

#Define CON_VER_TYPE_RUNTIME                                         0 
#Define CON_VER_TYPE_STANDARD                                        1 
#Define CON_VER_TYPE_PRO                                             2 

#Define CON_VER_LANG_ENGLISH                                         "00" 
#Define CON_VER_LANG_RUSSSIAN                                        "07" 
#Define CON_VER_LANG_FRENCH                                          "33" 
#Define CON_VER_LANG_SPANISH                                         "34" 
#Define CON_VER_LANG_CZECH                                           "39" 
#Define CON_VER_LANG_GERMAN                                          "48" 
#Define CON_VER_LANG_KOREAN                                          "55" 
#Define CON_VER_LANG_SCHINESE                                        "86" 
#Define CON_VER_LANG_TCHINESE                                        "88" 

*!* WindowType constants
#Define CON_WINTYPE_MODELESS                                         0 
#Define CON_WINTYPE_MODAL                                            1 
#Define CON_WINTYPE_READ                                             2 
#Define CON_WINTYPE_READMODAL                                        3 

*!* These should be removed, not to be used, see NTDDI_x below
#Define OS_WIN95                                                     400 
#Define OS_WIN98                                                     410 
#Define OS_WINME                                                     500 
#Define OS_WINNT4                                                    400 
#Define OS_WIN2K                                                     500 
#Define OS_WINXP                                                     501 
#Define OS_WIN2K3                                                    502 
#Define OS_WINVISTA                                                  600 

#Define CON_OS_WIN95                                                 4000000 
#Define CON_OS_WIN98                                                 4100000 
#Define CON_OS_WIN2K                                                 5000000 
#Define CON_OS_WIN2KSP1                                              5000100 
#Define CON_OS_WIN2KSP2                                              5000200 
#Define CON_OS_WIN2KSP3                                              5000300 
#Define CON_OS_WIN2KSP4                                              5000400 
#Define CON_OS_WINXP                                                 5010000 
#Define CON_OS_WINXPSP1                                              5010100 
#Define CON_OS_WINXPSP2                                              5010200 
#Define CON_OS_WS03                                                  5020000 
#Define CON_OS_WS03SP1                                               5020100 
#Define CON_OS_WS03SP2                                               5020200 
#Define CON_OS_LONGHORN                                              6000000 
#Define CON_OS_WINVISTA                                              6000000 

#Define VFP_MAX_STRING_SIZE                                          16777184 

********************************************************************************
*!* WINDOWS API
********************************************************************************
#Define ANSI_CHARSET                                                 0 
#Define ARABIC_CHARSET                                               178 
#Define BALTIC_CHARSET                                               186 

#Define BIF_BROWSEFORCOMPUTER	0x1000
#Define BIF_BROWSEFORPRINTER	0x2000
#Define BIF_BROWSEINCLUDEFILES	0x4000
#Define BIF_BROWSEINCLUDEURLS	0x80
#Define BIF_DONTGOBELOWDOMAIN	0x2
#Define BIF_EDITBOX	0x10
#Define BIF_NEWDIALOGSTYLE	0x40
#Define BIF_NONEWFOLDERBUTTON  0x0200
#Define BIF_NOTRANSLATETARGETS 0x0400
#Define BIF_RETURNFSANCESTORS	0x8
#Define BIF_RETURNONLYFSDIRS	0x1
#Define BIF_SHAREABLE	0x8000
#Define BIF_STATUSTEXT	0x4
#Define BIF_USENEWUI	0x40
#Define BIF_VALIDATE	0x20
#Define BIF_UAHINT             0x0100

*!* message from browser
#Define BFFM_INITIALIZED        1
#Define BFFM_SELCHANGED         2
#Define BFFM_VALIDATEFAILEDA    3   && lParam:szPath ret:1(cont),0(EndDialog)
#Define BFFM_VALIDATEFAILEDW    4   && lParam:wzPath ret:1(cont),0(EndDialog)
#Define BFFM_IUNKNOWN           5   && provides IUnknown to client. lParam: IUnknown*

*!* messages to browser
#Define BFFM_SETSTATUSTEXTA     (0x400 + 100)
#Define BFFM_ENABLEOK           (0x400 + 101)
#Define BFFM_SETSELECTIONA      (0x400 + 102)
#Define BFFM_SETSELECTIONW      (0x400 + 103)
#Define BFFM_SETSTATUSTEXTW     (0x400 + 104)
#Define BFFM_SETOKTEXT          (0x400 + 105) && Unicode only
#Define BFFM_SETEXPANDED        (0x400 + 106) && Unicode only

#Define CAL_GREGORIAN                  1      && Gregorian (localized) calendar
#Define CAL_GREGORIAN_US               2      && Gregorian (U.S.) calendar
#Define CAL_JAPAN                      3      && Japanese Emperor Era calendar
#Define CAL_TAIWAN                     4      && Taiwan calendar
#Define CAL_KOREA                      5      && Korean Tangun Era calendar
#Define CAL_HIJRI                      6      && Hijri (Arabic Lunar) calendar
#Define CAL_THAI                       7      && Thai calendar
#Define CAL_HEBREW                     8      && Hebrew (Lunar) calendar
#Define CAL_GREGORIAN_ME_FRENCH        9      && Gregorian Middle East French calendar
#Define CAL_GREGORIAN_ARABIC           10     && Gregorian Arabic calendar
#Define CAL_GREGORIAN_XLIT_ENGLISH     11     && Gregorian Transliterated English calendar
#Define CAL_GREGORIAN_XLIT_FRENCH      12     && Gregorian Transliterated French calendar
#Define CAL_UMALQURA                   23     && UmAlQura Hijri (Arabic Lunar) calendar

#Define CCHDEVICENAME                                                32 
#Define CCM_FIRST                                                    0x2000 
#Define CCM_GETCOLORSCHEME                                           0x2003 
#Define CCM_GETDROPTARGET                                            0x2004 
#Define CCM_GETUNICODEFORMAT                                         0x2006 
#Define CCM_GETVERSION                                               0x2008 
#Define CCM_LAST                                                     0x2200 
#Define CCM_SETBKCOLOR                                               0x2001 
#Define CCM_SETCOLORSCHEME                                           0x2002 
#Define CCM_SETNOTIFYWINDOW                                          0x2009 
#Define CCM_SETUNICODEFORMAT                                         0x2005 
#Define CCM_SETVERSION                                               0x2007 
#Define CCM_SETWINDOWTHEME                                           0x200B 
#Define CCS_ADJUSTABLE                                               0x20 
#Define CCS_BOTTOM                                                   0x3 
#Define CCS_LEFT                                                     0x81 
#Define CCS_NODIVIDER                                                0x40 
#Define CCS_NOMOVEX                                                  0x82 
#Define CCS_NOMOVEY                                                  0x2 
#Define CCS_NOPARENTALIGN                                            0x8 
#Define CCS_NORESIZE                                                 0x4 
#Define CCS_RIGHT                                                    0x83 
#Define CCS_TOP                                                      0x1 
#Define CCS_VERT                                                     0x80 

#Define CDDS_ITEM                                                    0x10000
#Define CDDS_ITEMPOSTERASE                                           0x10004 &&(CDDS_ITEM Or CDDS_POSTERASE)
#Define CDDS_ITEMPOSTPAINT                                           0x10002 &&(CDDS_ITEM Or CDDS_POSTPAINT)
#Define CDDS_ITEMPREERASE                                            0x10003 &&(CDDS_ITEM Or CDDS_PREERASE)
#Define CDDS_ITEMPREPAINT                                            0x10001 &&(CDDS_ITEM Or CDDS_PREPAINT)
#Define CDDS_MAPPART                                                 0x5
#Define CDDS_POSTERASE                                               0x4
#Define CDDS_POSTPAINT                                               0x2
#Define CDDS_PREERASE                                                0x3
#Define CDDS_PREPAINT                                                0x1
#Define CDDS_SUBITEM                                                 0x20000

#Define CDERR_DIALOGFAILURE	0xFFFF
#Define CDERR_FINDRESFAILURE	0x6
#Define CDERR_INITIALIZATION	0x2
#Define CDERR_LOADRESFAILURE	0x7
#Define CDERR_LOADSTRFAILURE	0x5
#Define CDERR_LOCKRESFAILURE	0x8
#Define CDERR_MEMALLOCFAILURE	0x9
#Define CDERR_MEMLOCKFAILURE	0xA
#Define CDERR_NOHINSTANCE	0x4
#Define CDERR_NOHOOK	0xB
#Define CDERR_NOTEMPLATE	0x3
#Define CDERR_REGISTERMSGFAIL	0xC
#Define CDERR_STRUCTSIZE	0x1

#Define CDIS_CHECKED                                                 0x8
#Define CDIS_DEFAULT                                                 0x20
#Define CDIS_DISABLED                                                0x4
#Define CDIS_FOCUS                                                   0x10
#Define CDIS_GRAYED                                                  0x2
#Define CDIS_HOT                                                     0x40
#Define CDIS_INDETERMINATE                                           0x100
#Define CDIS_MARKED                                                  0x80
#Define CDIS_SELECTED                                                0x1
#Define CDIS_SHOWKEYBOARDCUES                                        0x200

#Define CDIS_NEARHOT                                                 0x0400
#Define CDIS_OTHERSIDEHOT                                            0x0800
#Define CDIS_DROPHILITED                                             0x1000

#Define CDM_FIRST                                                    (0x400+100)
#Define CDM_GETFILEPATH                                              (0x400+100+0x1)
#Define CDM_GETFOLDERIDLIST                                          (0x400+100+0x3)
#Define CDM_GETFOLDERPATH                                            (0x400+100+0x2)
#Define CDM_GETSPEC                                                  (0x400+100+0x0)
#Define CDM_HIDECONTROL                                              (0x400+100+0x5)
#Define CDM_LAST                                                     (0x400+200)
#Define CDM_SETCONTROLTEXT                                           (0x400+100+0x4)
#Define CDM_SETDEFEXT                                                (0x400+100+0x6)

#Define CDN_FIRST                                                    (-601)
#Define CDN_FILEOK                                                   (-601-0x5)
#Define CDN_FOLDERCHANGE                                             (-601-0x2)
#Define CDN_HELP                                                     (-601-0x4)
#Define CDN_INCLUDEITEM                                              (-601-0x7)
#Define CDN_INITDONE                                                 (-601-0x0)
#Define CDN_LAST                                                     (-699)
#Define CDN_SELCHANGE                                                (-601-0x1)
#Define CDN_SHAREVIOLATION                                           (-601-0x3)
#Define CDN_TYPECHANGE                                               (-601-0x6)

#Define CDRF_DODEFAULT                                               0x0
#Define CDRF_NEWFONT                                                 0x2
#Define CDRF_SKIPDEFAULT                                             0x4
#Define CDRF_DOERASE                                                 0x8 && draw the background
#Define CDRF_SKIPPOSTPAINT                                           0x100 && don't draw the focus rect
#Define CDRF_NOTIFYPOSTPAINT                                         0x10
#Define CDRF_NOTIFYITEMDRAW                                          0x20
#Define CDRF_NOTIFYSUBITEMDRAW                                       0x20  && flags are the same, we can distinguish by context
#Define CDRF_NOTIFYPOSTERASE                                         0x40

#Define CHINESEBIG5_CHARSET                                          136 
#Define CLIP_STROKE_PRECIS                                           2 
#Define CLR_DEFAULT                                                  0xff000000 
#Define CLR_HILIGHT                                                  0xff000000 
#Define CLR_INVALID                                                  0xffff 
#Define CLR_NONE                                                     0xffffffff 
#Define COLOR_3DDKSHADOW                                             21 
#Define COLOR_3DFACE                                                 15 
#Define COLOR_3DHIGHLIGHT                                            20 
#Define COLOR_3DHILIGHT                                              20 
#Define COLOR_3DLIGHT                                                22 
#Define COLOR_3DSHADOW                                               16 
#Define COLOR_ACTIVEBORDER                                           10 
#Define COLOR_ACTIVECAPTION                                          2 
#Define COLOR_ADD                                                    712 
#Define COLOR_ADJ_MAX                                                100 
#Define COLOR_ADJ_MIN                                                -100 
#Define COLOR_APPWORKSPACE                                           12 
#Define COLOR_BACKGROUND                                             1 
#Define COLOR_BLUE                                                   708 
#Define COLOR_BLUEACCEL                                              728 
#Define COLOR_BOX1                                                   720 
#Define COLOR_BTNFACE                                                15 
#Define COLOR_BTNHIGHLIGHT                                           20 
#Define COLOR_BTNHILIGHT                                             20 
#Define COLOR_BTNSHADOW                                              16 
#Define COLOR_BTNTEXT                                                18 
#Define COLOR_CAPTIONTEXT                                            9 
#Define COLOR_CURRENT                                                709 
#Define COLOR_CUSTOM1                                                721 
#Define COLOR_DESKTOP                                                1 
#Define COLOR_ELEMENT                                                716 
#Define COLOR_GRADIENTACTIVECAPTION                                  27 
#Define COLOR_GRADIENTINACTIVECAPTION                                28 
#Define COLOR_GRAYTEXT                                               17 
#Define COLOR_GREEN                                                  707 
#Define COLOR_GREENACCEL                                             727 
#Define COLOR_HIGHLIGHT                                              13 
#Define COLOR_HIGHLIGHTTEXT                                          14 
#Define COLOR_HOTLIGHT                                               26 
#Define COLOR_HUE                                                    703 
#Define COLOR_HUEACCEL                                               723 
#Define COLOR_HUESCROLL                                              700 
#Define COLOR_INACTIVEBORDER                                         11 
#Define COLOR_INACTIVECAPTION                                        3 
#Define COLOR_INACTIVECAPTIONTEXT                                    19 
#Define COLOR_INFOBK                                                 24 
#Define COLOR_INFOTEXT                                               23 
#Define COLOR_LUM                                                    705 
#Define COLOR_LUMACCEL                                               725 
#Define COLOR_LUMSCROLL                                              702 
#Define COLOR_MATCH_VERSION                                          0x200 
#Define COLOR_MENU                                                   4 
#Define COLOR_MENUBAR                                                30 && The color used to highlight menu items when the menu appears as a flat menu
#Define COLOR_MENUHILIGHT                                            29 && The background color for the menu bar when menus appear as flat menus
#Define COLOR_MENUTEXT                                               7 
#Define COLOR_MIX                                                    719 
#Define COLOR_NO_TRANSPARENT                                         0xffffffff 
#Define COLOR_PALETTE                                                718 
#Define COLOR_RAINBOW                                                710 
#Define COLOR_RED                                                    706 
#Define COLOR_REDACCEL                                               726 
#Define COLOR_SAMPLES                                                717 
#Define COLOR_SAT                                                    704 
#Define COLOR_SATACCEL                                               724 
#Define COLOR_SATSCROLL                                              701 
#Define COLOR_SAVE                                                   711 
#Define COLOR_SCHEMES                                                715 
#Define COLOR_SCROLLBAR                                              0 
#Define COLOR_SOLID                                                  713 
#Define COLOR_SOLID_LEFT                                             730 
#Define COLOR_SOLID_RIGHT                                            731 
#Define COLOR_TUNE                                                   714 
#Define COLOR_WINDOW                                                 5 
#Define COLOR_WINDOWFRAME                                            6 
#Define COLOR_WINDOWTEXT                                             8 
#Define CREATE_ALWAYS                                                2 
#Define CREATE_NEW                                                   1 

#Define CS_VREDRAW                                                   0x0001
#Define CS_HREDRAW                                                   0x0002
#Define CS_DBLCLKS                                                   0x0008
#Define CS_OWNDC                                                     0x0020
#Define CS_CLASSDC                                                   0x0040
#Define CS_PARENTDC                                                  0x0080
#Define CS_NOCLOSE                                                   0x0200
#Define CS_SAVEBITS                                                  0x0800
#Define CS_BYTEALIGNCLIENT                                           0x1000
#Define CS_BYTEALIGNWINDOW                                           0x2000
#Define CS_GLOBALCLASS                                               0x4000
#Define CS_IME                                                       0x00010000
#Define CS_DROPSHADOW                                                0x00020000

#Define CSIDL_ADMINTOOLS                                             0x0030
#Define CSIDL_ALTSTARTUP                                             0x001D
#Define CSIDL_APPDATA                                                0x001A
#Define CSIDL_BITBUCKET                                              0x000A
#Define CSIDL_CDBURN_AREA                                            0x003B
#Define CSIDL_COMMON_ADMINTOOLS                                      0x002F
#Define CSIDL_COMMON_ALTSTARTUP                                      0x001E
#Define CSIDL_COMMON_APPDATA                                         0x0023
#Define CSIDL_COMMON_DESKTOPDIRECTORY                                0x0019
#Define CSIDL_COMMON_DOCUMENTS                                       0x002E
#Define CSIDL_COMMON_FAVORITES                                       0x001F
#Define CSIDL_COMMON_MUSIC                                           0x0035
#Define CSIDL_COMMON_OEM_LINKS                                       0x003A
#Define CSIDL_COMMON_PICTURES                                        0x0036
#Define CSIDL_COMMON_PROGRAMS                                        0x0017
#Define CSIDL_COMMON_STARTMENU                                       0x0016
#Define CSIDL_COMMON_STARTUP                                         0x0018
#Define CSIDL_COMMON_TEMPLATES                                       0x002D
#Define CSIDL_COMMON_VIDEO                                           0x0037
#Define CSIDL_COMPUTERSNEARME                                        0x003D
#Define CSIDL_CONNECTIONS                                            0x0031
#Define CSIDL_CONTROLS                                               0x0003
#Define CSIDL_COOKIES                                                0x0021
#Define CSIDL_DESKTOP                                                0x0000
#Define CSIDL_DESKTOPDIRECTORY                                       0x0010
#Define CSIDL_DRIVES                                                 0x0011
#Define CSIDL_FAVORITES                                              0x0006
#Define CSIDL_FONTS                                                  0x0014
#Define CSIDL_HISTORY                                                0x0022
#Define CSIDL_INTERNET                                               0x0001
#Define CSIDL_INTERNET_CACHE                                         0x0020
#Define CSIDL_LOCAL_APPDATA                                          0x001C
#Define CSIDL_MYDOCUMENTS                                            0x0005
#Define CSIDL_MYMUSIC                                                0x000D
#Define CSIDL_MYPICTURES                                             0x0027
#Define CSIDL_MYVIDEO                                                0x000E
#Define CSIDL_NETHOOD                                                0x0013
#Define CSIDL_NETWORK                                                0x0012
#Define CSIDL_PERSONAL                                               0x0005
#Define CSIDL_PRINTERS                                               0x0004
#Define CSIDL_PRINTHOOD                                              0x001B
#Define CSIDL_PROFILE                                                0x0028
#Define CSIDL_PROGRAM_FILES                                          0x0026
#Define CSIDL_PROGRAM_FILES_COMMON                                   0x002B
#Define CSIDL_PROGRAM_FILES_COMMONX86                                0x002C
#Define CSIDL_PROGRAM_FILESX86                                       0x002A
#Define CSIDL_PROGRAMS                                               0x0002
#Define CSIDL_RECENT                                                 0x0008
#Define CSIDL_RESOURCES                                              0x0038
#Define CSIDL_RESOURCES_LOCALIZED                                    0x0039
#Define CSIDL_SENDTO                                                 0x0009
#Define CSIDL_STARTMENU                                              0x000B
#Define CSIDL_STARTUP                                                0x0007
#Define CSIDL_SYSTEM                                                 0x0025
#Define CSIDL_SYSTEMX86                                              0x0029
#Define CSIDL_TEMPLATES                                              0x0015
#Define CSIDL_WINDOWS                                                0x0024

#Define CSIDL_FLAG_CREATE               0x8000        && combine with CSIDL_ value to force folder creation in SHGetFolderPath()
#Define CSIDL_FLAG_DONT_UNEXPAND        0x2000        && combine with CSIDL_ value to avoid unexpanding environment variables
#Define CSIDL_FLAG_DONT_VERIFY          0x4000        && combine with CSIDL_ value to return an unverified folder path
#Define CSIDL_FLAG_NO_ALIAS             0x1000        && combine with CSIDL_ value to insure non-alias versions of the pidl
#Define CSIDL_FLAG_PER_USER_INIT        0x0800        && combine with CSIDL_ value to indicate per-user init (eg. upgrade)
#Define CSIDL_FLAG_MASK                 0xFF00        && mask for all possible flag values

#Define CW_USEDEFAULT                                                0x80000000 
#Define DATE_LONGDATE                                                0x2 
#Define DATE_LTRREADING                                              0x10 
#Define DATE_RTLREADING                                              0x20 
#Define DATE_SHORTDATE                                               0x1 
#Define DATE_USE_ALT_CALENDAR                                        0x4 
#Define DATE_YEARMONTH                                               0x8 

#Define DATETIMEPICK_CLASSA                                          "SysDateTimePick32"
#Define DATETIMEPICK_CLASSW                                          "SysDateTimePick32"

#Define DEFAULT_CHARSET                                              1 
#Define DEFAULT_GUI_FONT                                             17 
#Define DEFAULT_PITCH                                                0 
#Define DI_COMPAT                                                    0x0004 
#Define DI_DEFAULTSIZE                                               0x0008 
#Define DI_IMAGE                                                     0x0002 
#Define DI_MASK                                                      0x0001 
#Define DI_NOMIRROR                                                  0x0010 
#Define DI_NORMAL                                                    0x0003 
#Define DIFFERENCE                                                   11 
#Define DTBG_CLIPRECT                                                0x00000001 && rcClip has been specified
#Define DTBG_COMPUTINGREGION                                         0x00000010 && TRUE if calling to compute region
#Define DTBG_DRAWSOLID                                               0x00000002 && DEPRECATED: draw transparent/alpha images as solid
#Define DTBG_MIRRORDC                                                0x00000020 && assume the hdc is mirrorred and flip images as appropriate (currently only supported for bgtype=imagefile)
#Define DTBG_NOMIRROR                                                0x00000040 && don't mirror the output, overrides everything else
#Define DTBG_OMITBORDER                                              0x00000004 && don't draw border of part
#Define DTBG_OMITCONTENT                                             0x00000008 && don't draw content area of part
#Define DTBG_VALIDBITS                                               Bitor(0x00000001,0x00000002,0x00000004,0x00000008,0x00000010,0x00000020,0x00000040) 
#Define EASTEUROPE_CHARSET                                           238 
#Define EBWBS_DISABLED                                               3 
#Define EBWBS_FOCUSED                                                4 
#Define EBWBS_HOT                                                    2 
#Define EBWBS_NORMAL                                                 1 

#Define EM_AUTOURLDETECT                                             (0x400 + 91)
#Define EM_CANPASTE                                                  (0x400 + 50)
#Define EM_CANREDO                                                   (0x400 + 85)
#Define EM_CANUNDO                                                   0xC6
#Define EM_CHARFROMPOS                                               0xD7
#Define EM_CONVPOSITION                                              (0x400 + 108)
#Define EM_DISPLAYBAND                                               (0x400 + 51)
#Define EM_EMPTYUNDOBUFFER                                           0xCD
#Define EM_EXGETSEL                                                  (0x400 + 52)
#Define EM_EXLIMITTEXT                                               (0x400 + 53)
#Define EM_EXLINEFROMCHAR                                            (0x400 + 54)
#Define EM_EXSETSEL                                                  (0x400 + 55)
#Define EM_FINDTEXT                                                  (0x400 + 56)
#Define EM_FINDTEXTEX                                                (0x400 + 79)
#Define EM_FINDTEXTEXW                                               (0x400 + 124)
#Define EM_FINDTEXTW                                                 (0x400 + 123)
#Define EM_FINDWORDBREAK                                             (0x400 + 76)
#Define EM_FMTLINES                                                  0xC8
#Define EM_FORMATRANGE                                               (0x400 + 57)
#Define EM_GETAUTOURLDETECT                                          (0x400 + 92)
#Define EM_GETBIDIOPTIONS                                            (0x400 + 201)
#Define EM_GETCHARFORMAT                                             (0x400 + 58)
#Define EM_GETEDITSTYLE                                              (0x400 + 205)
#Define EM_GETEVENTMASK                                              (0x400 + 59)
#Define EM_GETFIRSTVISIBLELINE                                       0xCE
#Define EM_GETHANDLE                                                 0xBD
#Define EM_GETIMECOLOR                                               (0x400 + 105)
#Define EM_GETIMECOMPMODE                                            (0x400 + 122)
#Define EM_GETIMEMODEBIAS                                            (0x400 + 127)
#Define EM_GETIMEOPTIONS                                             (0x400 + 107)
#Define EM_GETIMESTATUS                                              0xD9
#Define EM_GETLANGOPTIONS                                            (0x400 + 121)
#Define EM_GETLIMITTEXT                                              (0x400 + 37)
#Define EM_GETLINE                                                   0xC4
#Define EM_GETLINECOUNT                                              0xBA
#Define EM_GETMARGINS                                                0xD4
#Define EM_GETMODIFY                                                 0xB8
#Define EM_GETOLEINTERFACE                                           (0x400 + 60)
#Define EM_GETOPTIONS                                                (0x400 + 78)
#Define EM_GETPARAFORMAT                                             (0x400 + 61)
#Define EM_GETPASSWORDCHAR                                           0xD2
#Define EM_GETPUNCTUATION                                            (0x400 + 101)
#Define EM_GETRECT                                                   0xB2
#Define EM_GETREDONAME                                               (0x400 + 87)
#Define EM_GETSCROLLPOS                                              (0x400 + 221)
#Define EM_GETSEL                                                    0xB0
#Define EM_GETSELTEXT                                                (0x400 + 62)
#Define EM_GETTEXTEX                                                 (0x400 + 94)
#Define EM_GETTEXTLENGTHEX                                           (0x400 + 95)
#Define EM_GETTEXTMODE                                               (0x400 + 90)
#Define EM_GETTEXTRANGE                                              (0x400 + 75)
#Define EM_GETTHUMB                                                  0xBE
#Define EM_GETTYPOGRAPHYOPTIONS                                      (0x400 + 203)
#Define EM_GETUNDONAME                                               (0x400 + 86)
#Define EM_GETWORDBREAKPROC                                          0xD1
#Define EM_GETWORDBREAKPROCEX                                        (0x400 + 80)
#Define EM_GETWORDWRAPMODE                                           (0x400 + 103)
#Define EM_GETZOOM                                                   (0x400 + 224)
#Define EM_HIDESELECTION                                             (0x400 + 63)
#Define EM_LIMITTEXT                                                 0xC5
#Define EM_LINEFROMCHAR                                              0xC9
#Define EM_LINEINDEX                                                 0xBB
#Define EM_LINELENGTH                                                0xC1
#Define EM_LINESCROLL                                                0xB6
#Define EM_OUTLINE                                               (0x400 + 220)
#Define EM_PASTESPECIAL                                               (0x400 + 64)
#Define EM_POSFROMCHAR                                               (0x400 + 38)
#Define EM_RECONVERSION                                               (0x400 + 125)
#Define EM_REDO                                               (0x400 + 84)
#Define EM_REPLACESEL                                               0xC2
#Define EM_REQUESTRESIZE                                               (0x400 + 65)
#Define EM_SCROLLCARET                                               0xB7
#Define EM_SCROLL                                               0xB5
#Define EM_SELECTIONTYPE                                               (0x400 + 66)
#Define EM_SETBIDIOPTIONS                                               (0x400 + 200)
#Define EM_SETBKGNDCOLOR                                               (0x400 + 67)
#Define EM_SETCHARFORMAT                                               (0x400 + 68)
#Define EM_SETCUEBANNER                                               (0x1500 + 1)
#Define EM_SETEDITSTYLE                                               (0x400 + 204)
#Define EM_SETEVENTMASK                                               (0x400 + 69)
#Define EM_SETFONTSIZE                                               (0x400 + 223)
#Define EM_SETHANDLE                                               0xBC
#Define EM_SETIMECOLOR                                               (0x400 + 104)
#Define EM_SETIMEMODEBIAS                                               (0x400 + 126)
#Define EM_SETIMEOPTIONS                                               (0x400 + 106)
#Define EM_SETIMESTATUS                                               0xD8
#Define EM_SETLANGOPTIONS                                               (0x400 + 120)
#Define EM_SETLIMITTEXT                                               0xC5
#Define EM_SETMARGINS                                               0xD3
#Define EM_SETMODIFY                                               0xB9
#Define EM_SETOLECALLBACK                                               (0x400 + 70)
#Define EM_SETOPTIONS                                               (0x400 + 77)
#Define EM_SETPALETTE                                               (0x400 + 93)
#Define EM_SETPARAFORMAT                                               (0x400 + 71)
#Define EM_SETPASSWORDCHAR                                               0xCC
#Define EM_SETPUNCTUATION                                               (0x400 + 100)
#Define EM_SETREADONLY                                               0xCF
#Define EM_SETRECT                                               0xB3
#Define EM_SETRECTNP                                               0xB4
#Define EM_SETSCROLLPOS                                               (0x400 + 222)
#Define EM_SETSEL0xB1
#Define EM_SETTABSTOPS                                               0xCB
#Define EM_SETTARGETDEVICE                                               (0x400 + 72)
#Define EM_SETTEXTEX                                               (0x400 + 97)
#Define EM_SETTEXTMODE                                               (0x400 + 89)
#Define EM_SETTYPOGRAPHYOPTIONS                                               (0x400 + 202)
#Define EM_SETUNDOLIMIT                                               (0x400 + 82)
#Define EM_SETWORDBREAKPROC                                               0xD0
#Define EM_SETWORDBREAKPROCEX                                               (0x400 + 81)
#Define EM_SETWORDWRAPMODE                                               (0x400 + 102)
#Define EM_SETZOOM                                               (0x400 + 225)
#Define EM_SHOWSCROLLBAR                                               (0x400 + 96)
#Define EM_STOPGROUPTYPING                                               (0x400 + 88)
#Define EM_STREAMIN                                               (0x400 + 73)
#Define EM_STREAMOUT                                               (0x400 + 74)
#Define EM_UNDO                                               0xC7


#Define EP_BACKGROUND                                                3 
#Define EP_BACKGROUNDWITHBORDER                                      5 
#Define EP_CARET                                                     2 
#Define EP_EDITBORDER_HSCROLL                                        7 
#Define EP_EDITBORDER_HVSCROLL                                       9 
#Define EP_EDITBORDER_NOSCROLL                                       6 
#Define EP_EDITBORDER_VSCROLL                                        8 
#Define EP_EDITTEXT                                                  1 
#Define EP_PASSWORD                                                  4 
#Define ERROR_ACCESS_DENIED                                          5 
#Define ERROR_CIRCULAR_DEPENDENCY                                    1059 
#Define ERROR_DATABASE_DOES_NOT_EXIST                                1065 
#Define ERROR_DUPLICATE_SERVICE_NAME                                 1078 

#Define ERROR_FILE_NOT_FOUND                                         2

#Define ERROR_INSUFFICIENT_BUFFER                                    122 
#Define ERROR_INTERNET_ASYNC_THREAD_FAILED                           12047 
#Define ERROR_INTERNET_BAD_AUTO_PROXY_SCRIPT                         12166 
#Define ERROR_INTERNET_BAD_OPTION_LENGTH                             12010 
#Define ERROR_INTERNET_BAD_REGISTRY_PARAMETER                        12022 
#Define ERROR_INTERNET_CANNOT_CONNECT                                12029 
#Define ERROR_INTERNET_CHG_POST_IS_NON_SECURE                        12042 
#Define ERROR_INTERNET_CLIENT_AUTH_CERT_NEEDED                       12044 
#Define ERROR_INTERNET_CLIENT_AUTH_NOT_SETUP                         12046 
#Define ERROR_INTERNET_CONNECTION_ABORTED                            12030 
#Define ERROR_INTERNET_CONNECTION_RESET                              12031 
#Define ERROR_INTERNET_DIALOG_PENDING                                12049 
#Define ERROR_INTERNET_DISCONNECTED                                  12163 
#Define ERROR_INTERNET_EXTENDED_ERROR                                12003 
#Define ERROR_INTERNET_FAILED_DUETOSECURITYCHECK                     12171 
#Define ERROR_INTERNET_FORCE_RETRY                                   12032 
#Define ERROR_INTERNET_FORTEZZA_LOGIN_NEEDED                         12054 
#Define ERROR_INTERNET_HANDLE_EXISTS                                 12036 
#Define ERROR_INTERNET_HTTP_TO_HTTPS_ON_REDIR                        12039 
#Define ERROR_INTERNET_HTTPS_HTTP_SUBMIT_REDIR                       12052 
#Define ERROR_INTERNET_HTTPS_TO_HTTP_ON_REDIR                        12040 
#Define ERROR_INTERNET_INCORRECT_FORMAT                              12027 
#Define ERROR_INTERNET_INCORRECT_HANDLE_STATE                        12019 
#Define ERROR_INTERNET_INCORRECT_HANDLE_TYPE                         12018 
#Define ERROR_INTERNET_INCORRECT_PASSWORD                            12014 
#Define ERROR_INTERNET_INCORRECT_USER_NAME                           12013 
#Define ERROR_INTERNET_INSERT_CDROM                                  12053 
#Define ERROR_INTERNET_INTERNAL_ERROR                                12004 
#Define ERROR_INTERNET_INVALID_CA                                    12045 
#Define ERROR_INTERNET_INVALID_OPERATION                             12016 
#Define ERROR_INTERNET_INVALID_OPTION                                12009 
#Define ERROR_INTERNET_INVALID_PROXY_REQUEST                         12033 
#Define ERROR_INTERNET_INVALID_URL                                   12005 
#Define ERROR_INTERNET_ITEM_NOT_FOUND                                12028 
#Define ERROR_INTERNET_LOGIN_FAILURE                                 12015 
#Define ERROR_INTERNET_LOGIN_FAILURE_DISPLAY_ENTITY_BODY             12174 
#Define ERROR_INTERNET_MIXED_SECURITY                                12041 
#Define ERROR_INTERNET_NAME_NOT_RESOLVED                             12007 
#Define ERROR_INTERNET_NEED_MSN_SSPI_PKG                             12173 
#Define ERROR_INTERNET_NEED_UI                                       12034 
#Define ERROR_INTERNET_NO_CALLBACK                                   12025 
#Define ERROR_INTERNET_NO_CONTEXT                                    12024 
#Define ERROR_INTERNET_NO_DIRECT_ACCESS                              12023 
#Define ERROR_INTERNET_NOT_INITIALIZED                               12172 
#Define ERROR_INTERNET_NOT_PROXY_REQUEST                             12020 
#Define ERROR_INTERNET_OPERATION_CANCELLED                           12017 
#Define ERROR_INTERNET_OPTION_NOT_SETTABLE                           12011 
#Define ERROR_INTERNET_OUT_OF_HANDLES                                12001 
#Define ERROR_INTERNET_POST_IS_NON_SECURE                            12043 
#Define ERROR_INTERNET_PROTOCOL_NOT_FOUND                            12008 
#Define ERROR_INTERNET_PROXY_SERVER_UNREACHABLE                      12165 
#Define ERROR_INTERNET_REDIRECT_SCHEME_CHANGE                        12048 
#Define ERROR_INTERNET_REGISTRY_VALUE_NOT_FOUND                      12021 
#Define ERROR_INTERNET_REQUEST_PENDING                               12026 
#Define ERROR_INTERNET_RETRY_DIALOG                                  12050 
#Define ERROR_INTERNET_SEC_CERT_CN_INVALID                           12038 
#Define ERROR_INTERNET_SEC_CERT_DATE_INVALID                         12037 
#Define ERROR_INTERNET_SEC_CERT_ERRORS                               12055 
#Define ERROR_INTERNET_SEC_CERT_NO_REV                               12056 
#Define ERROR_INTERNET_SEC_CERT_REV_FAILED                           12057 
#Define ERROR_INTERNET_SEC_CERT_REVOKED                              12170 
#Define ERROR_INTERNET_SEC_INVALID_CERT                              12169 
#Define ERROR_INTERNET_SECURITY_CHANNEL_ERROR                        12157 
#Define ERROR_INTERNET_SERVER_UNREACHABLE                            12164 
#Define ERROR_INTERNET_SHUTDOWN                                      12012 
#Define ERROR_INTERNET_TCPIP_NOT_INSTALLED                           12159 
#Define ERROR_INTERNET_TIMEOUT                                       12002 
#Define ERROR_INTERNET_UNABLE_TO_CACHE_FILE                          12158 
#Define ERROR_INTERNET_UNABLE_TO_DOWNLOAD_SCRIPT                     12167 
#Define ERROR_INTERNET_UNRECOGNIZED_SCHEME                           12006 
#Define ERROR_INVALID_FUNCTION                                       1 
#Define ERROR_INVALID_HANDLE                                         6 
#Define ERROR_INVALID_NAME                                           123 
#Define ERROR_INVALID_PARAMETER                                      87 
#Define ERROR_INVALID_SERVICE_ACCOUNT                                1057 
#Define ERROR_MORE_DATA                                              234
#Define ERROR_NO_MORE_FILES                                          18 
#Define ERROR_NOT_SUPPORTED                                          0x50 
#Define ERROR_SERVICE_ALREADY_RUNNING                                1056 
#Define ERROR_SERVICE_CANNOT_ACCEPT_CTRL                             1061 
#Define ERROR_SERVICE_DATABASE_LOCKED                                1055 
#Define ERROR_SERVICE_DEPENDENCY_DELETED                             1075 
#Define ERROR_SERVICE_DEPENDENCY_FAIL                                1068 
#Define ERROR_SERVICE_DISABLED                                       1058 
#Define ERROR_SERVICE_DOES_NOT_EXIST                                 1060 
#Define ERROR_SERVICE_EXISTS                                         1073 
#Define ERROR_SERVICE_EXISTS                                         1073 
#Define ERROR_SERVICE_IS_PAUSED                                      928 
#Define ERROR_SERVICE_LOGON_FAILED                                   1069 
#Define ERROR_SERVICE_MARKED_FOR_DELETE                              1072 
#Define ERROR_SERVICE_NEVER_STARTED                                  1077 
#Define ERROR_SERVICE_NO_THREAD                                      1054 
#Define ERROR_SERVICE_NOT_ACTIVE                                     1062 
#Define ERROR_SERVICE_NOT_FOUND                                      1243 
#Define ERROR_SERVICE_NOT_IN_EXE                                     1083 
#Define ERROR_SERVICE_REQUEST_TIMEOUT                                1053 
#Define ERROR_SERVICE_SPECIFIC_ERROR                                 1066 
#Define ERROR_SERVICE_START_HANG                                     1070 
#Define ERROR_SUCCESS                                                0 
#Define FILE_ADD_FILE                                                0x2 
#Define FILE_ADD_SUBDIRECTORY                                        0x4 
#Define FILE_ALL_ACCESS                                              0x1F01FF 
#Define FILE_APPEND_DATA                                             0x4 
#Define FILE_ATTRIBUTE_ARCHIVE                                       32 
#Define FILE_ATTRIBUTE_COMPRESSED                                    2048 
#Define FILE_ATTRIBUTE_DEVICE                                        64 
#Define FILE_ATTRIBUTE_DIRECTORY                                     16 
#Define FILE_ATTRIBUTE_ENCRYPTED                                     16384 
#Define FILE_ATTRIBUTE_HIDDEN                                        2 
#Define FILE_ATTRIBUTE_NORMAL                                        128 
#Define FILE_ATTRIBUTE_NOT_CONTENT_INDEXED                           8192 
#Define FILE_ATTRIBUTE_OFFLINE                                       4096 
#Define FILE_ATTRIBUTE_READONLY                                      1 
#Define FILE_ATTRIBUTE_REPARSE_POINT                                 1024 
#Define FILE_ATTRIBUTE_SPARSE_FILE                                   512 
#Define FILE_ATTRIBUTE_SYSTEM                                        4 
#Define FILE_ATTRIBUTE_TEMPORARY                                     256 
#Define FILE_ATTRIBUTE_VIRTUAL                                       131072 
#Define FILE_BEGIN                                                   0 
#Define FILE_CREATE_PIPE_INSTANCE                                    0x4 
#Define FILE_CURRENT                                                 1 
#Define FILE_DELETE_CHILD                                            0x40 
#Define FILE_END                                                     2 
#Define FILE_EXECUTE                                                 0x20 
#Define FILE_FLAG_BACKUP_SEMANTICS                                   0x2000000 
#Define FILE_FLAG_DELETE_ON_CLOSE                                    0x4000000 
#Define FILE_FLAG_NO_BUFFERING                                       0x20000000 
#Define FILE_FLAG_OPEN_NO_RECALL                                     0x100000 
#Define FILE_FLAG_OPEN_REPARSE_POINT                                 0x200000 
#Define FILE_FLAG_OVERLAPPED                                         0x40000000 
#Define FILE_FLAG_POSIX_SEMANTICS                                    0x1000000 
#Define FILE_FLAG_RANDOM_ACCESS                                      0x10000000 
#Define FILE_FLAG_SEQUENTIAL_SCAN                                    0x8000000 
#Define FILE_FLAG_WRITE_THROUGH                                      0x80000000 
#Define FILE_LIST_DIRECTORY                                          0x1 
#Define FILE_READ_ATTRIBUTES                                         0x80 
#Define FILE_READ_DATA                                               0x1 
#Define FILE_READ_EA                                                 0x8 
#Define FILE_SHARE_DELETE                                            0x4 
#Define FILE_SHARE_READ                                              0x1 
#Define FILE_SHARE_WRITE                                             0x2 
#Define FILE_TRAVERSE                                                0x20 
#Define FILE_WRITE_ATTRIBUTES                                        0x100 
#Define FILE_WRITE_DATA                                              0x2 
#Define FILE_WRITE_EA                                                0x10 
#Define FLAGS_ERROR_UI_FILTER_FOR_ERRORS                             0x1 
#Define FLAGS_ERROR_UI_FLAGS_CHANGE_OPTIONS                          0x2 
#Define FLAGS_ERROR_UI_FLAGS_GENERATE_DATA                           0x4 
#Define FLAGS_ERROR_UI_FLAGS_NO_UI                                   0x8 
#Define FLAGS_ERROR_UI_SERIALIZE_DIALOGS                             0x10 

#Define FNERR_BUFFERTOOSMALL	0x3003
#Define FNERR_INVALIDFILENAME	0x3002
#Define FNERR_SUBCLASSFAILURE	0x3001

#Define FOLDERID_AddNewPrograms            0h71d961debc5e024fa3a96c82895e5c04
#Define FOLDERID_AdminTools                0h70f14e722da4ef4f9f26b60e846fba4f && CSIDL_ADMINTOOLS
#Define FOLDERID_AppUpdates                0h99ce05a327f52b498b1a7e76fa98d6e4
#Define FOLDERID_CDBurning                 0h10ab529e0df8df49acb84330f5687855 && CSIDL_CDBURN_AREA
#Define FOLDERID_ChangeRemovePrograms      0hac6672df749267488d553bd661de872d
#Define FOLDERID_CommonAdminTools          0h7d4e38d0c3ba97478f14cba229b392b5 && CSIDL_COMMON_ADMINTOOLS
#Define FOLDERID_CommonOEMLinks            0hd0e2bac1df103443bedd7aa20b227a9d && CSIDL_COMMON_OEM_LINKS
#Define FOLDERID_CommonPrograms            0h4ed43901fe6af24986903dafcae6ffb8 && CSIDL_COMMON_PROGRAMS
#Define FOLDERID_CommonStartMenu           0h195711a42ed61d49aa7ce74b8be3b067 && CSIDL_COMMON_STARTMENU
#Define FOLDERID_CommonStartup             0h35eaa582cdd9c5479629e15d2f714e6e && CSIDL_COMMON_STARTUP, CSIDL_COMMON_ALTSTARTUP
#Define FOLDERID_CommonTemplates           0he73742b9ac5747439151b08c6c32d1f7 && CSIDL_COMMON_TEMPLATES
#Define FOLDERID_ComputerFolder            0h7c83c00af8bb2a45850d79d08e667ca7 && CSIDL_DRIVES
#Define FOLDERID_ConflictFolder            0h45fbfe4b7d340640a5beac0cb0567192
#Define FOLDERID_ConnectionsFolder         0h2bd90c6f972ed14588ffb0d186b8dedd && CSIDL_CONNECTIONS
#Define FOLDERID_Contacts                  0h54487856cbc62b46816988e350acb882
#Define FOLDERID_ControlPanelFolder        0heb4aa782b4ae5c46a014d097ee346d63 && CSIDL_CONTROLS
#Define FOLDERID_Cookies                   0h5d760f2be9c07141908e08a611b84ff6 && CSIDL_COOKIES
#Define FOLDERID_Desktop                   0h3accbfb42cdb4c42b0297fe99a87c641 && CSIDL_DESKTOP, CSIDL_DESKTOPDIRECTORY
#Define FOLDERID_Documents                 0hd09ad3fd8f23af46adb46c85480369c7 && CSIDL_MYDOCUMENTS, CSIDL_PERSONAL
#Define FOLDERID_Downloads                 0h90e24d373f126545916439c4925e467b
#Define FOLDERID_Favorites                 0h61f77717ad688a4d87bd30b759fa33dd && CSIDL_FAVORITES, CSIDL_COMMON_FAVORITES
#Define FOLDERID_Fonts                     0hb78c22fd11aee34a864c16f3910ab8fe && CSIDL_FONTS
#Define FOLDERID_Games                     0h1a2cc5ca3db5dc4e92d76b2e8ac19434
#Define FOLDERID_GameTasks                 0h61e6fa54d84d874780b6090220c4b700
#Define FOLDERID_History                   0h3b8adcd984b72e43a7815a1130a75963 && CSIDL_HISTORY
#Define FOLDERID_InternetCache             0he8812435be335142ba856007caedcf9d && CSIDL_INTERNET_CACHE
#Define FOLDERID_InternetFolder            0h74789f4d0c4e0449967b40b0d20c3e4b && CSIDL_INTERNET
#Define FOLDERID_Links                     0he0d5b9bfa9c64c40b2b2ae6db6af4968
#Define FOLDERID_LocalAppData              0h8527b3f1ba6fcf4f9d557b8e7f157091 && CSIDL_LOCAL_APPDATA
#Define FOLDERID_LocalAppDataLow           0ha4a120a58017f64fbd18167343c5af16
#Define FOLDERID_LocalizedResourcesDir     0h5e37002a4c22de49b8d1440df7ef3ddc && CSIDL_RESOURCES_LOCALIZED
#Define FOLDERID_Music                     0h71d5d84b196dd348be97422220080e43 && CSIDL_MYMUSIC
#Define FOLDERID_NetHood                   0h53bfabc57fe12141890086626fc2c973 && CSIDL_NETHOOD
#Define FOLDERID_NetworkFolder             0hc4ee0bd2a85c0549ae3bbf251ea09b53 && CSIDL_NETWORK, CSIDL_COMPUTERSNEARME
#Define FOLDERID_OriginalImages            0haac0362c1258874bbfd04cd0dfb19b39
#Define FOLDERID_PhotoAlbums               0h90cfd26933fcb74f9a0cebb0f0fcb43c
#Define FOLDERID_Pictures                  0h3081e2331e4e7646835a98395c3bc3bb && CSIDL_MYPICTURES
#Define FOLDERID_Playlists                 0hc7c192de7f83694fa3bb86e631204a23
#Define FOLDERID_PrintersFolder            0h2d4efc76add61945a66337bd56068185 && CSIDL_PRINTERS
#Define FOLDERID_PrintHood                 0h8dbd7492d1cfc341b35eb13f55a758f4 && CSIDL_PRINTHOOD
#Define FOLDERID_Profile                   0h8f856c5e220e60479afeea3317b67173 && CSIDL_PROFILE
#Define FOLDERID_ProgramData               0h825dab62c1fdc34da9dd070d1d495d97 && CSIDL_COMMON_APPDATA
#Define FOLDERID_ProgramFiles              0hb6635e90bfc14e49b29c65b732d3d21a && CSIDL_PROGRAM_FILES
#Define FOLDERID_ProgramFilesCommon        0h05edf1f76d9fa247aaae29d317c6f066 && CSIDL_PROGRAM_FILES_COMMON
#Define FOLDERID_ProgramFilesCommonX64     0ha7d565630df0e54587f60da56b6a4f7d
#Define FOLDERID_ProgramFilesCommonX86     0h244d97dec6d93e4dbf91f4455120b917 && CSIDL_PROGRAM_FILES_COMMONX86
#Define FOLDERID_ProgramFilesX64           0h7793806df06a4b448957a3773f02200e
#Define FOLDERID_ProgramFilesX86           0hef405a7cfba0fc4b874ac0f2e0b9fa8e && CSIDL_PROGRAM_FILESX86
#Define FOLDERID_Programs                  0h775d7fa72b2ec344a6a2aba601054a51 && CSIDL_PROGRAMS
#Define FOLDERID_Public                    0ha276dfdf2ac8634d906a5644ac457385
#Define FOLDERID_PublicDesktop             0h0d34aac40ff26348afeff87ef2e6ba25 && CSIDL_COMMON_DESKTOPDIRECTORY
#Define FOLDERID_PublicDocuments           0haf2448ede4dca84581e2fc7965083634 && CSIDL_COMMON_DOCUMENTS
#Define FOLDERID_PublicDownloads           0h9b4c643db81f304f9b45f670235f79c0
#Define FOLDERID_PublicGameTasks           0h3625bfdea8e1594cb6a2414586476aea
#Define FOLDERID_PublicMusic               0hb5fa143257979842bb6192a9deaa44ff && CSIDL_COMMON_MUSIC
#Define FOLDERID_PublicPictures            0h86fbebb607693c419af74fc2abf07cc5 && CSIDL_COMMON_PICTURES
#Define FOLDERID_PublicVideos              0h3a1800248561fb49a2d84a392a602ba3 && CSIDL_COMMON_VIDEO
#Define FOLDERID_QuickLaunch               0h21f0a452757ba9489f6b4b87a210bc8f
#Define FOLDERID_Recent                    0h81c050aed2eb8a4386558a092e34987a && CSIDL_RECENT
#Define FOLDERID_RecordedTV                0h01e085bd2e111e43983b7b15ac09fff1
#Define FOLDERID_RecycleBinFolder          0h464053b7cb3e184cbe4e64cd4cb7d6ac && CSIDL_BITBUCKET
#Define FOLDERID_ResourceDir               0h310cd18adb2a9642a8f7e4701232c972 && CSIDL_RESOURCES
#Define FOLDERID_RoamingAppData            0hdb85b63ef965f64ca03ae3ef65729f3d && CSIDL_APPDATA
#Define FOLDERID_SampleMusic               0h68c650b27df5e14ea63c290ee7d1aa1f
#Define FOLDERID_SamplePictures            0h400590c47923754c844b64e6faf8716b
#Define FOLDERID_SamplePlaylists           0hb369ca15ee30c149ace16b5ec372afb5
#Define FOLDERID_SampleVideos              0h94ad9e85852ead48a71a0969cb56a6cd
#Define FOLDERID_SavedGames                0hff325c4c9dbbb043b5b42d72e54eaaa4
#Define FOLDERID_SavedSearches             0h043a1d7dbbde154195cf2f29da2920da
#Define FOLDERID_SEARCH_CSC                0h46e432eeca31ba4a814fa5ebd2fd6d5e
#Define FOLDERID_SEARCH_MAPI               0h180eec989820444d864466979315a281
#Define FOLDERID_SearchHome                0hd1370319cab82141a6396d472d16972a
#Define FOLDERID_SendTo                    0h6c038389c0274b408f08102d10dcfd74 && CSIDL_SENDTO
#Define FOLDERID_SidebarDefaultParts       0h546e397bc59e0043be0a2482ebae1a26
#Define FOLDERID_SidebarParts              0h2e365da7fc50b74fac2ca8beaa314493
#Define FOLDERID_StartMenu                 0hc3535b6248abc14eba1fa1ef4146fc19 && CSIDL_STARTMENU
#Define FOLDERID_Startup                   0hbb207db96af4974cba105e3608430854
#Define FOLDERID_SyncManagerFolder         0hf88b66434ec1b24997c9747784d784b7
#Define FOLDERID_SyncResultsFolder         0h439a9a2844be5740a41b587a76d7e7f9
#Define FOLDERID_SyncSetupFolder           0h3841210fd3b1904abba927cbc0c5389a
#Define FOLDERID_System                    0h774ec11ae7025d4eb7442eb1ae5198b7 && CSIDL_SYSTEM
#Define FOLDERID_SystemX86                 0hb03152d6f1b25748a4cea8e7c6ea7d27 && CSIDL_SYSTEMX86
#Define FOLDERID_Templates                 0he89332a64e66db48a079df759e0509f7 && CSIDL_TEMPLATES
#Define FOLDERID_TreeProperties            0had49375b9fb4c14983eb15370fbd4882
#Define FOLDERID_UserProfiles              0h72d262070ac5b04ba382697dcd729b80
#Define FOLDERID_UsersFiles                0h7c0fcef30149cc4a8648d5d44b04ef8f
#Define FOLDERID_Videos                    0h1d9b9818b5995b45841cab7c74e4ddfc && CSIDL_MYVIDEO
#Define FOLDERID_Windows                   0h04f48bf3431df242930567de0b28fc23 && CSIDL_WINDOWS

#Define FORMAT_MESSAGE_ALLOCATE_BUFFER                               0x100 
#Define FORMAT_MESSAGE_ARGUMENT_ARRAY                                0x2000 
#Define FORMAT_MESSAGE_FROM_HMODULE                                  0x800 
#Define FORMAT_MESSAGE_FROM_STRING                                   0x400 
#Define FORMAT_MESSAGE_FROM_SYSTEM                                   0x1000 
#Define FORMAT_MESSAGE_IGNORE_INSERTS                                0x200 
#Define FORMAT_MESSAGE_MAX_WIDTH_MASK                                0xFF 
#Define FTP_TRANSFER_TYPE_ASCII                                      0x1 
#Define FTP_TRANSFER_TYPE_BINARY                                     0x2 
#Define FTP_TRANSFER_TYPE_UNKNOWN                                    0x0 
#Define FW_BLACK                                                     900 
#Define FW_BOLD                                                      700 
#Define FW_DEMIBOLD                                                  600 
#Define FW_DONTCARE                                                  0 
#Define FW_EXTRABOLD                                                 800 
#Define FW_EXTRALIGHT                                                200 
#Define FW_HEAVY                                                     900 
#Define FW_LIGHT                                                     300 
#Define FW_MEDIUM                                                    500 
#Define FW_NORMAL                                                    400 
#Define FW_REGULAR                                                   400 
#Define FW_SEMIBOLD                                                  600 
#Define FW_THIN                                                      100 
#Define FW_ULTRABOLD                                                 800 
#Define FW_ULTRALIGHT                                                200 
#Define GB2312_CHARSET                                               134 
#Define GBF_COPY                                                     0x00000002 && create a copy of the bitmap
#Define GBF_DIRECT                                                   0x00000001 && direct dereferencing.
#Define GBF_VALIDBITS                                                0x00000003 

#Define GCL_CBCLSEXTRA                                               -20
#Define GCL_CBWNDEXTRA                                               -18
#Define GCL_CONVERSION                                               0x1
#Define GCL_HBRBACKGROUND                                            -10
#Define GCL_HCURSOR                                                  -12
#Define GCL_HICON                                                    -14
#Define GCL_HICONSM                                                  -34
#Define GCL_HMODULE                                                  -16
#Define GCL_MENUNAME                                                 -8
#Define GCL_REVERSE_LENGTH                                           0x3
#Define GCL_REVERSECONVERSION                                        0x2
#Define GCL_STYLE                                                    -26
#Define GCL_WNDPROC                                                  -24

#Define GDTR_MAX                                                     0x2
#Define GDTR_MIN                                                     0x1

#Define GENERIC_ALL                                                  0x10000000 
#Define GENERIC_EXECUTE                                              0x20000000 
#Define GENERIC_READ                                                 0x80000000 
#Define GENERIC_WRITE                                                0x40000000 

#Define GMR_DAYSTATE                                                 1
#Define GMR_VISIBLE                                                  0

#Define GREEK_CHARSET                                                161 
#Define GUID_DEVCLASS_DISKDRIVE                                      0h67E9364D25E3CE11BFC108002BE10318 
#Define GW_CHILD                                                     5 
#Define GW_ENABLEDPOPUP                                              6 
#Define GW_HWNDFIRST                                                 0 
#Define GW_HWNDLAST                                                  1 
#Define GW_HWNDNEXT                                                  2 
#Define GW_HWNDPREV                                                  3 
#Define GW_MAX                                                       5 
#Define GW_OWNER                                                     4 
#Define GWL_EXSTYLE                                                  -20 
#Define GWL_HINSTANCE                                                -6 
#Define GWL_HWNDPARENT                                               -8 
#Define GWL_ID                                                       -12 
#Define GWL_STYLE                                                    -16 
#Define GWL_USERDATA                                                 -21 
#Define GWL_WNDPROC                                                  -4 
#Define HANGUL_CHARSET                                               129 
#Define HBMMENU_CALLBACK                                             -1 
#Define HBMMENU_MBAR_CLOSE                                           5 
#Define HBMMENU_MBAR_CLOSE_D                                         6 
#Define HBMMENU_MBAR_MINIMIZE                                        3 
#Define HBMMENU_MBAR_MINIMIZE_D                                      7 
#Define HBMMENU_MBAR_RESTORE                                         2 
#Define HBMMENU_POPUP_CLOSE                                          8 
#Define HBMMENU_POPUP_MAXIMIZE                                       10 
#Define HBMMENU_POPUP_MINIMIZE                                       11 
#Define HBMMENU_POPUP_RESTORE                                        9 
#Define HBMMENU_SYSTEM                                               1 
#Define HEAP_CREATE_ALIGN_16                                         0x10000 
#Define HEAP_CREATE_ENABLE_TRACING                                   0x20000 
#Define HEAP_DISABLE_COALESCE_ON_FREE                                0x80 
#Define HEAP_FREE_CHECKING_ENABLED                                   0x40 
#Define HEAP_GENERATE_EXCEPTIONS                                     0x4 
#Define HEAP_GROWABLE                                                0x2 
#Define HEAP_MAXIMUM_TAG                                             0xfff 
#Define HEAP_NO_SERIALIZE                                            0x1 
#Define HEAP_PSEUDO_TAG_FLAG                                         0x8000 
#Define HEAP_REALLOC_IN_PLACE_ONLY                                   0x10 
#Define HEAP_TAG_SHIFT                                               18 
#Define HEAP_TAIL_CHECKING_ENABLED                                   0x20 
#Define HEAP_ZERO_MEMORY                                             0x8 
#Define HEBREW_CHARSET                                               177 
#Define HFILE_ERROR                                                  -1 
#Define HKEY_CLASSES_ROOT                                            0x80000000 
#Define HKEY_CURRENT_CONFIG                                          0x80000005 
#Define HKEY_CURRENT_USER                                            0x80000001 
#Define HKEY_DYN_DATA                                                0x80000006 
#Define HKEY_LOCAL_MACHINE                                           0x80000002 
#Define HKEY_PERFORMANCE_DATA                                        0x80000004 
#Define HKEY_USERS                                                   0x80000003 
#Define HTBORDER                                                     18 
#Define HTBOTTOM                                                     15 
#Define HTBOTTOMLEFT                                                 16 
#Define HTBOTTOMRIGHT                                                17 
#Define HTCAPTION                                                    2 
#Define HTCLIENT                                                     1 
#Define HTCLOSE                                                      20 
#Define HTERROR                                                      -2 
#Define HTGROWBOX                                                    4 
#Define HTHELP                                                       21 
#Define HTHSCROLL                                                    6 
#Define HTLEFT                                                       10 
#Define HTMAXBUTTON                                                  9 
#Define HTMENU                                                       5 
#Define HTMINBUTTON                                                  8 
#Define HTNOWHERE                                                    0 
#Define HTOBJECT                                                     19 
#Define HTREDUCE                                                     8 
#Define HTRIGHT                                                      11 
#Define HTSIZE                                                       4 
#Define HTSIZEFIRST                                                  10 
#Define HTSIZELAST                                                   17 
#Define HTSYSMENU                                                    3 
#Define HTTOP                                                        12 
#Define HTTOPLEFT                                                    13 
#Define HTTOPRIGHT                                                   14 
#Define HTTP_ADDREQ_FLAG_ADD                                         0x20000000 
#Define HTTP_ADDREQ_FLAG_ADD_IF_NEW                                  0x10000000 
#Define HTTP_ADDREQ_FLAG_COALESCE                                    0x40000000 
#Define HTTP_ADDREQ_FLAG_COALESCE_WITH_COMMA                         0x40000000 
#Define HTTP_ADDREQ_FLAG_COALESCE_WITH_SEMICOLON                     0x1000000 
#Define HTTP_ADDREQ_FLAG_REPLACE                                     0x80000000 
#Define HTTP_QUERY_ACCEPT                                            24 
#Define HTTP_QUERY_ACCEPT_CHARSET                                    25 
#Define HTTP_QUERY_ACCEPT_ENCODING                                   26 
#Define HTTP_QUERY_ACCEPT_LANGUAGE                                   27 
#Define HTTP_QUERY_ACCEPT_RANGES                                     42 
#Define HTTP_QUERY_AGE                                               48 
#Define HTTP_QUERY_ALLOW                                             7 
#Define HTTP_QUERY_AUTHORIZATION                                     28 
#Define HTTP_QUERY_CACHE_CONTROL                                     49 
#Define HTTP_QUERY_CONNECTION                                        23 
#Define HTTP_QUERY_CONTENT_BASE                                      50 
#Define HTTP_QUERY_CONTENT_DESCRIPTION                               4 
#Define HTTP_QUERY_CONTENT_DISPOSITION                               47 
#Define HTTP_QUERY_CONTENT_ENCODING                                  29 
#Define HTTP_QUERY_CONTENT_ID                                        3 
#Define HTTP_QUERY_CONTENT_LANGUAGE                                  6 
#Define HTTP_QUERY_CONTENT_LENGTH                                    5 
#Define HTTP_QUERY_CONTENT_LOCATION                                  51 
#Define HTTP_QUERY_CONTENT_MD5                                       52 
#Define HTTP_QUERY_CONTENT_RANGE                                     53 
#Define HTTP_QUERY_CONTENT_TRANSFER_ENCODING                         2 
#Define HTTP_QUERY_CONTENT_TYPE                                      1 
#Define HTTP_QUERY_COOKIE                                            44 
#Define HTTP_QUERY_COST                                              15 
#Define HTTP_QUERY_CUSTOM                                            65535 
#Define HTTP_QUERY_DATE                                              9 
#Define HTTP_QUERY_DERIVED_FROM                                      14 
#Define HTTP_QUERY_ECHO_HEADERS                                      73 
#Define HTTP_QUERY_ECHO_HEADERS_CRLF                                 74 
#Define HTTP_QUERY_ECHO_REPLY                                        72 
#Define HTTP_QUERY_ECHO_REQUEST                                      71 
#Define HTTP_QUERY_ETAG                                              54 
#Define HTTP_QUERY_EXPECT                                            68 
#Define HTTP_QUERY_EXPIRES                                           10 
#Define HTTP_QUERY_FLAG_COALESCE                                     0x10000000 
#Define HTTP_QUERY_FLAG_NUMBER                                       0x20000000 
#Define HTTP_QUERY_FLAG_REQUEST_HEADERS                              0x80000000 
#Define HTTP_QUERY_FLAG_SYSTEMTIME                                   0x40000000 
#Define HTTP_QUERY_FORWARDED                                         30 
#Define HTTP_QUERY_FROM                                              31 
#Define HTTP_QUERY_HOST                                              55 
#Define HTTP_QUERY_IF_MATCH                                          56 
#Define HTTP_QUERY_IF_MODIFIED_SINCE                                 32 
#Define HTTP_QUERY_IF_NONE_MATCH                                     57 
#Define HTTP_QUERY_IF_RANGE                                          58 
#Define HTTP_QUERY_IF_UNMODIFIED_SINCE                               59 
#Define HTTP_QUERY_LAST_MODIFIED                                     11 
#Define HTTP_QUERY_LINK                                              16 
#Define HTTP_QUERY_LOCATION                                          33 
#Define HTTP_QUERY_MAX                                               74 
#Define HTTP_QUERY_MAX_FORWARDS                                      60 
#Define HTTP_QUERY_MESSAGE_ID                                        12 
#Define HTTP_QUERY_MIME_VERSION                                      0 
#Define HTTP_QUERY_ORIG_URI                                          34 
#Define HTTP_QUERY_PRAGMA                                            17 
#Define HTTP_QUERY_PROXY_AUTHENTICATE                                41 
#Define HTTP_QUERY_PROXY_AUTHORIZATION                               61 
#Define HTTP_QUERY_PROXY_CONNECTION                                  69 
#Define HTTP_QUERY_PUBLIC                                            8 
#Define HTTP_QUERY_RANGE                                             62 
#Define HTTP_QUERY_RAW_HEADERS                                       21 
#Define HTTP_QUERY_RAW_HEADERS_CRLF                                  22 
#Define HTTP_QUERY_REFERER                                           35 
#Define HTTP_QUERY_REFRESH                                           46 
#Define HTTP_QUERY_REQUEST_METHOD                                    45 
#Define HTTP_QUERY_RETRY_AFTER                                       36 
#Define HTTP_QUERY_SERVER                                            37 
#Define HTTP_QUERY_SET_COOKIE                                        43 
#Define HTTP_QUERY_STATUS_CODE                                       19 
#Define HTTP_QUERY_STATUS_TEXT                                       20 
#Define HTTP_QUERY_TITLE                                             38 
#Define HTTP_QUERY_TRANSFER_ENCODING                                 63 
#Define HTTP_QUERY_UNLESS_MODIFIED_SINCE                             70 
#Define HTTP_QUERY_UPGRADE                                           64 
#Define HTTP_QUERY_URI                                               13 
#Define HTTP_QUERY_USER_AGENT                                        39 
#Define HTTP_QUERY_VARY                                              65 
#Define HTTP_QUERY_VERSION                                           18 
#Define HTTP_QUERY_VIA                                               66 
#Define HTTP_QUERY_WARNING                                           67 
#Define HTTP_QUERY_WWW_AUTHENTICATE                                  40 
#Define HTTP_STATUS_ACCEPTED                                         202 
#Define HTTP_STATUS_AMBIGUOUS                                        300 
#Define HTTP_STATUS_BAD_GATEWAY                                      502 
#Define HTTP_STATUS_BAD_METHOD                                       405 
#Define HTTP_STATUS_BAD_REQUEST                                      400 
#Define HTTP_STATUS_CONFLICT                                         409 
#Define HTTP_STATUS_CONTINUE                                         100 
#Define HTTP_STATUS_CREATED                                          201 
#Define HTTP_STATUS_DENIED                                           401 
#Define HTTP_STATUS_FIRST                                            100 
#Define HTTP_STATUS_FORBIDDEN                                        403 
#Define HTTP_STATUS_GATEWAY_TIMEOUT                                  504 
#Define HTTP_STATUS_GONE                                             410 
#Define HTTP_STATUS_LAST                                             505 
#Define HTTP_STATUS_LENGTH_REQUIRED                                  411 
#Define HTTP_STATUS_MOVED                                            301 
#Define HTTP_STATUS_NO_CONTENT                                       204 
#Define HTTP_STATUS_NONE_ACCEPTABLE                                  406 
#Define HTTP_STATUS_NOT_FOUND                                        404 
#Define HTTP_STATUS_NOT_MODIFIED                                     304 
#Define HTTP_STATUS_NOT_SUPPORTED                                    501 
#Define HTTP_STATUS_OK                                               200 
#Define HTTP_STATUS_PARTIAL                                          203 
#Define HTTP_STATUS_PARTIAL_CONTENT                                  206 
#Define HTTP_STATUS_PAYMENT_REQ                                      402 
#Define HTTP_STATUS_PRECOND_FAILED                                   412 
#Define HTTP_STATUS_PROXY_AUTH_REQ                                   407 
#Define HTTP_STATUS_REDIRECT                                         302 
#Define HTTP_STATUS_REDIRECT_KEEP_VERB                               307 
#Define HTTP_STATUS_REDIRECT_METHOD                                  303 
#Define HTTP_STATUS_REQUEST_TIMEOUT                                  408 
#Define HTTP_STATUS_REQUEST_TOO_LARGE                                413 
#Define HTTP_STATUS_RESET_CONTENT                                    205 
#Define HTTP_STATUS_RETRY_WITH                                       449 
#Define HTTP_STATUS_SERVER_ERROR                                     500 
#Define HTTP_STATUS_SERVICE_UNAVAIL                                  503 
#Define HTTP_STATUS_SWITCH_PROTOCOLS                                 101 
#Define HTTP_STATUS_UNSUPPORTED_MEDIA                                415 
#Define HTTP_STATUS_URI_TOO_LONG                                     414 
#Define HTTP_STATUS_USE_PROXY                                        305 
#Define HTTP_STATUS_VERSION_NOT_SUP                                  505 
#Define HTTRANSPARENT                                                -1 
#Define HWND_BOTTOM                                                  1 
#Define HWND_BROADCAST                                               0xffff 
#Define HWND_DESKTOP                                                 0 
#Define HWND_MESSAGE                                                 -3 
#Define HWND_NOTOPMOST                                               -2 
#Define HWND_TOP                                                     0 
#Define HWND_TOPMOST                                                 -1 
#Define ICC_ANIMATE_CLASS                                            0x80 
#Define ICC_BAR_CLASSES                                              0x4 
#Define ICC_COOL_CLASSES                                             0x400 
#Define ICC_DATE_CLASSES                                             0x100 
#Define ICC_HOTKEY_CLASS                                             0x40 
#Define ICC_INTERNET_CLASSES                                         0x800 
#Define ICC_LINK_CLASS                                               0x8000 
#Define ICC_LISTVIEW_CLASSES                                         0x1 
#Define ICC_NATIVEFNTCON_CLASS                                       0x2000 
#Define ICC_PAGESCROLLER_CLASS                                       0x1000 
#Define ICC_PROGRESS_CLASS                                           0x20 
#Define ICC_STANDARD_CLASSES                                         0x4000 
#Define ICC_TAB_CLASSES                                              0x8 
#Define ICC_TREEVIEW_CLASSES                                         0x2 
#Define ICC_UPDOWN_CLASS                                             0x10 
#Define ICC_USEREX_CLASSES                                           0x200 
#Define ICC_WIN95_CLASSES                                            0xff 
#Define ICON_BIG                                                     1 
#Define ICON_SMALL                                                   0 
#Define ICU_DECODE                                                   0x10000000 

#Define IDCANCEL                                                     2
#Define IDOK                                                         1

#Define ILC_COLOR                                                    0x0 
#Define ILC_COLOR16                                                  0x10 
#Define ILC_COLOR24                                                  0x18 
#Define ILC_COLOR32                                                  0x20 
#Define ILC_COLOR4                                                   0x4 
#Define ILC_COLOR8                                                   0x8 
#Define ILC_COLORDDB                                                 0xfe 
#Define ILC_HIGHQUALITYSCALE                                         0x20000 && VISTA Imagelist should enable use of the high quality scaler.
#Define ILC_MASK                                                     0x1 
#Define ILC_MIRROR                                                   0x2000 && Mirror the icons contained, if the process is mirrored
#Define ILC_ORIGINALSIZE                                             0x10000 && VISTA Imagelist should accept smaller than set images and apply OriginalSize based on image added
#Define ILC_PERITEMMIRROR                                            0x8000 && Causes the mirroring code to mirror each item when inserting a set of images, verses the whole strip
#Define INTERNET_AUTODIAL_FAILIFSECURITYCHECK                        4 
#Define INTERNET_DEFAULT_FTP_PORT                                    21 
#Define INTERNET_DEFAULT_GOPHER_PORT                                 70 
#Define INTERNET_DEFAULT_HTTP_PORT                                   80 
#Define INTERNET_DEFAULT_HTTPS_PORT                                  443 
#Define INTERNET_DEFAULT_SOCKS_PORT                                  1080 
#Define INTERNET_ERROR_BASE                                          12000 
#Define INTERNET_ERROR_LAST                                          12174 
#Define INTERNET_FLAG_ASYNC                                          0x10000000 
#Define INTERNET_FLAG_CACHE_ASYNC                                    0x00000080 
#Define INTERNET_FLAG_CACHE_IF_NET_FAIL                              0x00010000 
#Define INTERNET_FLAG_DONT_CACHE                                     0x04000000 
#Define INTERNET_FLAG_EXISTING_CONNECT                               0x20000000 
#Define INTERNET_FLAG_FORMS_SUBMIT                                   0x00000040 
#Define INTERNET_FLAG_FROM_CACHE                                     0x01000000 
#Define INTERNET_FLAG_HYPERLINK                                      0x00000400 
#Define INTERNET_FLAG_IGNORE_CERT_CN_INVALID                         0x00001000 
#Define INTERNET_FLAG_IGNORE_CERT_DATE_INVALID                       0x00002000 
#Define INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTP                        0x00008000 
#Define INTERNET_FLAG_IGNORE_REDIRECT_TO_HTTPS                       0x00004000 
#Define INTERNET_FLAG_KEEP_CONNECTION                                0x00400000 
#Define INTERNET_FLAG_MAKE_PERSISTENT                                0x02000000 
#Define INTERNET_FLAG_MUST_CACHE_REQUEST                             0x00000010 
#Define INTERNET_FLAG_NEED_FILE                                      0x00000010 
#Define INTERNET_FLAG_NO_AUTH                                        0x00040000 
#Define INTERNET_FLAG_NO_AUTO_REDIRECT                               0x00200000 
#Define INTERNET_FLAG_NO_CACHE_WRITE                                 0x04000000 
#Define INTERNET_FLAG_NO_COOKIES                                     0x00080000 
#Define INTERNET_FLAG_NO_UI                                          0x00000200 
#Define INTERNET_FLAG_OFFLINE                                        0x01000000 
#Define INTERNET_FLAG_PASSIVE                                        0x08000000 
#Define INTERNET_FLAG_PRAGMA_NOCACHE                                 0x00000100 
#Define INTERNET_FLAG_RAW_DATA                                       0x40000000 
#Define INTERNET_FLAG_READ_PREFETCH                                  0x00100000 
#Define INTERNET_FLAG_RELOAD                                         0x80000000 
#Define INTERNET_FLAG_RESYNCHRONIZE                                  0x00000800 
#Define INTERNET_FLAG_SECURE                                         0x00800000 
#Define INTERNET_FLAG_TRANSFER_ASCII                                 0x1 
#Define INTERNET_FLAG_TRANSFER_BINARY                                0x2 
#Define INTERNET_INVALID_PORT_NUMBER                                 0 
#Define INTERNET_MAX_HOST_NAME_LENGTH                                256 
#Define INTERNET_MAX_PASSWORD_LENGTH                                 128 
#Define INTERNET_MAX_PATH_LENGTH                                     2048 
#Define INTERNET_MAX_PORT_NUMBER_LENGTH                              5 
#Define INTERNET_MAX_SCHEME_LENGTH                                   32 
#Define INTERNET_MAX_USER_NAME_LENGTH                                128 
#Define INTERNET_OPEN_TYPE_DIRECT                                    1 
#Define INTERNET_OPEN_TYPE_PRECONFIG                                 0 
#Define INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY               4 
#Define INTERNET_OPEN_TYPE_PROXY                                     3 
#Define INTERNET_OPTION_ASYNC                                        30 
#Define INTERNET_OPTION_ASYNC_ID                                     15 
#Define INTERNET_OPTION_ASYNC_PRIORITY                               16 
#Define INTERNET_OPTION_BYPASS_EDITED_ENTRY                          64 
#Define INTERNET_OPTION_CACHE_STREAM_HANDLE                          27 
#Define INTERNET_OPTION_CACHE_TIMESTAMPS                             69 
#Define INTERNET_OPTION_CALLBACK                                     1 
#Define INTERNET_OPTION_CALLBACK_FILTER                              54 
#Define INTERNET_OPTION_CODEPAGE                                     68 
#Define INTERNET_OPTION_CONNECT_BACKOFF                              4 
#Define INTERNET_OPTION_CONNECT_LIMIT                                46 
#Define INTERNET_OPTION_CONNECT_RETRIES                              3 
#Define INTERNET_OPTION_CONNECT_TIME                                 55 
#Define INTERNET_OPTION_CONNECT_TIMEOUT                              2 
#Define INTERNET_OPTION_CONNECTED_STATE                              50 
#Define INTERNET_OPTION_CONTEXT_VALUE                                45 
#Define INTERNET_OPTION_CONTROL_RECEIVE_TIMEOUT                      6 
#Define INTERNET_OPTION_CONTROL_SEND_TIMEOUT                         5 
#Define INTERNET_OPTION_DATA_RECEIVE_TIMEOUT                         8 
#Define INTERNET_OPTION_DATA_SEND_TIMEOUT                            7 
#Define INTERNET_OPTION_DATAFILE_NAME                                33 
#Define INTERNET_OPTION_DIGEST_AUTH_UNLOAD                           76 
#Define INTERNET_OPTION_DISABLE_AUTODIAL                             70 
#Define INTERNET_OPTION_DISCONNECTED_TIMEOUT                         49 
#Define INTERNET_OPTION_END_BROWSER_SESSION                          42 
#Define INTERNET_OPTION_ERROR_MASK                                   62 
#Define INTERNET_OPTION_EXTENDED_ERROR                               24 
#Define INTERNET_OPTION_FROM_CACHE_TIMEOUT                           63 
#Define INTERNET_OPTION_HANDLE_TYPE                                  9 
#Define INTERNET_OPTION_HTTP_VERSION                                 59 
#Define INTERNET_OPTION_IDLE_STATE                                   51 
#Define INTERNET_OPTION_IGNORE_OFFLINE                               77 
#Define INTERNET_OPTION_KEEP_CONNECTION                              22 
#Define INTERNET_OPTION_LISTEN_TIMEOUT                               11 
#Define INTERNET_OPTION_MAX_CONNS_PER_1_0_SERVER                     74 
#Define INTERNET_OPTION_MAX_CONNS_PER_SERVER                         73 
#Define INTERNET_OPTION_OFFLINE_MODE                                 26 
#Define INTERNET_OPTION_OFFLINE_SEMANTICS                            52 
#Define INTERNET_OPTION_PARENT_HANDLE                                21 
#Define INTERNET_OPTION_PASSWORD                                     29 
#Define INTERNET_OPTION_PER_CONNECTION_OPTION                        75 
#Define INTERNET_OPTION_POLICY                                       48 
#Define INTERNET_OPTION_PROXY                                        38 
#Define INTERNET_OPTION_PROXY_PASSWORD                               44 
#Define INTERNET_OPTION_PROXY_USERNAME                               43 
#Define INTERNET_OPTION_READ_BUFFER_SIZE                             12 
#Define INTERNET_OPTION_RECEIVE_THROUGHPUT                           57 
#Define INTERNET_OPTION_RECEIVE_TIMEOUT                              6 
#Define INTERNET_OPTION_REFRESH                                      37 
#Define INTERNET_OPTION_REQUEST_FLAGS                                23 
#Define INTERNET_OPTION_REQUEST_PRIORITY                             58 
#Define INTERNET_OPTION_RESET_URLCACHE_SESSION                       60 
#Define INTERNET_OPTION_SECONDARY_CACHE_KEY                          53 
#Define INTERNET_OPTION_SECURITY_CERTIFICATE                         35 
#Define INTERNET_OPTION_SECURITY_CERTIFICATE_STRUCT                  32 
#Define INTERNET_OPTION_SECURITY_FLAGS                               31 
#Define INTERNET_OPTION_SECURITY_KEY_BITNESS                         36 
#Define INTERNET_OPTION_SECURITY_SELECT_CLIENT_CERT                  47 
#Define INTERNET_OPTION_SEND_THROUGHPUT                              56 
#Define INTERNET_OPTION_SEND_TIMEOUT                                 5 
#Define INTERNET_OPTION_SETTINGS_CHANGED                             39 
#Define INTERNET_OPTION_URL                                          34 
#Define INTERNET_OPTION_USER_AGENT                                   41 
#Define INTERNET_OPTION_USERNAME                                     28 
#Define INTERNET_OPTION_VERSION                                      40 
#Define INTERNET_OPTION_WRITE_BUFFER_SIZE                            13 
#Define INTERNET_SCHEME_DEFAULT                                      0 
#Define INTERNET_SCHEME_FILE                                         5 
#Define INTERNET_SCHEME_FIRST                                        1 
#Define INTERNET_SCHEME_FTP                                          1 
#Define INTERNET_SCHEME_GOPHER                                       2 
#Define INTERNET_SCHEME_HTTP                                         3 
#Define INTERNET_SCHEME_HTTPS                                        4 
#Define INTERNET_SCHEME_LAST                                         8 
#Define INTERNET_SCHEME_MAILTO                                       7 
#Define INTERNET_SCHEME_NEWS                                         6 
#Define INTERNET_SCHEME_PARTIAL                                      -2 
#Define INTERNET_SCHEME_SOCKS                                        8 
#Define INTERNET_SCHEME_UNKNOWN                                      -1 
#Define INTERNET_SERVICE_FTP                                         1 
#Define INTERNET_SERVICE_GOPHER                                      2 
#Define INTERNET_SERVICE_HTTP                                        3 
#Define INVALID_SET_FILE_POINTER                                     -1 
#Define IRF_NO_WAIT                                                  0x8 
#Define JOHAB_CHARSET                                                130 
#Define KEY_ALL_ACCESS                                               0xf003f 
#Define KEY_CREATE_LINK                                              0x00020 
#Define KEY_CREATE_SUB_KEY                                           0x00004 
#Define KEY_ENUMERATE_SUB_KEYS                                       0x00008 
#Define KEY_EVENT                                                    0x00001 
#Define KEY_EXECUTE                                                  0x20019 
#Define KEY_NOTIFY                                                   0x00010 
#Define KEY_QUERY_VALUE                                              0x00001 
#Define KEY_READ                                                     0x20019 
#Define KEY_SET_VALUE                                                0x00002 
#Define KEY_WOW64_32KEY                                              0x0200
#Define KEY_WRITE                                                    0x20006 
#Define KEYEVENTF_KEYUP                                              0x2

*!* Make sure that the folder already exists or create it and apply security specified in folder definition
*!* If folder can not be created then function will return failure and no folder path (IDList) will be returned
*!* If folder is located on the network the function may take long time to execute
#Define KF_FLAG_CREATE              0x00008000  

*!* If this flag is specified then the folder path is returned and no verification is performed
*!* Use this flag is you want to get folder's path (IDList) and do not need to verify folder's existence
*!* If this flag is NOT specified then Known Folder API will try to verify that the folder exists
*!* If folder does not exist or can not be accessed then function will return failure and no folder path (IDList) will be returned
*!* If folder is located on the network the function may take long time to execute
#Define KF_FLAG_DONT_VERIFY         0x00004000  

*!* Set folder path as is and do not try to substitute parts of the path with environments variables.
*!* If flag is not specified then Known Folder will try to replace parts of the path with some
*!* known environment variables (%USERPROFILE%, %APPDATA% etc.)
#Define KF_FLAG_DONT_UNEXPAND       0x00002000  

*!* Get file system based IDList if available. If the flag is not specified the Known Folder API
*!* will try to return aliased IDList by default. Example for FOLDERID_Documents -
*!* Aliased - [desktop]\[user]\[Documents] - exact location is determined by shell namespace layout and might change
*!* Non aliased - [desktop]\[computer]\[disk_c]\[users]\[user]\[Documents] - location is determined by folder location in the file system
#Define KF_FLAG_NO_ALIAS            0x00001000  

*!* Initialize the folder with desktop.ini settings
*!* If folder can not be initialized then function will return failure and no folder path will be returned
*!* If folder is located on the network the function may take long time to execute
#Define KF_FLAG_INIT                0x00000800  

*!* Get the default path, will also verify folder existence unless KF_FLAG_DONT_VERIFY is also specified
#Define KF_FLAG_DEFAULT_PATH        0x00000400  

*!* Get the not-parent-relative default path. Only valid with KF_FLAG_DEFAULT_PATH
#Define KF_FLAG_NOT_PARENT_RELATIVE 0x00000200  

*!* Build simple pidl
#Define KF_FLAG_SIMPLE_IDLIST       0x00000100  

#Define LANG_AFRIKAANS                                               0x36 
#Define LANG_ALBANIAN                                                0x1c 
#Define LANG_ARABIC                                                  0x01 
#Define LANG_BASQUE                                                  0x2d 
#Define LANG_BELARUSIAN                                              0x23 
#Define LANG_BULGARIAN                                               0x02 
#Define LANG_CATALAN                                                 0x03 
#Define LANG_CHINESE                                                 0x04 
#Define LANG_CROATIAN                                                0x1a 
#Define LANG_CZECH                                                   0x05 
#Define LANG_DANISH                                                  0x06 
#Define LANG_DUTCH                                                   0x13 
#Define LANG_ENGLISH                                                 0x09 
#Define LANG_ESTONIAN                                                0x25 
#Define LANG_FAEROESE                                                0x38 
#Define LANG_FARSI                                                   0x29 
#Define LANG_FINNISH                                                 0x0b 
#Define LANG_FRENCH                                                  0x0c 
#Define LANG_GALICIAN                                                0x56 
#Define LANG_GERMAN                                                  0x07 
#Define LANG_GREEK                                                   0x08 
#Define LANG_HEBREW                                                  0x0d 
#Define LANG_HUNGARIAN                                               0x0e 
#Define LANG_ICELANDIC                                               0x0f 
#Define LANG_INDONESIAN                                              0x21 
#Define LANG_ITALIAN                                                 0x10 
#Define LANG_JAPANESE                                                0x11 
#Define LANG_KOREAN                                                  0x12 
#Define LANG_LATVIAN                                                 0x26 
#Define LANG_LITHUANIAN                                              0x27 
#Define LANG_MALAY                                                   0x3e 
#Define LANG_NEUTRAL                                                 0x00 
#Define LANG_NORWEGIAN                                               0x14 
#Define LANG_POLISH                                                  0x15 
#Define LANG_PORTUGUESE                                              0x16 
#Define LANG_ROMANIAN                                                0x18 
#Define LANG_RUSSIAN                                                 0x19 
#Define LANG_SERBIAN                                                 0x1a 
#Define LANG_SLOVAK                                                  0x1b 
#Define LANG_SLOVENIAN                                               0x24 
#Define LANG_SPANISH                                                 0x0a 
#Define LANG_SWEDISH                                                 0x1d 
#Define LANG_THAI                                                    0x1e 
#Define LANG_TURKISH                                                 0x1f 
#Define LANG_UKRAINIAN                                               0x22 
#Define LANG_VIETNAMESE                                              0x2a 
#Define LF_FACESIZE                                                  32 
#Define LOCALE_FONTSIGNATURE                                         0x58 
#Define LOCALE_ICALENDARTYPE                                         0x1009 
#Define LOCALE_ICENTURY                                              0x24 
#Define LOCALE_ICOUNTRY                                              0x5 
#Define LOCALE_ICURRDIGITS                                           0x19 
#Define LOCALE_ICURRENCY                                             0x1b 
#Define LOCALE_IDATE                                                 0x21 
#Define LOCALE_IDAYLZERO                                             0x26 
#Define LOCALE_IDEFAULTANSICODEPAGE                                  0x1004 
#Define LOCALE_IDEFAULTCODEPAGE                                      0xb 
#Define LOCALE_IDEFAULTCOUNTRY                                       0xa 
#Define LOCALE_IDEFAULTEBCDICCODEPAGE                                0x1012 
#Define LOCALE_IDEFAULTLANGUAGE                                      0x9 
#Define LOCALE_IDEFAULTMACCODEPAGE                                   0x1011 
#Define LOCALE_IDIGITS                                               0x11 
#Define LOCALE_IDIGITSUBSTITUTION                                    0x1014 
#Define LOCALE_IFIRSTDAYOFWEEK                                       0x100c 
#Define LOCALE_IFIRSTWEEKOFYEAR                                      0x100d 
#Define LOCALE_IINTLCURRDIGITS                                       0x1a 
#Define LOCALE_ILANGUAGE                                             0x1 
#Define LOCALE_ILDATE                                                0x22 
#Define LOCALE_ILZERO                                                0x12 
#Define LOCALE_IMEASURE                                              0xD 
#Define LOCALE_IMONLZERO                                             0x27 
#Define LOCALE_INEGCURR                                              0x1C 
#Define LOCALE_INEGNUMBER                                            0x1010 
#Define LOCALE_INEGSEPBYSPACE                                        0x57 
#Define LOCALE_INEGSIGNPOSN                                          0x53 
#Define LOCALE_INEGSYMPRECEDES                                       0x56 
#Define LOCALE_IOPTIONALCALENDAR                                     0x100B 
#Define LOCALE_IPAPERSIZE                                            0x100A 
#Define LOCALE_IPOSSEPBYSPACE                                        0x55 
#Define LOCALE_IPOSSIGNPOSN                                          0x52 
#Define LOCALE_IPOSSYMPRECEDES                                       0x54 
#Define LOCALE_ITIME                                                 0x23 
#Define LOCALE_ITIMEMARKPOSN                                         0x1005 
#Define LOCALE_ITLZERO                                               0x25 
#Define LOCALE_NOUSEROVERRIDE                                        0x80000000 
#Define LOCALE_RETURN_NUMBER                                         0x20000000 
#Define LOCALE_S1159                                                 0x28 
#Define LOCALE_S2359                                                 0x29 
#Define LOCALE_SABBREVCTRYNAME                                       0x7 
#Define LOCALE_SABBREVDAYNAME1                                       0x31 
#Define LOCALE_SABBREVDAYNAME2                                       0x32 
#Define LOCALE_SABBREVDAYNAME3                                       0x33 
#Define LOCALE_SABBREVDAYNAME4                                       0x34 
#Define LOCALE_SABBREVDAYNAME5                                       0x35 
#Define LOCALE_SABBREVDAYNAME6                                       0x36 
#Define LOCALE_SABBREVDAYNAME7                                       0x37 
#Define LOCALE_SABBREVLANGNAME                                       0x3 
#Define LOCALE_SABBREVMONTHNAME1                                     0x44 
#Define LOCALE_SABBREVMONTHNAME10                                    0x4D 
#Define LOCALE_SABBREVMONTHNAME11                                    0x4E 
#Define LOCALE_SABBREVMONTHNAME12                                    0x4F 
#Define LOCALE_SABBREVMONTHNAME13                                    0x100F 
#Define LOCALE_SABBREVMONTHNAME2                                     0x45 
#Define LOCALE_SABBREVMONTHNAME3                                     0x46 
#Define LOCALE_SABBREVMONTHNAME4                                     0x47 
#Define LOCALE_SABBREVMONTHNAME5                                     0x48 
#Define LOCALE_SABBREVMONTHNAME6                                     0x49 
#Define LOCALE_SABBREVMONTHNAME7                                     0x4A 
#Define LOCALE_SABBREVMONTHNAME8                                     0x4B 
#Define LOCALE_SABBREVMONTHNAME9                                     0x4C 
#Define LOCALE_SCOUNTRY                                              0x6 
#Define LOCALE_SCURRENCY                                             0x14 
#Define LOCALE_SDATE                                                 0x1D 
#Define LOCALE_SDAYNAME1                                             0x2A 
#Define LOCALE_SDAYNAME2                                             0x2B 
#Define LOCALE_SDAYNAME3                                             0x2C 
#Define LOCALE_SDAYNAME4                                             0x2D 
#Define LOCALE_SDAYNAME5                                             0x2E 
#Define LOCALE_SDAYNAME6                                             0x2F 
#Define LOCALE_SDAYNAME7                                             0x30 
#Define LOCALE_SDECIMAL                                              0xE 
#Define LOCALE_SENGCOUNTRY                                           0x1002 
#Define LOCALE_SENGCURRNAME                                          0x1007 
#Define LOCALE_SENGLANGUAGE                                          0x1001 
#Define LOCALE_SGROUPING                                             0x10 
#Define LOCALE_SINTLSYMBOL                                           0x15 
#Define LOCALE_SISO3166CTRYNAME                                      0x5A 
#Define LOCALE_SISO639LANGNAME                                       0x59 
#Define LOCALE_SLANGUAGE                                             0x2 
#Define LOCALE_SLIST                                                 0xC 
#Define LOCALE_SLONGDATE                                             0x20 
#Define LOCALE_SMONDECIMALSEP                                        0x16 
#Define LOCALE_SMONGROUPING                                          0x18 
#Define LOCALE_SMONTHNAME1                                           0x38 
#Define LOCALE_SMONTHNAME10                                          0x41 
#Define LOCALE_SMONTHNAME11                                          0x42 
#Define LOCALE_SMONTHNAME12                                          0x43 
#Define LOCALE_SMONTHNAME13                                          0x100E 
#Define LOCALE_SMONTHNAME2                                           0x39 
#Define LOCALE_SMONTHNAME3                                           0x3A 
#Define LOCALE_SMONTHNAME4                                           0x3B 
#Define LOCALE_SMONTHNAME5                                           0x3C 
#Define LOCALE_SMONTHNAME6                                           0x3D 
#Define LOCALE_SMONTHNAME7                                           0x3E 
#Define LOCALE_SMONTHNAME8                                           0x3F 
#Define LOCALE_SMONTHNAME9                                           0x40 
#Define LOCALE_SMONTHOUSANDSEP                                       0x17 
#Define LOCALE_SNATIVECTRYNAME                                       0x8 
#Define LOCALE_SNATIVECURRNAME                                       0x1008 
#Define LOCALE_SNATIVEDIGITS                                         0x13 
#Define LOCALE_SNATIVELANGNAME                                       0x4 
#Define LOCALE_SNEGATIVESIGN                                         0x51 
#Define LOCALE_SPOSITIVESIGN                                         0x50 
#Define LOCALE_SSHORTDATE                                            0x1F 
#Define LOCALE_SSORTNAME                                             0x1013 
#Define LOCALE_STHOUSAND                                             0xF 
#Define LOCALE_STIME                                                 0x1E 
#Define LOCALE_STIMEFORMAT                                           0x1003 
#Define LOCALE_SYEARMONTH                                            0x1006 
#Define LOCALE_SYSTEM_DEFAULT                                        0x800 
#Define LOCALE_USE_CP_ACP                                            0x40000000 
#Define LOCALE_USER_DEFAULT                                          0x400 
#Define LOGPIXELSX                                                   88 
#Define LOGPIXELSY                                                   90 

#Define LV_VIEW_ICON		0x0
#Define LV_VIEW_DETAILS		0x1
#Define LV_VIEW_SMALLICON	0x2
#Define LV_VIEW_LIST		0x3
#Define LV_VIEW_TILE		0x4

#Define MAC_CHARSET                                                  77 
#Define MAX_PATH                                                     260 
#Define MAXDWORD                                                     0xFFFFFFFF 
#Define MAXLONG                                                      0x7FFFFFFF 

#Define MCHT_CALENDAR                                                0x00020000
#Define MCHT_CALENDARBK                                              0x00020000
#Define MCHT_CALENDARDATE                                            0x00020001
#Define MCHT_CALENDARDATENEXT                                        0x01020001
#Define MCHT_CALENDARDATEPREV                                        0x02020001
#Define MCHT_CALENDARDAY                                             0x00020002
#Define MCHT_CALENDARWEEKNUM                                         0x00020003
#Define MCHT_NEXT                                                    0x01000000
#Define MCHT_NOWHERE                                                 0x00000000
#Define MCHT_PREV                                                    0x02000000
#Define MCHT_TITLE                                                   0x00010000
#Define MCHT_TITLEBK                                                 0x00010000
#Define MCHT_TITLEBTNNEXT                                            0x01010003
#Define MCHT_TITLEBTNPREV                                            0x02010003
#Define MCHT_TITLEMONTH                                              0x00010001
#Define MCHT_TITLEYEAR                                               0x00010002
#Define MCHT_TODAYLINK                                               0x00030000

#Define MCM_FIRST                                                    0x1000 
#Define MCM_GETCALENDARBORDER                                        0x101F 
#Define MCM_GETCALENDARCOUNT                                         0x1017 
#Define MCM_GETCALENDARGRIDINFO                                      0x1018 
#Define MCM_GETCALID                                                 (0x1000+27) 
#Define MCM_GETCOLOR                                                 0x100b 
#Define MCM_GETCURRENTVIEW                                           (0x1000+22) 
#Define MCM_GETCURSEL                                                0x1001 
#Define MCM_GETFIRSTDAYOFWEEK                                        0x1010 
#Define MCM_GETMAXSELCOUNT                                           0x1003 
#Define MCM_GETMAXTODAYWIDTH                                         0x1015 
#Define MCM_GETMINREQRECT                                            0x1009 
#Define MCM_GETMONTHDELTA                                            0x1013 
#Define MCM_GETMONTHRANGE                                            0x1007 
#Define MCM_GETRANGE                                                 0x1011 
#Define MCM_GETSELRANGE                                              0x1005 
#Define MCM_GETTODAY                                                 0x100d 
#Define MCM_GETUNICODEFORMAT                                         0x2006 
#Define MCM_HITTEST                                                  0x100e 
#Define MCM_SETCALENDARBORDER                                        (0x1000+30) 
#Define MCM_SETCALID                                                 (0x1000+28) 
#Define MCM_SETCOLOR                                                 0x100a 
#Define MCM_SETCURRENTVIEW                                           (0x1000+32) 
#Define MCM_SETCURSEL                                                0x1002 
#Define MCM_SETDAYSTATE                                              0x1008 
#Define MCM_SETFIRSTDAYOFWEEK                                        0x100f 
#Define MCM_SETMAXSELCOUNT                                           0x1004 
#Define MCM_SETMONTHDELTA                                            0x1014 
#Define MCM_SETRANGE                                                 0x1012 
#Define MCM_SETSELRANGE                                              0x1006 
#Define MCM_SETTODAY                                                 0x100c 
#Define MCM_SETUNICODEFORMAT                                         0x2005 
#Define MCM_SIZERECTTOMIN                                            (0x1000+29) 
#Define MCN_FIRST                                                    (-750) 
#Define MCN_GETDAYSTATE                                              (-747) 
#Define MCN_LAST                                                     (-759) 
#Define MCN_SELCHANGE                                                (-749) 
#Define MCN_SELECT                                                   (-746) 
#Define MCS_COMMAND_CONNECT                                          19 
#Define MCS_COMMAND_DISABLE                                          14 
#Define MCS_COMMAND_ENABLE                                           13 
#Define MCS_COMMAND_GET_CONFIG                                       16 
#Define MCS_COMMAND_REFRESH_STATUS                                   21 
#Define MCS_COMMAND_RENAME                                           20 
#Define MCS_COMMAND_SET_CONFIG                                       15 
#Define MCS_COMMAND_START                                            17 
#Define MCS_COMMAND_STOP                                             18 
#Define MCS_CREATE_CONFIGS_BY_DEFAULT                                0x10 
#Define MCS_CREATE_ONE_PER_NETCARD                                   0x1 
#Define MCS_CREATE_PMODE_NOT_REQUIRED                                0x100 
#Define MCS_DAYSTATE                                                 0x1 
#Define MCS_MULTISELECT                                              0x2 
#Define MCS_NOTODAY                                                  0x10 
#Define MCS_NOTODAYCIRCLE                                            0x8 
#Define MCS_WEEKNUMBERS                                              0x4 
#Define MCSC_BACKGROUND                                              0 
#Define MCSC_MONTHBK                                                 4 
#Define MCSC_TEXT                                                    1 
#Define MCSC_TITLEBK                                                 2 
#Define MCSC_TITLETEXT                                               3 
#Define MCSC_TRAILINGTEXT                                            5 
#Define MF_APPEND                                                    0x100 
#Define MF_BITMAP                                                    0x4 
#Define MF_BYCOMMAND                                                 0x0 
#Define MF_BYPOSITION                                                0x400 
#Define MF_CALLBACKS                                                 0x8000000 
#Define MF_CHANGE                                                    0x80 
#Define MF_CHECKED                                                   0x8 
#Define MF_CONV                                                      0x40000000 
#Define MF_DEFAULT                                                   0x1000 
#Define MF_DELETE                                                    0x200 
#Define MF_DISABLED                                                  0x2 
#Define MF_DLL_NAME                                                  "Microsoft Picture Converter"
#Define MF_ENABLED                                                   0x0 
#Define MF_END                                                       0x80 
#Define MF_ERRORS                                                    0x10000000 
#Define MF_FLAGS_CREATE_BUT_NO_SHOW_DISABLED                         0x8 
#Define MF_FLAGS_EVEN_IF_NO_RESOURCE                                 0x1 
#Define MF_FLAGS_FILL_IN_UNKNOWN_RESOURCE                            0x4 
#Define MF_FLAGS_NO_CREATE_IF_NO_RESOURCE                            0x2 
#Define MF_FPCR_FUNC                                                 0x25 
#Define MF_FPCR_FUNC_STR                                             "mf_fpcr" 
#Define MF_GRAYED                                                    0x1 
#Define MF_HELP                                                      0x4000 
#Define MF_HILITE                                                    0x80 
#Define MF_HSZ_INFO                                                  0x1000000 
#Define MF_INSERT                                                    0x0 
#Define MF_LINKS                                                     0x20000000 
#Define MF_MASK                                                      0xff000000 
#Define MF_MENUBARBREAK                                              0x20 
#Define MF_MENUBREAK                                                 0x40 
#Define MF_MOUSESELECT                                               0x8000 
#Define MF_OWNERDRAW                                                 0x100 
#Define MF_POPUP                                                     0x10 
#Define MF_POSTMSGS                                                  0x4000000 
#Define MF_REMOVE                                                    0x1000 
#Define MF_RIGHTJUSTIFY                                              0x4000 
#Define MF_SENDMSGS                                                  0x2000000 
#Define MF_SEPARATOR                                                 0x800 
#Define MF_STRING                                                    0x0 
#Define MF_SYSMENU                                                   0x2000 
#Define MF_UNCHECKED                                                 0x0 
#Define MF_UNHILITE                                                  0x0 
#Define MF_USECHECKBITMAPS                                           0x200 
#Define MFS_CHECKED                                                  0x8 
#Define MFS_DEFAULT                                                  0x1000 
#Define MFS_DISABLED                                                 0x3 
#Define MFS_ENABLED                                                  0x0 
#Define MFS_GRAYED                                                   0x3 
#Define MFS_HILITE                                                   0x80 
#Define MFS_UNCHECKED                                                0x0 
#Define MFS_UNHILITE                                                 0x0 
#Define MFT_BITMAP                                                   0x4 
#Define MFT_MENUBARBREAK                                             0x20 
#Define MFT_MENUBREAK                                                0x40 
#Define MFT_OWNERDRAW                                                0x100 
#Define MFT_RADIOCHECK                                               0x200 
#Define MFT_RIGHTJUSTIFY                                             0x4000 
#Define MFT_RIGHTORDER                                               0x2000 
#Define MFT_SEPARATOR                                                0x800 
#Define MFT_STRING                                                   0x0 
#Define MIB_IPADDR_DELETED                                           0x0040 && Address is being deleted
#Define MIB_IPADDR_DISCONNECTED                                      0x0008 && Address is on disconnected interface
#Define MIB_IPADDR_DYNAMIC                                           0x0004 && Dynamic IP address
#Define MIB_IPADDR_PRIMARY                                           0x0001 && Primary IP address
#Define MIB_IPADDR_TRANSIENT                                         0x0080 && Transient address
#Define MIIM_BITMAP                                                  0x80 
#Define MIIM_CHECKMARKS                                              0x8 
#Define MIIM_DATA                                                    0x20 
#Define MIIM_FTYPE                                                   0x100 
#Define MIIM_ID                                                      0x2 
#Define MIIM_STATE                                                   0x1 
#Define MIIM_STRING                                                  0x40 
#Define MIIM_SUBMENU                                                 0x4 
#Define MIIM_TYPE                                                    0x10 
#Define MIM_APPLYTOSUBMENUS                                          0x80000000 
#Define MIM_BACKGROUND                                               0x2 
#Define MIM_CLOSE                                                    0x3c2 
#Define MIM_DATA                                                     0x3c3 
#Define MIM_ERROR                                                    0x3c5 
#Define MIM_HELPID                                                   0x4 
#Define MIM_LONGDATA                                                 0x3c4 
#Define MIM_LONGERROR                                                0x3c6 
#Define MIM_MAXHEIGHT                                                0x1 
#Define MIM_MENUDATA                                                 0x8 
#Define MIM_MOREDATA                                                 0x3cc 
#Define MIM_OPEN                                                     0x3c1 
#Define MIM_STYLE                                                    0x10 
#Define MK_ALT                                                       0x20 
#Define MK_CONTROL                                                   0x8 
#Define MK_ICON                                                      0x1000 
#Define MK_LBUTTON                                                   0x1 
#Define MK_MBUTTON                                                   0x10 
#Define MK_RBUTTON                                                   0x2 
#Define MK_SHIFT                                                     0x4 
#Define MK_XBUTTON1                                                  0x20 
#Define MK_XBUTTON2                                                  0x40 
#Define MNS_AUTODISMISS                                              0x10000000 
#Define MNS_CHECKORBMP                                               0x4000000 
#Define MNS_DRAGDROP                                                 0x20000000 
#Define MNS_MODELESS                                                 0x40000000 
#Define MNS_NOCHECK                                                  0x80000000 
#Define MNS_NOTIFYBYPOS                                              0x8000000 
#Define MONITOR_DEFAULTTONEAREST                                     0x2 
#Define MONITOR_DEFAULTTONULL                                        0x0 
#Define MONITOR_DEFAULTTOPRIMARY                                     0x1 
#Define MONTHCAL_CLASSA                                              "SysMonthCal32"
#Define MONTHCAL_CLASSW                                              "SysMonthCal32"
#Define MSGF_COMMCTRL_BEGINDRAG                                      0x4200 
#Define MSGF_COMMCTRL_DRAGSELECT                                     0x4202 
#Define MSGF_COMMCTRL_SIZEHEADER                                     0x4201 
#Define MSGF_COMMCTRL_TOOLBARCUST                                    0x4203 
#Define MSGF_DDEMGR                                                  0x8001 
#Define MSGF_DIALOGBOX                                               0 
#Define MSGF_MAINLOOP                                                8 
#Define MSGF_MAX                                                     8 
#Define MSGF_MENU                                                    2 
#Define MSGF_MESSAGEBOX                                              1 
#Define MSGF_MOVE                                                    3 
#Define MSGF_NEXTWINDOW                                              6 
#Define MSGF_SCROLLBAR                                               5 
#Define MSGF_SIZE                                                    4 
#Define MSGF_USER                                                    4096 
#Define NM_CLICK                                                     -2 
#Define NM_CUSTOMDRAW                                                -12
#Define NM_DBLCLICK                                                  -3 
#Define NM_FIRST                                                     0 
#Define NM_RCLICK                                                    -5 
#Define NM_RDBLCLK                                                   -6 
#Define NM_RELEASEDCAPTURE                                           -16 
#Define NO_ERROR                                                     0 

#Define NODE_INVALID	0
#Define NODE_ELEMENT	1
#Define NODE_ATTRIBUTE	2
#Define NODE_TEXT	3
#Define NODE_CDATA_SECTION	4
#Define NODE_ENTITY_REFERENCE	5
#Define NODE_PROCESSING_INSTRUCTION	7
#Define NODE_COMMENT	8
#Define NODE_DOCUMENT	9
#Define NODE_DOCUMENT_TYPE	10
#Define NODE_DOCUMENT_FRAGMENT	11
#Define NODE_NOTATION	12

#Define NTDDI_LONGHORN                                               06000000 && NTDDI_VISTA 
#Define NTDDI_VISTA                                                  06000000 && NTDDI_WIN6
#Define NTDDI_VISTASP1                                               06000100 && NTDDI_WIN6SP1 
#Define NTDDI_VISTASP2                                               06000200 && NTDDI_WIN6SP2 
#Define NTDDI_VISTASP3                                               06000300 && NTDDI_WIN6SP3 
#Define NTDDI_VISTASP4                                               06000400 && NTDDI_WIN6SP4 
#Define NTDDI_WIN2K                                                  05000000 && NTDDI version constants
#Define NTDDI_WIN2KSP1                                               05000100 && http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=2095548
#Define NTDDI_WIN2KSP2                                               05000200 
#Define NTDDI_WIN2KSP3                                               05000300 
#Define NTDDI_WIN2KSP4                                               05000400 
#Define NTDDI_WIN6                                                   06000000 
#Define NTDDI_WIN6SP1                                                06000100 
#Define NTDDI_WIN6SP2                                                06000200 
#Define NTDDI_WIN6SP3                                                06000300 
#Define NTDDI_WIN6SP4                                                06000400 
#Define NTDDI_WINXP                                                  05010000 
#Define NTDDI_WINXPSP1                                               05010100 
#Define NTDDI_WINXPSP2                                               05010200 
#Define NTDDI_WINXPSP3                                               05010300 
#Define NTDDI_WINXPSP4                                               05010400 
#Define NTDDI_WS03                                                   05020000 
#Define NTDDI_WS03SP1                                                05020100 
#Define NTDDI_WS03SP2                                                05020200 
#Define NTDDI_WS03SP3                                                05020300 
#Define NTDDI_WS03SP4                                                05020400 
#Define NTDDI_WS08                                                   06000100 && NTDDI_WIN6SP1 
#Define NTDDI_WS08SP2                                                06000200 && NTDDI_WIN6SP2 
#Define NTDDI_WS08SP3                                                06000300 && NTDDI_WIN6SP3 
#Define NTDDI_WS08SP4                                                06000400 && NTDDI_WIN6SP4 
#Define ODA_DRAWENTIRE                                               0x1 
#Define ODA_FOCUS                                                    0x4 
#Define ODA_SELECT                                                   0x2 
#Define ODS_CHECKED                                                  0x8 
#Define ODS_COMBOBOXEDIT                                             0x1000 
#Define ODS_DEFAULT                                                  0x20 
#Define ODS_DISABLED                                                 0x4 
#Define ODS_FOCUS                                                    0x10 
#Define ODS_GRAYED                                                   0x2 
#Define ODS_HOTLIGHT                                                 0x40 
#Define ODS_INACTIVE                                                 0x80 
#Define ODS_NOACCEL                                                  0x100 
#Define ODS_NOFOCUSRECT                                              0x200 
#Define ODS_SELECTED                                                 0x1 
#Define ODT_BUTTON                                                   4 
#Define ODT_COMBOBOX                                                 3 
#Define ODT_HEADER                                                   100 
#Define ODT_LISTBOX                                                  2 
#Define ODT_LISTVIEW                                                 102 
#Define ODT_MENU                                                     1 
#Define ODT_STATIC                                                   5 
#Define ODT_TAB                                                      101 
#Define OEM_CHARSET                                                  255 

#Define OFN_ALLOWMULTISELECT                                         0x200
#Define OFN_CREATEPROMPT                                             0x2000
#Define OFN_DONTADDTORECENT                                          0x2000000
#Define OFN_ENABLEHOOK                                               0x20
#Define OFN_ENABLEINCLUDENOTIFY                                      0x400000
#Define OFN_ENABLESIZING                                             0x800000
#Define OFN_ENABLETEMPLATE                                           0x40
#Define OFN_ENABLETEMPLATEHANDLE                                     0x80
#Define OFN_EX_NOPLACESBAR                                           0x1
#Define OFN_EXPLORER                                                 0x80000
#Define OFN_EXTENSIONDIFFERENT                                       0x400
#Define OFN_FILEMUSTEXIST                                            0x1000
#Define OFN_FORCESHOWHIDDEN                                          0x10000000
#Define OFN_HIDEREADONLY                                             0x4
#Define OFN_LONGNAMES                                                0x200000
#Define OFN_NOCHANGEDIR                                              0x8
#Define OFN_NODEREFERENCELINKS                                       0x100000
#Define OFN_NOLONGNAMES                                              0x40000
#Define OFN_NONETWORKBUTTON                                          0x20000
#Define OFN_NOREADONLYRETURN                                         0x8000
#Define OFN_NOTESTFILECREATE                                         0x10000
#Define OFN_NOVALIDATE                                               0x100
#Define OFN_OVERWRITEPROMPT                                          0x2
#Define OFN_PATHMUSTEXIST                                            0x800
#Define OFN_READONLY                                                 0x1
#Define OFN_SHAREAWARE                                               0x4000
#Define OFN_SHAREFALLTHROUGH                                         2
#Define OFN_SHARENOWARN                                              1
#Define OFN_SHAREWARN                                                0
#Define OFN_SHOWHELP                                                 0x10
#Define OFN_USEMONIKERS                                              0x1000000

#Define OPEN_ALWAYS                                                  4 
#Define OPEN_EXISTING                                                3 
#Define OUT_DEFAULT_PRECIS                                           0 
#Define OUT_OUTLINE_PRECIS                                           8 
#Define PBM_DELTAPOS                                                 0x403 
#Define PBM_GETPOS                                                   0x408 
#Define PBM_GETRANGE                                                 0x407 
#Define PBM_SETBARCOLOR                                              0x409 
#Define PBM_SETBKCOLOR                                               0x2001 
#Define PBM_SETMARQUEE                                               0x40a 
#Define PBM_SETPOS                                                   0x402 
#Define PBM_SETRANGE                                                 0x401 
#Define PBM_SETRANGE32                                               0x406 
#Define PBM_SETSTATE                                                 0x410 
#Define PBM_SETSTEP                                                  0x404 
#Define PBM_STEPIT                                                   0x405 
#Define PBS_MARQUEE                                                  0x8 && Comctl32.dll version 6
#Define PBS_SMOOTH                                                   0x1 && Comctl32.dll Version 4.7 or later
#Define PBS_VERTICAL                                                 0x4 && Comctl32.dll Version 4.7 or later
#Define PBST_ERROR                                                   0x0002 
#Define PBST_NORMAL                                                  0x0001 
#Define PBST_PAUSED                                                  0x0003 
#Define PICTYPE_BITMAP                                               1 
#Define PICTYPE_ENHMETAFILE                                          4 
#Define PICTYPE_ICON                                                 3 
#Define PICTYPE_METAFILE                                             2 
#Define PICTYPE_NONE                                                 0 
#Define PICTYPE_UNINITIALIZED                                        -1 
#Define PROGRESS_CLASSA                                              "msctls_progress32" 
#Define PROGRESS_CLASSW                                              "msctls_progress32" 
#Define PROOF_QUALITY                                                2 
#Define PS_SOLID                                                     0 

#Define pshHelp                                                      0x40E

#Define RBS_AUTOSIZE                                                 0x2000 
#Define RBS_BANDBORDERS                                              0x400 
#Define RBS_DBLCLKTOGGLE                                             0x8000 
#Define RBS_FIXEDORDER                                               0x800 
#Define RBS_REGISTERDROP                                             0x1000 
#Define RBS_TOOLTIPS                                                 0x100 
#Define RBS_VARHEIGHT                                                0x200 
#Define RBS_VERTICALGRIPPER                                          0x4000 
#Define RBSTR_CHANGERECT                                             0x2 
#Define RBSTR_PREFERNOLINEBREAK                                      0x1 
#Define RDW_ALLCHILDREN                                              0x80 
#Define RDW_ERASE                                                    0x4 
#Define RDW_ERASENOW                                                 0x200 
#Define RDW_FRAME                                                    0x400 
#Define RDW_INTERNALPAINT                                            0x2 
#Define RDW_INVALIDATE                                               0x1 
#Define RDW_NOCHILDREN                                               0x40 
#Define RDW_NOERASE                                                  0x20 
#Define RDW_NOFRAME                                                  0x800 
#Define RDW_NOINTERNALPAINT                                          0x10 
#Define RDW_UPDATENOW                                                0x100 
#Define RDW_VALIDATE                                                 0x8 
#Define READ_CONTROL                                                 0x20000 
#Define REG_BINARY                                                   3 
#Define REG_DWORD                                                    4 
#Define REG_DWORD_BIG_ENDIAN                                         5 
#Define REG_DWORD_LITTLE_ENDIAN                                      4 
#Define REG_EXPAND_SZ                                                2 
#Define REG_MULTI_SZ                                                 7 
#Define REG_OPTION_BACKUP_RESTORE                                    4 
#Define REG_OPTION_NON_VOLATILE                                      0 
#Define REG_OPTION_VOLATILE                                          1 
#Define REG_SZ                                                       1 
#Define RPC_S_UUID_LOCAL_ONLY                                        1824 
#Define RT_ACCELERATOR                                               9 
#Define RT_ANICURSOR                                                 21 
#Define RT_ANIICON                                                   22 
#Define RT_BITMAP                                                    2 
#Define RT_CURSOR                                                    1 
#Define RT_DIALOG                                                    5 
#Define RT_DLGINCLUDE                                                17 
#Define RT_FONT                                                      8 
#Define RT_FONTDIR                                                   7 
#Define RT_GROUP_CURSOR                                              12 
#Define RT_GROUP_ICON                                                14 
#Define RT_HTML                                                      23 
#Define RT_ICON                                                      3 
#Define RT_MENU                                                      4 
#Define RT_MESSAGETABLE                                              11 
#Define RT_PLUGPLAY                                                  19 
#Define RT_RCDATA                                                    10 
#Define RT_STRING                                                    6 
#Define RT_VERSION                                                   16 
#Define RT_VXD                                                       20 
#Define RUSSIAN_CHARSET                                              204 
#Define S_OK                                                         0x0 
#Define SB_BOTH                                                      3 
#Define SB_BOTTOM                                                    7 
#Define SB_CONST_ALPHA                                               0x1 
#Define SB_CTL                                                       2 
#Define SB_ENDSCROLL                                                 8 
#Define SB_GETBORDERS                                                0x407 
#Define SB_GETICON                                                   0x414 
#Define SB_GETPARTS                                                  0x406 
#Define SB_GETRECT                                                   0x40a 
#Define SB_GETTEXTA                                                  0x402 
#Define SB_GETTEXTLENGTHA                                            0x403 
#Define SB_GETTEXTLENGTHW                                            0x40c 
#Define SB_GETTEXTW                                                  0x40d 
#Define SB_GETTIPTEXTA                                               0x412 
#Define SB_GETTIPTEXTW                                               0x413 
#Define SB_GETUNICODEFORMAT                                          0x2006 
#Define SB_GRAD_RECT                                                 0x10 
#Define SB_GRAD_TRI                                                  0x20 
#Define SB_HORZ                                                      0 
#Define SB_ISSIMPLE                                                  0x40e 
#Define SB_LEFT                                                      6 
#Define SB_LINEDOWN                                                  1 
#Define SB_LINELEFT                                                  0 
#Define SB_LINERIGHT                                                 1 
#Define SB_LINEUP                                                    0 
#Define SB_NONE                                                      0x0 
#Define SB_PAGEDOWN                                                  3 
#Define SB_PAGELEFT                                                  2 
#Define SB_PAGERIGHT                                                 3 
#Define SB_PAGEUP                                                    2 
#Define SB_PIXEL_ALPHA                                               0x2 
#Define SB_PREMULT_ALPHA                                             0x4 
#Define SB_RIGHT                                                     7 
#Define SB_SETBKCOLOR                                                0x2001 
#Define SB_SETICON                                                   0x40f 
#Define SB_SETMINHEIGHT                                              0x408 
#Define SB_SETPARTS                                                  0x404 
#Define SB_SETTEXTA                                                  0x401 
#Define SB_SETTEXTW                                                  0x40b 
#Define SB_SETTIPTEXTA                                               0x410 
#Define SB_SETTIPTEXTW                                               0x411 
#Define SB_SETUNICODEFORMAT                                          0x2005 
#Define SB_SIMPLE                                                    0x409 
#Define SB_SIMPLEID                                                  0xff 
#Define SB_THUMBPOSITION                                             4 
#Define SB_THUMBTRACK                                                5 
#Define SB_TOP                                                       6 
#Define SB_VERT                                                      1 
#Define SBARS_SIZEGRIP                                               0x100 
#Define SBARS_TOOLTIPS                                               0x800 
#Define SBM_ENABLE_ARROWS                                            0xE4 
#Define SBM_GETPOS                                                   0xE1 
#Define SBM_GETRANGE                                                 0xE3 
#Define SBM_GETSCROLLBARINFO                                         0xEB 
#Define SBM_GETSCROLLINFO                                            0xEA 
#Define SBM_SETPOS                                                   0xE0 
#Define SBM_SETRANGE                                                 0xE2 
#Define SBM_SETRANGEREDRAW                                           0xE6 
#Define SBM_SETSCROLLINFO                                            0xE9 
#Define SBS_BOTTOMALIGN                                              0x4 
#Define SBS_HORZ                                                     0x0 
#Define SBS_LEFTALIGN                                                0x2 
#Define SBS_RIGHTALIGN                                               0x4 
#Define SBS_SIZEBOX                                                  0x8 
#Define SBS_SIZEBOXBOTTOMRIGHTALIGN                                  0x4 
#Define SBS_SIZEBOXTOPLEFTALIGN                                      0x2 
#Define SBS_SIZEGRIP                                                 0x10 
#Define SBS_TOPALIGN                                                 0x2 
#Define SBS_VERT                                                     0x1 
#Define SBT_NOBORDERS                                                0x100 
#Define SBT_NOTABPARSING                                             0x800 
#Define SBT_OWNERDRAW                                                0x1000 
#Define SBT_POPOUT                                                   0x200 
#Define SBT_RTLREADING                                               0x400 
#Define SBT_TOOLTIPS                                                 0x800 
#Define SC_ARRANGE                                                   0xF110 
#Define SC_CLOSE                                                     0xF060 
#Define SC_CONTEXTHELP                                               0xF180 
#Define SC_DEFAULT                                                   0xF160 
#Define SC_DLG_FORCE_UI                                              0x4 
#Define SC_DLG_MINIMAL_UI                                            0x1 
#Define SC_DLG_NO_UI                                                 0x2 
#Define SC_ENUM_PROCESS_INFO                                         0 
#Define SC_FLAGS                                                     0x400 
#Define SC_FLAGS_STR                                                 "/sc" 
#Define SC_HOTKEY                                                    0xF150 
#Define SC_HSCROLL                                                   0xF080 
#Define SC_ICON                                                      0xF020 &&SC_MINIMIZE
#Define SC_KEYMENU                                                   0xF100 
#Define SC_MANAGER_ALL_ACCESS                                        0xF003F 
#Define SC_MANAGER_CONNECT                                           0x1 
#Define SC_MANAGER_CREATE_SERVICE                                    0x2 
#Define SC_MANAGER_ENUMERATE_SERVICE                                 0x4 
#Define SC_MANAGER_LOCK                                              0x8 
#Define SC_MANAGER_MODIFY_BOOT_CONFIG                                0x20 
#Define SC_MANAGER_QUERY_LOCK_STATUS                                 0x10 
#Define SC_MAXIMIZE                                                  0xF030 
#Define SC_MINIMIZE                                                  0xF020 
#Define SC_MONITORPOWER                                              0xF170 
#Define SC_MOUSEMENU                                                 0xF090 
#Define SC_MOVE                                                      0xF010 
#Define SC_NEXTWINDOW                                                0xF040 
#Define SC_PREVWINDOW                                                0xF050 
#Define SC_RESTORE                                                   0xF120 
#Define SC_SCREENSAVE                                                0xF140 
#Define SC_SEPARATOR                                                 0xF00F 
#Define SC_SIZE                                                      0xF000 
#Define SC_TASKLIST                                                  0xF130 
#Define SC_VSCROLL                                                   0xF070 
#Define SC_ZOOM                                                      0xF030 && SC_MAXIMIZE
#Define SECURITY_FLAG_IGNORE_UNKNOWN_CA                              0x100 
#Define SECURITY_FLAG_IGNORE_UNKNOWN_CA                              0x100 
#Define SEM_FAILCRITICALERRORS                                       0x1 
#Define SEM_NOALIGNMENTFAULTEXCEPT                                   0x4 
#Define SEM_NOGPFAULTERRORBOX                                        0x2 
#Define SEM_NOOPENFILEERRORBOX                                       0x8000 
#Define SERVICE_ALL_ACCESS                                           0xF01FF 
#Define SERVICE_AUTO_START                                           0x2 
#Define SERVICE_BOOT_START                                           0x0 
#Define SERVICE_CHANGE_CONFIG                                        0x2 
#Define SERVICE_CONFIG_DELAYED_AUTO_START_INFO                       3 
#Define SERVICE_CONFIG_DESCRIPTION                                   1 
#Define SERVICE_CONFIG_FAILURE_ACTIONS                               2 
#Define SERVICE_CONFIG_FAILURE_ACTIONS_FLAG                          4 
#Define SERVICE_CONFIG_PRESHUTDOWN_INFO                              7 
#Define SERVICE_CONFIG_REQUIRED_PRIVILEGES_INFO                      6 
#Define SERVICE_CONFIG_SERVICE_SID_INFO                              5 
#Define SERVICE_CONTINUE_PENDING                                     0x5 
#Define SERVICE_CONTROL_CONTINUE                                     0x3 
#Define SERVICE_CONTROL_DEVICEEVENT                                  0xB 
#Define SERVICE_CONTROL_HARDWAREPROFILECHANGE                        0xC 
#Define SERVICE_CONTROL_INTERROGATE                                  0x4 
#Define SERVICE_CONTROL_NETBINDADD                                   0x7 
#Define SERVICE_CONTROL_NETBINDDISABLE                               0xA 
#Define SERVICE_CONTROL_NETBINDENABLE                                0x9 
#Define SERVICE_CONTROL_NETBINDREMOVE                                0x8 
#Define SERVICE_CONTROL_PARAMCHANGE                                  0x6 
#Define SERVICE_CONTROL_PAUSE                                        0x2 
#Define SERVICE_CONTROL_POWEREVENT                                   0xD 
#Define SERVICE_CONTROL_SHUTDOWN                                     0x5 
#Define SERVICE_CONTROL_STOP                                         0x1 
#Define SERVICE_DEMAND_START                                         0x3 
#Define SERVICE_DISABLED                                             0x4 
#Define SERVICE_ENUMERATE_DEPENDENTS                                 0x8 
#Define SERVICE_ERROR_CRITICAL                                       0x3 
#Define SERVICE_ERROR_IGNORE                                         0x0 
#Define SERVICE_ERROR_NORMAL                                         0x1 
#Define SERVICE_ERROR_SEVERE                                         0x2 
#Define SERVICE_FILE_SYSTEM_DRIVER                                   0x2 
#Define SERVICE_INTERACTIVE_PROCESS                                  0x100 
#Define SERVICE_INTERROGATE                                          0x80 
#Define SERVICE_KERNEL_DRIVER                                        0x1 
#Define SERVICE_PAUSE_CONTINUE                                       0x40 
#Define SERVICE_PAUSE_PENDING                                        0x6 
#Define SERVICE_PAUSED                                               0x7 
#Define SERVICE_QUERY_CONFIG                                         0x1 
#Define SERVICE_RECOGNIZER_DRIVER                                    0x8 
#Define SERVICE_RUNNING                                              0x4 
#Define SERVICE_START                                                0x10 
#Define SERVICE_START_PENDING                                        0x2 
#Define SERVICE_STOP                                                 0x20 
#Define SERVICE_STOP_PENDING                                         0x3 
#Define SERVICE_STOPPED                                              0x1 
#Define SERVICE_SYSTEM_START                                         0x1 
#Define SERVICE_USER_DEFINED_CONTROL                                 0x100 
#Define SERVICE_WIN32_OWN_PROCESS                                    0x10 
#Define SERVICE_WIN32_SHARE_PROCESS                                  0x20 
#Define SHGFP_TYPE_CURRENT                                           0 && Return the folder's current path.
#Define SHGFP_TYPE_DEFAULT                                           1 && Return the folder's default path.
#Define SHIFTJIS_CHARSET                                             128 

#Define SHVIEW_THUMBNAIL 	0x702D	&& 1	THUMBNAILS
#Define SHVIEW_TILE 		0x702E	&& 2	TILES
#Define SHVIEW_ICON 		0x7029	&& 3	ICONS
#Define SHVIEW_LIST 		0x702B	&& 4	LIST
#Define SHVIEW_REPORT 		0x702C	&& 5	DETAILS

#Define SIF_ALL                                                      0x17 && BITOR(SIF_RANGE,SIF_PAGE,SIF_POS,SIF_TRACKPOS)
#Define SIF_DISABLENOSCROLL                                          0x8 
#Define SIF_PAGE                                                     0x2 
#Define SIF_POS                                                      0x4 
#Define SIF_RANGE                                                    0x1 
#Define SIF_TRACKPOS                                                 0x10 

#Define SIGDN_NORMALDISPLAY 				0x00000000
#Define SIGDN_PARENTRELATIVEPARSING			0x80018001
#Define SIGDN_PARENTRELATIVEFORADDRESSBAR	0x8007c001
#Define SIGDN_DESKTOPABSOLUTEPARSING		0x80028000
#Define SIGDN_PARENTRELATIVEEDITING			0x80031001
#Define SIGDN_DESKTOPABSOLUTEEDITING		0x8004c000
#Define SIGDN_FILESYSPATH					0x80058000
#Define SIGDN_URL							0x80068000

#Define SM_ARRANGE                                                   56 
#Define SM_CLEANBOOT                                                 67 
#Define SM_CMETRICS                                                  44 
#Define SM_CMONITORS                                                 80 
#Define SM_CMOUSEBUTTONS                                             43 
#Define SM_CXBORDER                                                  5 
#Define SM_CXCURSOR                                                  13 
#Define SM_CXDLGFRAME                                                7 
#Define SM_CXDOUBLECLK                                               36 
#Define SM_CXDRAG                                                    68 
#Define SM_CXEDGE                                                    45 
#Define SM_CXFIXEDFRAME                                              7 && SM_CXDLGFRAME
#Define SM_CXFRAME                                                   32 
#Define SM_CXFULLSCREEN                                              16 
#Define SM_CXHSCROLL                                                 21 
#Define SM_CXHTHUMB                                                  10 
#Define SM_CXICON                                                    11 
#Define SM_CXICONSPACING                                             38 
#Define SM_CXMAXIMIZED                                               61 
#Define SM_CXMAXTRACK                                                59 
#Define SM_CXMENUCHECK                                               71 
#Define SM_CXMENUSIZE                                                54 
#Define SM_CXMIN                                                     28 
#Define SM_CXMINIMIZED                                               57 
#Define SM_CXMINSPACING                                              47 
#Define SM_CXMINTRACK                                                34 
#Define SM_CXSCREEN                                                  0 
#Define SM_CXSIZE                                                    30 
#Define SM_CXSIZEFRAME                                               32 && SM_CXFRAME
#Define SM_CXSMICON                                                  49 
#Define SM_CXSMSIZE                                                  52 
#Define SM_CXVIRTUALSCREEN                                           78 
#Define SM_CXVSCROLL                                                 2 
#Define SM_CYBORDER                                                  6 
#Define SM_CYCAPTION                                                 4 
#Define SM_CYCURSOR                                                  14 
#Define SM_CYDLGFRAME                                                8 
#Define SM_CYDOUBLECLK                                               37 
#Define SM_CYDRAG                                                    69 
#Define SM_CYEDGE                                                    46 
#Define SM_CYFIXEDFRAME                                              8 && SM_CYDLGFRAME
#Define SM_CYFRAME                                                   33 
#Define SM_CYFULLSCREEN                                              17 
#Define SM_CYHSCROLL                                                 3 
#Define SM_CYICON                                                    12 
#Define SM_CYICONSPACING                                             39 
#Define SM_CYKANJIWINDOW                                             18 
#Define SM_CYMAXIMIZED                                               62 
#Define SM_CYMAXTRACK                                                60 
#Define SM_CYMENU                                                    15 
#Define SM_CYMENUCHECK                                               72 
#Define SM_CYMENUSIZE                                                55 
#Define SM_CYMIN                                                     29 
#Define SM_CYMINIMIZED                                               58 
#Define SM_CYMINSPACING                                              48 
#Define SM_CYMINTRACK                                                35 
#Define SM_CYSCREEN                                                  1 
#Define SM_CYSIZE                                                    31 
#Define SM_CYSIZEFRAME                                               33 && SM_CYFRAME
#Define SM_CYSMCAPTION                                               51 
#Define SM_CYSMICON                                                  50 
#Define SM_CYSMSIZE                                                  53 
#Define SM_CYVIRTUALSCREEN                                           79 
#Define SM_CYVSCROLL                                                 20 
#Define SM_CYVTHUMB                                                  9 
#Define SM_DBCSENABLED                                               42 
#Define SM_DEBUG                                                     22 
#Define SM_FOCUS_TYPE_LM_DOMAIN                                      2 
#Define SM_FOCUS_TYPE_LM_SERVER                                      5 
#Define SM_FOCUS_TYPE_NT_DOMAIN                                      1 
#Define SM_FOCUS_TYPE_NT_SERVER                                      4 
#Define SM_FOCUS_TYPE_UNKNOWN_DOMAIN                                 3 
#Define SM_FOCUS_TYPE_UNKNOWN_SERVER                                 7 
#Define SM_FOCUS_TYPE_WFW_SERVER                                     6 
#Define SM_GETCURFOCUSA                                              2027 && (WM_USER+1003)
#Define SM_GETCURFOCUSW                                              2028 && (WM_USER+1004)
#Define SM_GETOPTIONS                                                2029 && (WM_USER+1005)
#Define SM_GETSELCOUNT                                               2024 && (WM_USER+1000)
#Define SM_GETSERVERSELA                                             2025 && (WM_USER+1001)
#Define SM_GETSERVERSELW                                             2026 && (WM_USER+1002)
#Define SM_IMMENABLED                                                82 
#Define SM_MENUDROPALIGNMENT                                         40 
#Define SM_MIDEASTENABLED                                            74 
#Define SM_MOUSEPRESENT                                              19 
#Define SM_MOUSEWHEELPRESENT                                         75 
#Define SM_NETWORK                                                   63 
#Define SM_PENWINDOWS                                                41 
#Define SM_REMOTESESSION                                             0x1000 
#Define SM_RESERVED1                                                 24 
#Define SM_RESERVED2                                                 25 
#Define SM_RESERVED3                                                 26 
#Define SM_RESERVED4                                                 27 
#Define SM_SAMEDISPLAYFORMAT                                         81 
#Define SM_SECURE                                                    44 
#Define SM_SHOWSOUNDS                                                70 
#Define SM_SLOWMACHINE                                               73 
#Define SM_SWAPBUTTON                                                23 
#Define SM_XVIRTUALSCREEN                                            76 
#Define SM_YVIRTUALSCREEN                                            77 
#Define SPI_GETACCESSTIMEOUT                                         60 
#Define SPI_GETACTIVEWINDOWTRACKING                                  0x1000 
#Define SPI_GETACTIVEWNDTRKTIMEOUT                                   0x2002 
#Define SPI_GETACTIVEWNDTRKZORDER                                    0x100C 
#Define SPI_GETANIMATION                                             72 
#Define SPI_GETBEEP                                                  1 
#Define SPI_GETBLOCKSENDINPUTRESETS                                  0x1026 
#Define SPI_GETBORDER                                                5 
#Define SPI_GETCARETWIDTH                                            0x2006 
#Define SPI_GETCOMBOBOXANIMATION                                     0x1004 
#Define SPI_GETCURSORSHADOW                                          0x101A 
#Define SPI_GETDEFAULTINPUTLANG                                      89 
#Define SPI_GETDESKWALLPAPER                                         115 
#Define SPI_GETDRAGFULLWINDOWS                                       38 
#Define SPI_GETDROPSHADOW                                            0x1024 
#Define SPI_GETFASTTASKSWITCH                                        35 
#Define SPI_GETFILTERKEYS                                            50 
#Define SPI_GETFLATMENU                                              0x1022 
#Define SPI_GETFOCUSBORDERHEIGHT                                     0x2010 
#Define SPI_GETFOCUSBORDERWIDTH                                      0x200E 
#Define SPI_GETFONTSMOOTHING                                         74 
#Define SPI_GETFONTSMOOTHINGCONTRAST                                 0x200C 
#Define SPI_GETFONTSMOOTHINGORIENTATION                              0x2012 
#Define SPI_GETFONTSMOOTHINGTYPE                                     0x200A 
#Define SPI_GETFOREGROUNDFLASHCOUNT                                  0x2004 
#Define SPI_GETFOREGROUNDLOCKTIMEOUT                                 0x2000 
#Define SPI_GETGRADIENTCAPTIONS                                      0x1008 
#Define SPI_GETGRIDGRANULARITY                                       18 
#Define SPI_GETHIGHCONTRAST                                          66 
#Define SPI_GETHOTTRACKING                                           0x100E 
#Define SPI_GETICONMETRICS                                           45 
#Define SPI_GETICONTITLELOGFONT                                      31 
#Define SPI_GETICONTITLEWRAP                                         25 
#Define SPI_GETKEYBOARDCUES                                          0x100A 
#Define SPI_GETKEYBOARDDELAY                                         22 
#Define SPI_GETKEYBOARDPREF                                          68 
#Define SPI_GETKEYBOARDSPEED                                         10 
#Define SPI_GETLISTBOXSMOOTHSCROLLING                                0x1006 
#Define SPI_GETLOWPOWERACTIVE                                        83 
#Define SPI_GETLOWPOWERTIMEOUT                                       79 
#Define SPI_GETMENUANIMATION                                         0x1002 
#Define SPI_GETMENUDROPALIGNMENT                                     27 
#Define SPI_GETMENUFADE                                              0x1012 
#Define SPI_GETMENUSHOWDELAY                                         106 
#Define SPI_GETMENUUNDERLINES                                        0x100A 
#Define SPI_GETMINIMIZEDMETRICS                                      43 
#Define SPI_GETMOUSE                                                 3 
#Define SPI_GETMOUSECLICKLOCK                                        0x101E 
#Define SPI_GETMOUSECLICKLOCKTIME                                    0x2008 
#Define SPI_GETMOUSEHOVERHEIGHT                                      100 
#Define SPI_GETMOUSEHOVERTIME                                        102 
#Define SPI_GETMOUSEHOVERWIDTH                                       98 
#Define SPI_GETMOUSEKEYS                                             54 
#Define SPI_GETMOUSESONAR                                            0x101C 
#Define SPI_GETMOUSESPEED                                            112 
#Define SPI_GETMOUSETRAILS                                           94 
#Define SPI_GETMOUSEVANISH                                           0x1020 
#Define SPI_GETNONCLIENTMETRICS                                      41 
#Define SPI_GETPOWEROFFACTIVE                                        84 
#Define SPI_GETPOWEROFFTIMEOUT                                       80 
#Define SPI_GETSCREENREADER                                          70 
#Define SPI_GETSCREENSAVEACTIVE                                      16 
#Define SPI_GETSCREENSAVERRUNNING                                    114 
#Define SPI_GETSCREENSAVETIMEOUT                                     14 
#Define SPI_GETSELECTIONFADE                                         0x1014 
#Define SPI_GETSERIALKEYS                                            62 
#Define SPI_GETSHOWIMEUI                                             110 
#Define SPI_GETSHOWSOUNDS                                            56 
#Define SPI_GETSNAPTODEFBUTTON                                       95 
#Define SPI_GETSOUNDSENTRY                                           64 
#Define SPI_GETSTICKYKEYS                                            58 
#Define SPI_GETTOGGLEKEYS                                            52 
#Define SPI_GETTOOLTIPANIMATION                                      0x1016 
#Define SPI_GETTOOLTIPFADE                                           0x1018 
#Define SPI_GETUIEFFECTS                                             0x103E 
#Define SPI_GETWHEELSCROLLLINES                                      104 
#Define SPI_GETWINDOWSEXTENSION                                      92 
#Define SPI_GETWORKAREA                                              48 
#Define SPI_ICONHORIZONTALSPACING                                    13 
#Define SPI_ICONVERTICALSPACING                                      24 
#Define SPI_LANGDRIVER                                               12 
#Define SPI_SCREENSAVERRUNNING                                       97 
#Define SPI_SETACCESSTIMEOUT                                         61 
#Define SPI_SETACTIVEWINDOWTRACKING                                  0x1001 
#Define SPI_SETACTIVEWNDTRKTIMEOUT                                   0x2003 
#Define SPI_SETACTIVEWNDTRKZORDER                                    0x100D 
#Define SPI_SETANIMATION                                             73 
#Define SPI_SETBEEP                                                  2 
#Define SPI_SETBLOCKSENDINPUTRESETS                                  0x1027 
#Define SPI_SETBORDER                                                6 
#Define SPI_SETCARETWIDTH                                            0x2007 
#Define SPI_SETCOMBOBOXANIMATION                                     0x1005 
#Define SPI_SETCURSORS                                               87 
#Define SPI_SETCURSORSHADOW                                          0x101B 
#Define SPI_SETDEFAULTINPUTLANG                                      90 
#Define SPI_SETDESKPATTERN                                           21 
#Define SPI_SETDESKWALLPAPER                                         20 
#Define SPI_SETDOUBLECLICKTIME                                       32 
#Define SPI_SETDOUBLECLKHEIGHT                                       30 
#Define SPI_SETDOUBLECLKWIDTH                                        29 
#Define SPI_SETDRAGFULLWINDOWS                                       37 
#Define SPI_SETDRAGHEIGHT                                            77 
#Define SPI_SETDRAGWIDTH                                             76 
#Define SPI_SETDROPSHADOW                                            0x1025 
#Define SPI_SETFASTTASKSWITCH                                        36 
#Define SPI_SETFILTERKEYS                                            51 
#Define SPI_SETFLATMENU                                              0x1023 
#Define SPI_SETFOCUSBORDERHEIGHT                                     0x2011 
#Define SPI_SETFOCUSBORDERWIDTH                                      0x200F 
#Define SPI_SETFONTSMOOTHING                                         75 
#Define SPI_SETFONTSMOOTHINGCONTRAST                                 0x200D 
#Define SPI_SETFONTSMOOTHINGORIENTATION                              0x2013 
#Define SPI_SETFONTSMOOTHINGTYPE                                     0x200B 
#Define SPI_SETFOREGROUNDFLASHCOUNT                                  0x2005 
#Define SPI_SETFOREGROUNDLOCKTIMEOUT                                 0x2001 
#Define SPI_SETGRADIENTCAPTIONS                                      0x1009 
#Define SPI_SETGRIDGRANULARITY                                       19 
#Define SPI_SETHANDHELD                                              78 
#Define SPI_SETHIGHCONTRAST                                          67 
#Define SPI_SETHOTTRACKING                                           0x100F 
#Define SPI_SETICONMETRICS                                           46 
#Define SPI_SETICONS                                                 88 
#Define SPI_SETICONTITLELOGFONT                                      34 
#Define SPI_SETICONTITLEWRAP                                         26 
#Define SPI_SETKEYBOARDCUES                                          0x100B 
#Define SPI_SETKEYBOARDDELAY                                         23 
#Define SPI_SETKEYBOARDPREF                                          69 
#Define SPI_SETKEYBOARDSPEED                                         11 
#Define SPI_SETLANGTOGGLE                                            91 
#Define SPI_SETLISTBOXSMOOTHSCROLLING                                0x1007 
#Define SPI_SETLOWPOWERACTIVE                                        85 
#Define SPI_SETLOWPOWERTIMEOUT                                       81 
#Define SPI_SETMENUANIMATION                                         0x1003 
#Define SPI_SETMENUDROPALIGNMENT                                     28 
#Define SPI_SETMENUFADE                                              0x1013 
#Define SPI_SETMENUSHOWDELAY                                         107 
#Define SPI_SETMENUUNDERLINES                                        0x100B 
#Define SPI_SETMINIMIZEDMETRICS                                      44 
#Define SPI_SETMOUSE                                                 4 
#Define SPI_SETMOUSEBUTTONSWAP                                       33 
#Define SPI_SETMOUSECLICKLOCK                                        0x101F 
#Define SPI_SETMOUSECLICKLOCKTIME                                    0x2009 
#Define SPI_SETMOUSEHOVERHEIGHT                                      101 
#Define SPI_SETMOUSEHOVERTIME                                        103 
#Define SPI_SETMOUSEHOVERWIDTH                                       99 
#Define SPI_SETMOUSEKEYS                                             55 
#Define SPI_SETMOUSESONAR                                            0x101D 
#Define SPI_SETMOUSESPEED                                            113 
#Define SPI_SETMOUSETRAILS                                           93 
#Define SPI_SETMOUSEVANISH                                           0x1021 
#Define SPI_SETNONCLIENTMETRICS                                      42 
#Define SPI_SETPENWINDOWS                                            49 
#Define SPI_SETPOWEROFFACTIVE                                        86 
#Define SPI_SETPOWEROFFTIMEOUT                                       82 
#Define SPI_SETSCREENREADER                                          71 
#Define SPI_SETSCREENSAVEACTIVE                                      17 
#Define SPI_SETSCREENSAVERRUNNING                                    97 
#Define SPI_SETSCREENSAVETIMEOUT                                     15 
#Define SPI_SETSELECTIONFADE                                         0x1015 
#Define SPI_SETSERIALKEYS                                            63 
#Define SPI_SETSHOWIMEUI                                             111 
#Define SPI_SETSHOWSOUNDS                                            57 
#Define SPI_SETSNAPTODEFBUTTON                                       96 
#Define SPI_SETSOUNDSENTRY                                           65 
#Define SPI_SETSTICKYKEYS                                            59 
#Define SPI_SETTOGGLEKEYS                                            53 
#Define SPI_SETTOOLTIPANIMATION                                      0x1017 
#Define SPI_SETTOOLTIPFADE                                           0x1019 
#Define SPI_SETUIEFFECTS                                             0x103F 
#Define SPI_SETWHEELSCROLLLINES                                      105 
#Define SPI_SETWORKAREA                                              47 

#Define SRCCOPY                                                      0xcc0020

#Define SS_BITMAP                                                    0xE 
#Define SS_BLACKFRAME                                                0x7 
#Define SS_BLACKRECT                                                 0x4 
#Define SS_CENTER                                                    0x1 
#Define SS_CENTERIMAGE                                               0x200 
#Define SS_ELLIPSISMASK                                              0xC000 
#Define SS_ENDELLIPSIS                                               0x4000 
#Define SS_ENHMETAFILE                                               0xF 
#Define SS_ETCHEDFRAME                                               0x12 
#Define SS_ETCHEDHORZ                                                0x10 
#Define SS_ETCHEDVERT                                                0x11 
#Define SS_GRAYFRAME                                                 0x8 
#Define SS_GRAYRECT                                                  0x5 
#Define SS_ICON                                                      0x3 
#Define SS_LEFT                                                      0x0 
#Define SS_LEFTNOWORDWRAP                                            0xC 
#Define SS_LEVEL_VERSION                                             0 
#Define SS_MAJOR_VERSION                                             7 
#Define SS_MINIMUM_VERSION                                           "7.00.00.0000" 
#Define SS_MINOR_VERSION                                             0 
#Define SS_NOPREFIX                                                  0x80 
#Define SS_NOTIFY                                                    0x100 
#Define SS_OWNERDRAW                                                 0xD 
#Define SS_PATHELLIPSIS                                              0x8000 
#Define SS_REALSIZECONTROL                                           0x40 
#Define SS_REALSIZEIMAGE                                             0x800 
#Define SS_RIGHT                                                     0x2 
#Define SS_RIGHTJUST                                                 0x400 
#Define SS_SIMPLE                                                    0xB 
#Define SS_SUNKEN                                                    0x1000 
#Define SS_TYPEMASK                                                  0x1F 
#Define SS_USERITEM                                                  0xA 
#Define SS_WHITEFRAME                                                0x9 
#Define SS_WHITERECT                                                 0x6 
#Define SS_WORDELLIPSIS                                              0xC000 
#Define STANDARD_RIGHTS_ALL                                          0x1F0000 
#Define STANDARD_RIGHTS_EXECUTE                                      0x20000 
#Define STANDARD_RIGHTS_READ                                         0x20000 
#Define STANDARD_RIGHTS_REQUIRED                                     0xF0000 
#Define STANDARD_RIGHTS_WRITE                                        0x20000 
#Define STATUSCLASSNAMEA                                             "msctls_statusbar32" 
#Define STATUSCLASSNAMEW                                             "msctls_statusbar32" 
#Define SUBLANG_ARABIC_ALGERIA                                       0x5 
#Define SUBLANG_ARABIC_BAHRAIN                                       0xf 
#Define SUBLANG_ARABIC_EGYPT                                         0x3 
#Define SUBLANG_ARABIC_IRAQ                                          0x2 
#Define SUBLANG_ARABIC_JORDAN                                        0xb 
#Define SUBLANG_ARABIC_KUWAIT                                        0xd 
#Define SUBLANG_ARABIC_LEBANON                                       0xc 
#Define SUBLANG_ARABIC_LIBYA                                         0x4 
#Define SUBLANG_ARABIC_MOROCCO                                       0x6 
#Define SUBLANG_ARABIC_OMAN                                          0x8 
#Define SUBLANG_ARABIC_QATAR                                         0x10 
#Define SUBLANG_ARABIC_SAUDI_ARABIA                                  0x1 
#Define SUBLANG_ARABIC_SYRIA                                         0xa 
#Define SUBLANG_ARABIC_TUNISIA                                       0x7 
#Define SUBLANG_ARABIC_UAE                                           0xe 
#Define SUBLANG_ARABIC_YEMEN                                         0x9 
#Define SUBLANG_AZERI_CYRILLIC                                       0x2 
#Define SUBLANG_AZERI_LATIN                                          0x1 
#Define SUBLANG_CHINESE_HONGKONG                                     0x3 
#Define SUBLANG_CHINESE_MACAU                                        0x5 
#Define SUBLANG_CHINESE_SIMPLIFIED                                   0x2 
#Define SUBLANG_CHINESE_SINGAPORE                                    0x4 
#Define SUBLANG_CHINESE_TRADITIONAL                                  0x1 
#Define SUBLANG_CROATIAN_BOSNIA_HERZEGOVINA_LATIN                    0x04 
#Define SUBLANG_CROATIAN_CROATIA                                     0x01 
#Define SUBLANG_DEFAULT                                              0x1 
#Define SUBLANG_DUTCH                                                0x1 
#Define SUBLANG_DUTCH_BELGIAN                                        0x2 
#Define SUBLANG_ENGLISH_AUS                                          0x3 
#Define SUBLANG_ENGLISH_BELIZE                                       0xa 
#Define SUBLANG_ENGLISH_CAN                                          0x4 
#Define SUBLANG_ENGLISH_CARIBBEAN                                    0x9 
#Define SUBLANG_ENGLISH_EIRE                                         0x6 
#Define SUBLANG_ENGLISH_JAMAICA                                      0x8 
#Define SUBLANG_ENGLISH_NZ                                           0x5 
#Define SUBLANG_ENGLISH_PHILIPPINES                                  0xd 
#Define SUBLANG_ENGLISH_SOUTH_AFRICA                                 0x7 
#Define SUBLANG_ENGLISH_TRINIDAD                                     0xb 
#Define SUBLANG_ENGLISH_UK                                           0x2 
#Define SUBLANG_ENGLISH_US                                           0x1 
#Define SUBLANG_ENGLISH_ZIMBABWE                                     0xc 
#Define SUBLANG_FRENCH                                               0x1 
#Define SUBLANG_FRENCH_BELGIAN                                       0x2 
#Define SUBLANG_FRENCH_CANADIAN                                      0x3 
#Define SUBLANG_FRENCH_LUXEMBOURG                                    0x5 
#Define SUBLANG_FRENCH_MONACO                                        0x6 
#Define SUBLANG_FRENCH_SWISS                                         0x4 
#Define SUBLANG_GERMAN                                               0x1 
#Define SUBLANG_GERMAN_AUSTRIAN                                      0x3 
#Define SUBLANG_GERMAN_LIECHTENSTEIN                                 0x5 
#Define SUBLANG_GERMAN_LUXEMBOURG                                    0x4 
#Define SUBLANG_GERMAN_SWISS                                         0x2 
#Define SUBLANG_ITALIAN                                              0x1 
#Define SUBLANG_ITALIAN_SWISS                                        0x2 
#Define SUBLANG_KASHMIRI_INDIA                                       0x2 
#Define SUBLANG_KOREAN                                               0x1 
#Define SUBLANG_LITHUANIAN                                           0x1 
#Define SUBLANG_MALAY_BRUNEI_DARUSSALAM                              0x2 
#Define SUBLANG_MALAY_MALAYSIA                                       0x1 
#Define SUBLANG_NEPALI_INDIA                                         0x2 
#Define SUBLANG_NEUTRAL                                              0x0 
#Define SUBLANG_NORWEGIAN_BOKMAL                                     0x1 
#Define SUBLANG_NORWEGIAN_NYNORSK                                    0x2 
#Define SUBLANG_PORTUGUESE                                           0x2 
#Define SUBLANG_PORTUGUESE_BRAZILIAN                                 0x1 
#Define SUBLANG_PORTUGUESE_PORTUGAL                                  0x2 
#Define SUBLANG_SERBIAN_CYRILLIC                                     0x3 
#Define SUBLANG_SERBIAN_LATIN                                        0x2 
#Define SUBLANG_SPANISH                                              0x1 
#Define SUBLANG_SPANISH_ARGENTINA                                    0xb 
#Define SUBLANG_SPANISH_BOLIVIA                                      0x10 
#Define SUBLANG_SPANISH_CHILE                                        0xd 
#Define SUBLANG_SPANISH_COLOMBIA                                     0x9 
#Define SUBLANG_SPANISH_COSTA_RICA                                   0x5 
#Define SUBLANG_SPANISH_DOMINICAN_REPUBLIC                           0x7 
#Define SUBLANG_SPANISH_ECUADOR                                      0xc 
#Define SUBLANG_SPANISH_EL_SALVADOR                                  0x11 
#Define SUBLANG_SPANISH_GUATEMALA                                    0x4 
#Define SUBLANG_SPANISH_HONDURAS                                     0x12 
#Define SUBLANG_SPANISH_MEXICAN                                      0x2 
#Define SUBLANG_SPANISH_MODERN                                       0x3 
#Define SUBLANG_SPANISH_NICARAGUA                                    0x13 
#Define SUBLANG_SPANISH_PANAMA                                       0x6 
#Define SUBLANG_SPANISH_PARAGUAY                                     0xf 
#Define SUBLANG_SPANISH_PERU                                         0xa 
#Define SUBLANG_SPANISH_PUERTO_RICO                                  0x14 
#Define SUBLANG_SPANISH_URUGUAY                                      0xe 
#Define SUBLANG_SPANISH_VENEZUELA                                    0x8 
#Define SUBLANG_SWEDISH                                              0x1 
#Define SUBLANG_SWEDISH_FINLAND                                      0x2 
#Define SUBLANG_SYS_DEFAULT                                          0x2 
#Define SUBLANG_URDU_INDIA                                           0x2 
#Define SUBLANG_URDU_PAKISTAN                                        0x1 
#Define SUBLANG_UZBEK_CYRILLIC                                       0x2 
#Define SUBLANG_UZBEK_LATIN                                          0x1 
#Define SW_AUTOPROF_LOAD_MASK                                        0x1 
#Define SW_AUTOPROF_SAVE_MASK                                        0x2 
#Define SW_ERASE                                                     0x4 
#Define SW_FORCEMINIMIZE                                             11 
#Define SW_HIDE                                                      0 
#Define SW_INVALIDATE                                                0x2 
#Define SW_MAX                                                       10 
#Define SW_MAXIMIZE                                                  3 
#Define SW_MINIMIZE                                                  6 
#Define SW_NORMAL                                                    1 
#Define SW_OTHERUNZOOM                                               4 
#Define SW_OTHERZOOM                                                 2 
#Define SW_PARENTCLOSING                                             1 
#Define SW_PARENTOPENING                                             3 
#Define SW_RESTORE                                                   9 
#Define SW_SCROLLCHILDREN                                            0x1 
#Define SW_SHOW                                                      5 
#Define SW_SHOWDEFAULT                                               10 
#Define SW_SHOWMAXIMIZED                                             3 
#Define SW_SHOWMINIMIZED                                             2 
#Define SW_SHOWMINNOACTIVE                                           7 
#Define SW_SHOWNA                                                    8 
#Define SW_SHOWNOACTIVATE                                            4 
#Define SW_SHOWNORMAL                                                1 
#Define SW_SMOOTHSCROLL                                              0x10 
#Define SWP_ASYNCWINDOWPOS                                           0x4000 
#Define SWP_DEFERERASE                                               0x2000 
#Define SWP_DRAWFRAME                                                0x20 && SWP_FRAMECHANGED
#Define SWP_FRAMECHANGED                                             0x20 
#Define SWP_HIDEWINDOW                                               0x80 
#Define SWP_NOACTIVATE                                               0x10 
#Define SWP_NOCOPYBITS                                               0x100 
#Define SWP_NOMOVE                                                   0x2 
#Define SWP_NOOWNERZORDER                                            0x200 
#Define SWP_NOREDRAW                                                 0x8 
#Define SWP_NOREPOSITION                                             0x200 && SWP_NOOWNERZORDER
#Define SWP_NOSENDCHANGING                                           0x400 
#Define SWP_NOSIZE                                                   0x1 
#Define SWP_NOZORDER                                                 0x4 
#Define SWP_SHOWWINDOW                                               0x40 
#Define SYMBOL_CHARSET                                               2 
#Define SYNCHRONIZE                                                  0x100000 

#Define TB_BOTTOM                                                    7
#Define TB_ENDTRACK                                                  8
#Define TB_LINEDOWN                                                  1
#Define TB_LINEUP                                                    0
#Define TB_PAGEDOWN                                                  3
#Define TB_PAGEUP                                                    2
#Define TB_THUMBPOSITION                                             4
#Define TB_THUMBTRACK                                                5
#Define TB_TOP                                                       6

#Define TBCD_TICS                                                    0x0001
#Define TBCD_THUMB                                                   0x0002
#Define TBCD_CHANNEL                                                 0x0003

#Define TBM_CLEARSEL                                                 (0x400 + 19)
#Define TBM_CLEARTICS                                                (0x400 + 9)
#Define TBM_GETBUDDY                                                 (0x400 + 33)
#Define TBM_GETCHANNELRECT                                           (0x400 + 26)
#Define TBM_GETLINESIZE                                              (0x400 + 24)
#Define TBM_GETNUMTICS                                               (0x400 + 16)
#Define TBM_GETPAGESIZE                                              (0x400 + 22)
#Define TBM_GETPOS                                                   (0x400)
#Define TBM_GETPTICS                                                 (0x400 + 14)
#Define TBM_GETRANGEMAX                                              (0x400 + 2)
#Define TBM_GETRANGEMIN                                              (0x400 + 1)
#Define TBM_GETSELEND                                                (0x400 + 18)
#Define TBM_GETSELSTART                                              (0x400 + 17)
#Define TBM_GETTHUMBLENGTH                                           (0x400 + 28)
#Define TBM_GETTHUMBRECT                                             (0x400 + 25)
#Define TBM_GETTIC                                                   (0x400 + 3)
#Define TBM_GETTICPOS                                                (0x400 + 15)
#Define TBM_GETTOOLTIPS                                              (0x400 + 30)
#Define TBM_GETUNICODEFORMAT                                         0x2006 
#Define TBM_SETBUDDY                                                 (0x400 + 32)
#Define TBM_SETLINESIZE                                              (0x400 + 23)
#Define TBM_SETPAGESIZE                                              (0x400 + 21)
#Define TBM_SETPOS                                                   (0x400 + 5)
#Define TBM_SETRANGE                                                 (0x400 + 6)
#Define TBM_SETRANGEMAX                                              (0x400 + 8)
#Define TBM_SETRANGEMIN                                              (0x400 + 7)
#Define TBM_SETSEL                                                   (0x400 + 10)
#Define TBM_SETSELEND                                                (0x400 + 12)
#Define TBM_SETSELSTART                                              (0x400 + 11)
#Define TBM_SETTHUMBLENGTH                                           (0x400 + 27)
#Define TBM_SETTIC                                                   (0x400 + 4)
#Define TBM_SETTICFREQ                                               (0x400 + 20)
#Define TBM_SETTIPSIDE                                               (0x400 + 31)
#Define TBM_SETTOOLTIPS                                              (0x400 + 29)
#Define TBM_SETUNICODEFORMAT                                         0x2005

#Define TBS_AUTOTICKS                                                0x0001 
#Define TBS_BOTH                                                     0x0008 
#Define TBS_BOTTOM                                                   0x0000 
#Define TBS_DOWNISLEFT                                               0x0400 && Down=Left and Up=Right (default is Down=Right and Up=Left)
#Define TBS_ENABLESELRANGE                                           0x0020 
#Define TBS_FIXEDLENGTH                                              0x0040 
#Define TBS_HORZ                                                     0x0000 
#Define TBS_LEFT                                                     0x0004 
#Define TBS_NOTHUMB                                                  0x0080 
#Define TBS_NOTICKS                                                  0x0010 
#Define TBS_NOTIFYBEFOREMOVE                                         0x0800 && Trackbar should notify parent before repositioning the slider due to user action (enables snapping)
#Define TBS_REVERSED                                                 0x0200 && Accessibility hint: the smaller number (usually the min value) means "high" and the larger number (usually the max value) means "low"
#Define TBS_RIGHT                                                    0x0000 
#Define TBS_TOOLTIPS                                                 0x0100 
#Define TBS_TOP                                                      0x0004 
#Define TBS_TRANSPARENTBKGND                                         0x1000 && Background is painted by the parent via WM_PRINTCLIENT
#Define TBS_VERT                                                     0x0002 

#Define TBTS_TOP                                                     0
#Define TBTS_LEFT                                                    1
#Define TBTS_BOTTOM                                                  2
#Define TBTS_RIGHT                                                   3

#Define TCIF_IMAGE                                                   0x2 
#Define TCIF_PARAM                                                   0x8 
#Define TCIF_RTLREADING                                              0x4 
#Define TCIF_STATE                                                   0x10 
#Define TCIF_TEXT                                                    0x1 
#Define TCIS_BUTTONPRESSED                                           0x1 
#Define TCIS_HIGHLIGHTED                                             0x2 
#Define TCM_ADJUSTRECT                                               0x13290 
#Define TCM_DELETEALLITEMS                                           0x1309 
#Define TCM_DELETEITEM                                               0x1308 
#Define TCM_DESELECTALL                                              0x1332 
#Define TCM_FIRST                                                    0x1300 
#Define TCM_GETCURFOCUS                                              0x132f 
#Define TCM_GETCURSEL                                                0x130b 
#Define TCM_GETEXTENDEDSTYLE                                         0x1335 
#Define TCM_GETIMAGELIST                                             0x1302 
#Define TCM_GETITEMA                                                 0x1305 
#Define TCM_GETITEMCOUNT                                             0x1304 
#Define TCM_GETITEMRECT                                              0x130a 
#Define TCM_GETITEMW                                                 0x133c 
#Define TCM_GETROWCOUNT                                              0x132c 
#Define TCM_GETTOOLTIPS                                              0x132d 
#Define TCM_GETUNICODEFORMAT                                         0x2006 
#Define TCM_HIGHLIGHTITEM                                            0x1333 
#Define TCM_HITTEST                                                  0x130d 
#Define TCM_INSERTITEMA                                              0x1307 
#Define TCM_INSERTITEMW                                              0x133e 
#Define TCM_REMOVEIMAGE                                              0x132a 
#Define TCM_SETCURFOCUS                                              0x1330 
#Define TCM_SETCURSEL                                                0x130c 
#Define TCM_SETEXTENDEDSTYLE                                         0x1334 
#Define TCM_SETIMAGELIST                                             0x1303 
#Define TCM_SETITEMA                                                 0x1306 
#Define TCM_SETITEMEXTRA                                             0x130e 
#Define TCM_SETITEMSIZE                                              0x1329 
#Define TCM_SETITEMW                                                 0x133d 
#Define TCM_SETMINTABWIDTH                                           0x1331 
#Define TCM_SETPADDING                                               0x132b 
#Define TCM_SETTOOLTIPS                                              0x132e 
#Define TCM_SETUNICODEFORMAT                                         0x2005 
#Define TCN_FIRST                                                    -550 
#Define TCN_FOCUSCHANGE                                              -554 
#Define TCN_GETOBJECT                                                -553 
#Define TCN_KEYDOWN                                                  -550 
#Define TCN_LAST                                                     -580 
#Define TCN_SELCHANGE                                                -551 
#Define TCN_SELCHANGING                                              -552 
#Define TCS_BOTTOM                                                   0x2 
#Define TCS_BUTTONS                                                  0x100 
#Define TCS_EX_FLATSEPARATORS                                        0x1 
#Define TCS_EX_REGISTERDROP                                          0x2 
#Define TCS_FIXEDWIDTH                                               0x400 
#Define TCS_FLATBUTTONS                                              0x8 
#Define TCS_FOCUSNEVER                                               0x8000 
#Define TCS_FOCUSONBUTTONDOWN                                        0x1000 
#Define TCS_FORCEICONLEFT                                            0x10 
#Define TCS_FORCELABELLEFT                                           0x20 
#Define TCS_HOTTRACK                                                 0x40 
#Define TCS_MULTILINE                                                0x200 
#Define TCS_MULTISELECT                                              0x4 
#Define TCS_OWNERDRAWFIXED                                           0x2000 
#Define TCS_RAGGEDRIGHT                                              0x800 
#Define TCS_RIGHT                                                    0x2 
#Define TCS_RIGHTJUSTIFY                                             0x0 
#Define TCS_SCROLLOPPOSITE                                           0x1 
#Define TCS_SINGLELINE                                               0x0 
#Define TCS_TABS                                                     0x0 
#Define TCS_TOOLTIPS                                                 0x4000 
#Define TCS_VERTICAL                                                 0x80 
#Define THAI_CHARSET                                                 222 
#Define TIME_BYTES                                                   0x4 
#Define TIME_CALLBACK_EVENT_PULSE                                    0x20 
#Define TIME_CALLBACK_EVENT_SET                                      0x10 
#Define TIME_CALLBACK_FUNCTION                                       0x0 
#Define TIME_EXCEEDED                                                11 
#Define TIME_FORCE24HOURFORMAT                                       0x8 
#Define TIME_MIDI                                                    0x10 
#Define TIME_MS                                                      0x1 
#Define TIME_NOMINUTESORSECONDS                                      0x1 
#Define TIME_NOSECONDS                                               0x2 
#Define TIME_NOTIMEMARKER                                            0x4 
#Define TIME_ONESHOT                                                 0 
#Define TIME_PERIODIC                                                1 
#Define TIME_SAMPLES                                                 0x2 
#Define TIME_SMPTE                                                   0x8 
#Define TIME_STAMP_CAPABLE                                           0x20 
#Define TIME_TICKS                                                   0x20 
#Define TIME_ZONE_ID_DAYLIGHT                                        2 
#Define TIME_ZONE_ID_INVALID                                         0xffffffff 
#Define TIME_ZONE_ID_STANDARD                                        1 
#Define TIME_ZONE_ID_UNKNOWN                                         0 
#Define TMT_ACCENTCOLORHINT                                          3823 
#Define TMT_ACTIVEBORDER                                             1611 
#Define TMT_ACTIVECAPTION                                            1603 
#Define TMT_ALIAS                                                    1404 
#Define TMT_ALPHALEVEL                                               2402 
#Define TMT_ALPHATHRESHOLD                                           2415 
#Define TMT_ALWAYSSHOWSIZINGBAR                                      2208 
#Define TMT_ANIMATIONBUTTONRECT                                      5005 
#Define TMT_ANIMATIONDELAY                                           2428 
#Define TMT_ANIMATIONDURATION                                        5006 
#Define TMT_APPWORKSPACE                                             1613 
#Define TMT_ATLASIMAGE                                               8000 
#Define TMT_ATLASINPUTIMAGE                                          8001 
#Define TMT_ATLASRECT                                                8002 
#Define TMT_AUTHOR                                                   604 
#Define TMT_AUTOSIZE                                                 2202 
#Define TMT_BACKGROUND                                               1602 
#Define TMT_BGFILL                                                   2205 
#Define TMT_BGTYPE                                                   4001 
#Define TMT_BITMAPREF                                                215 
#Define TMT_BLENDCOLOR                                               5003 
#Define TMT_BODYFONT                                                 809 
#Define TMT_BODYTEXTCOLOR                                            3827 
#Define TMT_BOOL                                                     203 
#Define TMT_BORDERCOLOR                                              3801 
#Define TMT_BORDERCOLORHINT                                          3822 
#Define TMT_BORDERONLY                                               2203 
#Define TMT_BORDERSIZE                                               2403 
#Define TMT_BORDERTYPE                                               4002 
#Define TMT_BTNFACE                                                  1616 
#Define TMT_BTNHIGHLIGHT                                             1621 
#Define TMT_BTNSHADOW                                                1617 
#Define TMT_BTNTEXT                                                  1619 
#Define TMT_BUTTONALTERNATEFACE                                      1626 
#Define TMT_CAPTIONBARHEIGHT                                         1205 
#Define TMT_CAPTIONBARWIDTH                                          1204 
#Define TMT_CAPTIONFONT                                              801 
#Define TMT_CAPTIONMARGINS                                           3603 
#Define TMT_CAPTIONTEXT                                              1610 
#Define TMT_CHARSET                                                  403 
#Define TMT_CLASSICVALUE                                             3202 
#Define TMT_COLOR                                                    204 
#Define TMT_COLORIZATIONCOLOR                                        2431 
#Define TMT_COLORIZATIONOPACITY                                      2432 
#Define TMT_COLORSCHEMES                                             401 
#Define TMT_COMPANY                                                  603 
#Define TMT_COMPOSITED                                               2204 
#Define TMT_COMPOSITEDOPAQUE                                         2219 
#Define TMT_CONTENTALIGNMENT                                         4006 
#Define TMT_CONTENTMARGINS                                           3602 
#Define TMT_COPYRIGHT                                                605 
#Define TMT_CSSNAME                                                  1401 
#Define TMT_CUSTOMSPLITRECT                                          5004 
#Define TMT_DEFAULTPANESIZE                                          5002 
#Define TMT_DESCRIPTION                                              608 
#Define TMT_DIBDATA                                                  2 
#Define TMT_DISKSTREAM                                               213 
#Define TMT_DISPLAYNAME                                              601 
#Define TMT_DKSHADOW3D                                               1622 
#Define TMT_DRAWBORDERS                                              2214 
#Define TMT_EDGEDKSHADOWCOLOR                                        3807 
#Define TMT_EDGEFILLCOLOR                                            3808 
#Define TMT_EDGEHIGHLIGHTCOLOR                                       3805 
#Define TMT_EDGELIGHTCOLOR                                           3804 
#Define TMT_EDGESHADOWCOLOR                                          3806 
#Define TMT_ENUM                                                     200 
#Define TMT_FILENAME                                                 206 
#Define TMT_FILLCOLOR                                                3802 
#Define TMT_FILLCOLORHINT                                            3821 
#Define TMT_FILLTYPE                                                 4003 
#Define TMT_FIRST_RCSTRING_NAME                                      601 && TMT_DISPLAYNAME 
#Define TMT_FIRSTBOOL                                                1001 && TMT_FLATMENUS 
#Define TMT_FIRSTCOLOR                                               1601 && TMT_SCROLLBAR 
#Define TMT_FIRSTFONT                                                801 && TMT_CAPTIONFONT 
#Define TMT_FIRSTINT                                                 1301 && TMT_MINCOLORDEPTH 
#Define TMT_FIRSTSIZE                                                1201 && TMT_SIZINGBORDERWIDTH 
#Define TMT_FIRSTSTRING                                              1401 && TMT_CSSNAME 
#Define TMT_FLATMENUS                                                1001 
#Define TMT_FONT                                                     210 
#Define TMT_FRAMESPERSECOND                                          2426 
#Define TMT_FROMCOLOR1                                               2001 
#Define TMT_FROMCOLOR2                                               2002 
#Define TMT_FROMCOLOR3                                               2003 
#Define TMT_FROMCOLOR4                                               2004 
#Define TMT_FROMCOLOR5                                               2005 
#Define TMT_FROMHUE1                                                 1801 
#Define TMT_FROMHUE2                                                 1802 
#Define TMT_FROMHUE3                                                 1803 
#Define TMT_FROMHUE4                                                 1804 
#Define TMT_FROMHUE5                                                 1805 
#Define TMT_GLOWCOLOR                                                3816 
#Define TMT_GLOWINTENSITY                                            2429 
#Define TMT_GLYPHDIBDATA                                             8 
#Define TMT_GLYPHFONT                                                2601 
#Define TMT_GLYPHFONTSIZINGTYPE                                      4014 
#Define TMT_GLYPHIMAGEFILE                                           3008 
#Define TMT_GLYPHINDEX                                               2418 
#Define TMT_GLYPHONLY                                                2207 
#Define TMT_GLYPHTEXTCOLOR                                           3819 
#Define TMT_GLYPHTRANSPARENT                                         2206 
#Define TMT_GLYPHTRANSPARENTCOLOR                                    3820 
#Define TMT_GLYPHTYPE                                                4012 
#Define TMT_GRADIENTACTIVECAPTION                                    1628 
#Define TMT_GRADIENTCOLOR1                                           3810 
#Define TMT_GRADIENTCOLOR2                                           3811 
#Define TMT_GRADIENTCOLOR3                                           3812 
#Define TMT_GRADIENTCOLOR4                                           3813 
#Define TMT_GRADIENTCOLOR5                                           3814 
#Define TMT_GRADIENTINACTIVECAPTION                                  1629 
#Define TMT_GRADIENTRATIO1                                           2406 
#Define TMT_GRADIENTRATIO2                                           2407 
#Define TMT_GRADIENTRATIO3                                           2408 
#Define TMT_GRADIENTRATIO4                                           2409 
#Define TMT_GRADIENTRATIO5                                           2410 
#Define TMT_GRAYTEXT                                                 1618 
#Define TMT_HALIGN                                                   4005 
#Define TMT_HBITMAP                                                  212 
#Define TMT_HEADING1FONT                                             807 
#Define TMT_HEADING1TEXTCOLOR                                        3825 
#Define TMT_HEADING2FONT                                             808 
#Define TMT_HEADING2TEXTCOLOR                                        3826 
#Define TMT_HEIGHT                                                   2417 
#Define TMT_HIGHLIGHT                                                1614 
#Define TMT_HIGHLIGHTTEXT                                            1615 
#Define TMT_HOTTRACKING                                              1627 
#Define TMT_ICONEFFECT                                               4009 
#Define TMT_ICONTITLEFONT                                            806 
#Define TMT_IMAGECOUNT                                               2401 
#Define TMT_IMAGEFILE                                                3001 
#Define TMT_IMAGEFILE1                                               3002 
#Define TMT_IMAGEFILE2                                               3003 
#Define TMT_IMAGEFILE3                                               3004 
#Define TMT_IMAGEFILE4                                               3005 
#Define TMT_IMAGEFILE5                                               3006 
#Define TMT_IMAGELAYOUT                                              4011 
#Define TMT_IMAGESELECTTYPE                                          4013 
#Define TMT_INACTIVEBORDER                                           1612 
#Define TMT_INACTIVECAPTION                                          1604 
#Define TMT_INACTIVECAPTIONTEXT                                      1620 
#Define TMT_INFOBK                                                   1625 
#Define TMT_INFOTEXT                                                 1624 
#Define TMT_INT                                                      202 
#Define TMT_INTEGRALSIZING                                           2211 
#Define TMT_INTLIST                                                  211 
#Define TMT_LAST_RCSTRING_NAME                                       608 && TMT_DESCRIPTION 
#Define TMT_LASTBOOL                                                 1001 && TMT_FLATMENUS 
#Define TMT_LASTCOLOR                                                1631 && TMT_MENUBAR 
#Define TMT_LASTFONT                                                 809 && TMT_BODYFONT 
#Define TMT_LASTINT                                                  1301 && TMT_MINCOLORDEPTH 
#Define TMT_LASTSIZE                                                 1210 && TMT_PADDEDBORDERWIDTH 
#Define TMT_LASTSTRING                                               1404 && TMT_ALIAS 
#Define TMT_LASTUPDATED                                              1403 
#Define TMT_LIGHT3D                                                  1623 
#Define TMT_LOCALIZEDMIRRORIMAGE                                     2220 
#Define TMT_MARGINS                                                  205 
#Define TMT_MENU                                                     1605 
#Define TMT_MENUBAR                                                  1631 
#Define TMT_MENUBARHEIGHT                                            1209 
#Define TMT_MENUBARWIDTH                                             1208 
#Define TMT_MENUFONT                                                 803 
#Define TMT_MENUHILIGHT                                              1630 
#Define TMT_MENUTEXT                                                 1608 
#Define TMT_MINCOLORDEPTH                                            1301 
#Define TMT_MINDPI1                                                  2420 
#Define TMT_MINDPI2                                                  2421 
#Define TMT_MINDPI3                                                  2422 
#Define TMT_MINDPI4                                                  2423 
#Define TMT_MINDPI5                                                  2424 
#Define TMT_MINSIZE                                                  3403 
#Define TMT_MINSIZE1                                                 3404 
#Define TMT_MINSIZE2                                                 3405 
#Define TMT_MINSIZE3                                                 3406 
#Define TMT_MINSIZE4                                                 3407 
#Define TMT_MINSIZE5                                                 3408 
#Define TMT_MIRRORIMAGE                                              2209 
#Define TMT_MSGBOXFONT                                               805 
#Define TMT_NAME                                                     600 
#Define TMT_NOETCHEDEFFECT                                           2215 
#Define TMT_NORMALSIZE                                               3409 
#Define TMT_OFFSET                                                   3401 
#Define TMT_OFFSETTYPE                                               4008 
#Define TMT_OPACITY                                                  2430 
#Define TMT_PADDEDBORDERWIDTH                                        1210 
#Define TMT_PIXELSPERFRAME                                           2427 
#Define TMT_POSITION                                                 208 
#Define TMT_PROGRESSCHUNKSIZE                                        2411 
#Define TMT_PROGRESSSPACESIZE                                        2412 
#Define TMT_RECT                                                     209 
#Define TMT_RESERVEDHIGH                                             7999 
#Define TMT_RESERVEDLOW                                              0 
#Define TMT_ROUNDCORNERHEIGHT                                        2405 
#Define TMT_ROUNDCORNERWIDTH                                         2404 
#Define TMT_SATURATION                                               2413 
#Define TMT_SCALEDBACKGROUND                                         7001 
#Define TMT_SCROLLBAR                                                1601 
#Define TMT_SCROLLBARHEIGHT                                          1203 
#Define TMT_SCROLLBARWIDTH                                           1202 
#Define TMT_SHADOWCOLOR                                              3815 
#Define TMT_SIZE                                                     207 
#Define TMT_SIZES                                                    402 
#Define TMT_SIZINGBORDERWIDTH                                        1201 
#Define TMT_SIZINGMARGINS                                            3601 
#Define TMT_SIZINGTYPE                                               4004 
#Define TMT_SMALLCAPTIONFONT                                         802 
#Define TMT_SMCAPTIONBARHEIGHT                                       1207 
#Define TMT_SMCAPTIONBARWIDTH                                        1206 
#Define TMT_SOURCEGROW                                               2212 
#Define TMT_SOURCESHRINK                                             2213 
#Define TMT_STATUSFONT                                               804 
#Define TMT_STREAM                                                   214 
#Define TMT_STRING                                                   201 
#Define TMT_TEXT                                                     3201 
#Define TMT_TEXTAPPLYOVERLAY                                         2216 
#Define TMT_TEXTBORDERCOLOR                                          3817 
#Define TMT_TEXTBORDERSIZE                                           2414 
#Define TMT_TEXTCOLOR                                                3803 
#Define TMT_TEXTCOLORHINT                                            3824 
#Define TMT_TEXTGLOW                                                 2217 
#Define TMT_TEXTGLOWSIZE                                             2425 
#Define TMT_TEXTITALIC                                               2218 
#Define TMT_TEXTSHADOWCOLOR                                          3818 
#Define TMT_TEXTSHADOWOFFSET                                         3402 
#Define TMT_TEXTSHADOWTYPE                                           4010 
#Define TMT_TOCOLOR1                                                 2006 
#Define TMT_TOCOLOR2                                                 2007 
#Define TMT_TOCOLOR3                                                 2008 
#Define TMT_TOCOLOR4                                                 2009 
#Define TMT_TOCOLOR5                                                 2010 
#Define TMT_TOHUE1                                                   1806 
#Define TMT_TOHUE2                                                   1807 
#Define TMT_TOHUE3                                                   1808 
#Define TMT_TOHUE4                                                   1809 
#Define TMT_TOHUE5                                                   1810 
#Define TMT_TOOLTIP                                                  602 
#Define TMT_TRANSITIONDURATIONS                                      6000 
#Define TMT_TRANSPARENT                                              2201 
#Define TMT_TRANSPARENTCOLOR                                         3809 
#Define TMT_TRUESIZESCALINGTYPE                                      4015 
#Define TMT_TRUESIZESTRETCHMARK                                      2419 
#Define TMT_UNIFORMSIZING                                            2210 
#Define TMT_URL                                                      606 
#Define TMT_USERPICTURE                                              5001 
#Define TMT_VALIGN                                                   4007 
#Define TMT_VERSION                                                  607 
#Define TMT_WIDTH                                                    2416 
#Define TMT_WINDOW                                                   1606 
#Define TMT_WINDOWFRAME                                              1607 
#Define TMT_WINDOWTEXT                                               1609 
#Define TMT_XMLNAME                                                  1402 
#Define TOOLTIPS_CLASSA                                              "tooltips_class32" 
#Define TOOLTIPS_CLASSW                                              "tooltips_class32" 
#Define TPM_BOTTOMALIGN                                              0x20 
#Define TPM_CENTERALIGN                                              0x4 
#Define TPM_HORIZONTAL                                               0x0 
#Define TPM_HORNEGANIMATION                                          0x800 
#Define TPM_HORPOSANIMATION                                          0x400 
#Define TPM_LAYOUTRTL                                                0x8000 
#Define TPM_LEFTALIGN                                                0x0 
#Define TPM_LEFTBUTTON                                               0x0 
#Define TPM_NOANIMATION                                              0x4000 
#Define TPM_NONOTIFY                                                 0x80 
#Define TPM_RECURSE                                                  0x1 
#Define TPM_RETURNCMD                                                0x100 
#Define TPM_RIGHTALIGN                                               0x8 
#Define TPM_RIGHTBUTTON                                              0x2 
#Define TPM_TOPALIGN                                                 0x0 
#Define TPM_VCENTERALIGN                                             0x10 
#Define TPM_VERNEGANIMATION                                          0x2000 
#Define TPM_VERPOSANIMATION                                          0x1000 
#Define TPM_VERTICAL                                                 0x40 
#Define TRACKBAR_CLASS                                               "msctls_trackbar" 
#Define TRACKBAR_CLASSA                                              "msctls_trackbar32" 
#Define TRACKBAR_CLASSW                                              "msctls_trackbar32" 
#Define TRUNCATE_EXISTING                                            5 
#Define TS_DRAW                                                      2 
#Define TS_MIN                                                       0 
#Define TS_TRUE                                                      1 
#Define TTDT_AUTOMATIC                                               0 
#Define TTDT_AUTOPOP                                                 2 
#Define TTDT_INITIAL                                                 3 
#Define TTDT_RESHOW                                                  1 
#Define TTF_ABSOLUTE                                                 0x80 
#Define TTF_BITMAP                                                   0x10000 && VISTA
#Define TTF_CENTERTIP                                                0x2 
#Define TTF_DI_SETITEM                                               0x8000 
#Define TTF_IDISHWND                                                 0x1 
#Define TTF_PARSELINKS                                               0x1000 
#Define TTF_RTLREADING                                               0x4 
#Define TTF_SUBCLASS                                                 0x10 
#Define TTF_TRACK                                                    0x20 
#Define TTF_TRANSPARENT                                              0x100 
#Define TTI_ERROR                                                    3 
#Define TTI_ERROR_LARGE                                              6 && VISTA
#Define TTI_INFO                                                     1 
#Define TTI_INFO_LARGE                                               4 && VISTA
#Define TTI_NONE                                                     0 
#Define TTI_WARNING                                                  2 
#Define TTI_WARNING_LARGE                                            5 && VISTA
#Define TTM_ACTIVATE                                                 0x401 
#Define TTM_ADDTOOLA                                                 0x404 
#Define TTM_ADDTOOLW                                                 0x432 
#Define TTM_ADJUSTRECT                                               0x41f 
#Define TTM_DELTOOLA                                                 0x405 
#Define TTM_DELTOOLW                                                 0x433 
#Define TTM_ENUMTOOLSA                                               0x40e 
#Define TTM_ENUMTOOLSW                                               0x43a 
#Define TTM_GETBUBBLESIZE                                            0x41e 
#Define TTM_GETCURRENTTOOLA                                          0x40f 
#Define TTM_GETCURRENTTOOLW                                          0x43b 
#Define TTM_GETDELAYTIME                                             0x415 
#Define TTM_GETMARGIN                                                0x41b 
#Define TTM_GETMAXTIPWIDTH                                           0x419 
#Define TTM_GETTEXTA                                                 0x40b 
#Define TTM_GETTEXTW                                                 0x438 
#Define TTM_GETTIPBKCOLOR                                            0x416 
#Define TTM_GETTIPTEXTCOLOR                                          0x417 
#Define TTM_GETTOOLCOUNT                                             0x40d 
#Define TTM_GETTOOLINFOA                                             0x408 
#Define TTM_GETTOOLINFOW                                             0x435 
#Define TTM_HITTESTA                                                 0x40a 
#Define TTM_HITTESTW                                                 0x437 
#Define TTM_NEWTOOLRECTA                                             0x406 
#Define TTM_NEWTOOLRECTW                                             0x434 
#Define TTM_POP                                                      0x41c 
#Define TTM_POPUP                                                    0x422 
#Define TTM_RELAYEVENT                                               0x407 
#Define TTM_SETDELAYTIME                                             0x403 
#Define TTM_SETMARGIN                                                0x41a 
#Define TTM_SETMAXTIPWIDTH                                           0x418 
#Define TTM_SETTIPBKCOLOR                                            0x413 
#Define TTM_SETTIPTEXTCOLOR                                          0x414 
#Define TTM_SETTITLEA                                                0x420 
#Define TTM_SETTITLEW                                                0x421 
#Define TTM_SETTOOLINFOA                                             0x409 
#Define TTM_SETTOOLINFOW                                             0x436 
#Define TTM_SETWINDOWTHEME                                           0x200B 
#Define TTM_TRACKACTIVATE                                            0x411 
#Define TTM_TRACKPOSITION                                            0x412 
#Define TTM_UPDATE                                                   0x41d 
#Define TTM_UPDATETIPTEXTA                                           0x40c 
#Define TTM_UPDATETIPTEXTW                                           0x439 
#Define TTM_WINDOWFROMPOINT                                          0x410 
#Define TTN_FIRST                                                    -520 
#Define TTN_GETDISPINFO                                              -520 
#Define TTN_GETDISPINFOA                                             -520 
#Define TTN_GETDISPINFOW                                             -530 
#Define TTN_LAST                                                     -549 
#Define TTN_LINKCLICK                                                -523 
#Define TTN_NEEDTEXT                                                 -520 
#Define TTN_NEEDTEXTA                                                -520 
#Define TTN_NEEDTEXTW                                                -530 
#Define TTN_POP                                                      -522 
#Define TTN_SHOW                                                     -521 
#Define TTS_ALWAYSTIP                                                0x1 
#Define TTS_BALLOON                                                  0x40 
#Define TTS_CLOSE                                                    0x80 
#Define TTS_NOANIMATE                                                0x10 
#Define TTS_NOFADE                                                   0x20 
#Define TTS_NOPREFIX                                                 0x2 
#Define TTS_USEVISUALSTYLE                                           0x100 && VISTA
#Define TURKISH_CHARSET                                              162 

#Define UDM_GETACCEL                                                 (0x400+108)
#Define UDM_GETBASE                                                  (0x400+110)
#Define UDM_GETBUDDY                                                 (0x400+106)
#Define UDM_GETPOS                                                   (0x400+104)
#Define UDM_GETPOS32                                                 (0x400+114)
#Define UDM_GETRANGE                                                 (0x400+102)
#Define UDM_GETRANGE32                                               (0x400+112)
#Define UDM_GETUNICODEFORMAT                                         (0x2000+6)
#Define UDM_SETACCEL                                                 (0x400+107)
#Define UDM_SETBASE                                                  (0x400+109)
#Define UDM_SETBUDDY                                                 (0x400+105)
#Define UDM_SETPOS                                                   (0x400+103)
#Define UDM_SETPOS32                                                 (0x400+113)
#Define UDM_SETRANGE                                                 (0x400+101)
#Define UDM_SETRANGE32                                               (0x400+111)
#Define UDM_SETUNICODEFORMAT                                         (0x2000+5)

#Define UDS_ALIGNLEFT                                                0x8
#Define UDS_ALIGNRIGHT                                               0x4
#Define UDS_ARROWKEYS                                                0x20
#Define UDS_AUTOBUDDY                                                0x10
#Define UDS_HORZ                                                     0x40
#Define UDS_HOTTRACK                                                 0x100
#Define UDS_NOTHOUSANDS                                              0x80
#Define UDS_SETBUDDYINT                                              0x2
#Define UDS_WRAP                                                     0x1

#Define UISF_ACTIVE                                                  4
#Define UIS_CLEAR                                                    2
#Define UIS_INITIALIZE                                               3
#Define UIS_SET                                                      1
#Define UISF_HIDEACCEL                                               0x2
#Define UISF_HIDEFOCUS                                               0x1

#Define UPDOWN_CLASS                                                 "msctls_updown"
#Define UPDOWN_CLASSA                                                "msctls_updown32"
#Define UPDOWN_CLASSW                                                "msctls_updown32"

#Define UNLEN                                                        256

#Define VIETNAMESE_CHARSET                                           163 
#Define VK_CAPITAL                                                   0x14
#Define VK_ESCAPE                                                    0x1b
#Define VK_SHIFT                                                     0x10
#Define VK_TAB                                                       0x09
#Define VK_RETURN                                                    0x0d

#Define WA_ACTIVE                                                    1
#Define WA_CLICKACTIVE                                               2
#Define WA_INACTIVE                                                  0

#Define WC_SCROLLBARA                                                "ScrollBar" 
#Define WC_SCROLLBARW                                                "ScrollBar" 
#Define WC_STATICA                                                   "Static" 
#Define WC_STATICW                                                   "Static" 
#Define WC_TABCONTROLA                                               "SysTabControl32" 
#Define WC_TABCONTROLW                                               "SysTabControl32" 

#Define WHEEL_DELTA                                                  120

#Define WM_ACTIVATE                                                  0x6 
#Define WM_ACTIVATEAPP                                               0x1C 
#Define WM_ADSPROP_NOTIFY_APPLY                                      0x850 
#Define WM_ADSPROP_NOTIFY_CHANGE                                     0x84f 
#Define WM_ADSPROP_NOTIFY_ERROR                                      0x856 
#Define WM_ADSPROP_NOTIFY_EXIT                                       0x853 
#Define WM_ADSPROP_NOTIFY_FOREGROUND                                 0x852 
#Define WM_ADSPROP_NOTIFY_PAGEHWND                                   0x84e 
#Define WM_ADSPROP_NOTIFY_PAGEINIT                                   0x84d 
#Define WM_ADSPROP_NOTIFY_SETFOCUS                                   0x851 
#Define WM_ADSPROP_NOTIFY_SHOW_ERROR_DIALOG                          0x857 
#Define WM_AFXFIRST                                                  0x360 
#Define WM_AFXLAST                                                   0x37F 
#Define WM_APP                                                       0x8000 
#Define WM_APPCOMMAND                                                0x319 
#Define WM_ASKCBFORMATNAME                                           0x30C 
#Define WM_CANCELJOURNAL                                             0x4B 
#Define WM_CANCELMODE                                                0x1F 
#Define WM_CAPTURECHANGED                                            0x215 
#Define WM_CHANGECBCHAIN                                             0x30D 
#Define WM_CHANGEUISTATE                                             0x127 
#Define WM_CHAR                                                      0x102 
#Define WM_CHARTOITEM                                                0x2F 
#Define WM_CHILDACTIVATE                                             0x22 
#Define WM_CHOOSEFONT_GETLOGFONT                                     0x401 
#Define WM_CHOOSEFONT_SETFLAGS                                       0x466 
#Define WM_CHOOSEFONT_SETLOGFONT                                     0x465 
#Define WM_CLEAR                                                     0x303 
#Define WM_CLOSE                                                     0x10 
#Define WM_COMMAND                                                   0x111 
#Define WM_COMMNOTIFY                                                0x44 
#Define WM_COMPACTING                                                0x41 
#Define WM_COMPAREITEM                                               0x39 
#Define WM_CONTEXTMENU                                               0x7B 
#Define WM_CONVERTREQUEST                                            0x10A 
#Define WM_CONVERTREQUESTEX                                          0x108 
#Define WM_CONVERTRESULT                                             0x10B 
#Define WM_COPY                                                      0x301 
#Define WM_COPYDATA                                                  0x4A 
#Define WM_CPL_LAUNCH                                                0x7e8 
#Define WM_CPL_LAUNCHED                                              0x7e9 
#Define WM_CREATE                                                    0x1 
#Define WM_CTLCOLOR                                                  0x19 
#Define WM_CTLCOLORBTN                                               0x135 
#Define WM_CTLCOLORDLG                                               0x136 
#Define WM_CTLCOLOREDIT                                              0x133 
#Define WM_CTLCOLORLISTBOX                                           0x134 
#Define WM_CTLCOLORMSGBOX                                            0x132 
#Define WM_CTLCOLORSCROLLBAR                                         0x137 
#Define WM_CTLCOLORSTATIC                                            0x138 
#Define WM_CUT                                                       0x300 
#Define WM_DDE_ACK                                                   0x3e4 
#Define WM_DDE_ADVISE                                                0x3e2 
#Define WM_DDE_DATA                                                  0x3e5 
#Define WM_DDE_EXECUTE                                               0x3e8 
#Define WM_DDE_FIRST                                                 0x3E0 
#Define WM_DDE_INITIATE                                              0x3e0 
#Define WM_DDE_LAST                                                  0x3e8 
#Define WM_DDE_POKE                                                  0x3e7 
#Define WM_DDE_REQUEST                                               0x3e6 
#Define WM_DDE_TERMINATE                                             0x3e1 
#Define WM_DDE_UNADVISE                                              0x3e3 
#Define WM_DEADCHAR                                                  0x103 
#Define WM_DELETEITEM                                                0x2D 
#Define WM_DESTROY                                                   0x2 
#Define WM_DESTROYCLIPBOARD                                          0x307 
#Define WM_DEVICECHANGE                                              0x219 
#Define WM_DEVMODECHANGE                                             0x1B 
#Define WM_DISPLAYCHANGE                                             0x7E 
#Define WM_DRAWCLIPBOARD                                             0x308 
#Define WM_DRAWITEM                                                  0x2B 
#Define WM_DROPFILES                                                 0x233 
#Define WM_ENABLE                                                    0xA 
#Define WM_ENDSESSION                                                0x16 
#Define WM_ENTERIDLE                                                 0x121 
#Define WM_ENTERMENULOOP                                             0x211 
#Define WM_ENTERSIZEMOVE                                             0x231 
#Define WM_ERASEBKGND                                                0x14 
#Define WM_EXITMENULOOP                                              0x212 
#Define WM_EXITSIZEMOVE                                              0x232 
#Define WM_FONTCHANGE                                                0x1D 
#Define WM_FORWARDMSG                                                0x37F 
#Define WM_GETDLGCODE                                                0x87 
#Define WM_GETFONT                                                   0x31 
#Define WM_GETHOTKEY                                                 0x33 
#Define WM_GETICON                                                   0x7F 
#Define WM_GETMINMAXINFO                                             0x24 
#Define WM_GETOBJECT                                                 0x3D 
#Define WM_GETTEXT                                                   0xD 
#Define WM_GETTEXTLENGTH                                             0xE 
#Define WM_HANDHELDFIRST                                             0x358 
#Define WM_HANDHELDLAST                                              0x35F 
#Define WM_HELP                                                      0x53 
#Define WM_HOTKEY                                                    0x312 
#Define WM_HSCROLL                                                   0x114 
#Define WM_HSCROLLCLIPBOARD                                          0x30E 
#Define WM_ICONERASEBKGND                                            0x27 
#Define WM_IME_CHAR                                                  0x286 
#Define WM_IME_COMPOSITION                                           0x10F 
#Define WM_IME_COMPOSITIONFULL                                       0x284 
#Define WM_IME_CONTROL                                               0x283 
#Define WM_IME_ENDCOMPOSITION                                        0x10E 
#Define WM_IME_KEYDOWN                                               0x290 
#Define WM_IME_KEYLAST                                               0x10F 
#Define WM_IME_KEYUP                                                 0x291 
#Define WM_IME_NOTIFY                                                0x282 
#Define WM_IME_REPORT                                                0x280 
#Define WM_IME_REQUEST                                               0x288 
#Define WM_IME_SELECT                                                0x285 
#Define WM_IME_SETCONTEXT                                            0x281 
#Define WM_IME_STARTCOMPOSITION                                      0x10D 
#Define WM_IMEKEYDOWN                                                0x290 
#Define WM_IMEKEYUP                                                  0x291 
#Define WM_INITDIALOG                                                0x110 
#Define WM_INITMENU                                                  0x116 
#Define WM_INITMENUPOPUP                                             0x117 
#Define WM_INPUTLANGCHANGE                                           0x51 
#Define WM_INPUTLANGCHANGEREQUEST                                    0x50 
#Define WM_INTERIM                                                   0x10C 
#Define WM_KEYDOWN                                                   0x100 
#Define WM_KEYFIRST                                                  0x100 
#Define WM_KEYLAST                                                   0x108 
#Define WM_KEYUP                                                     0x101 
#Define WM_KILLFOCUS                                                 0x8 
#Define WM_LBUTTONDBLCLK                                             0x203 
#Define WM_LBUTTONDOWN                                               0x201 
#Define WM_LBUTTONUP                                                 0x202 
#Define WM_MBUTTONDBLCLK                                             0x209 
#Define WM_MBUTTONDOWN                                               0x207 
#Define WM_MBUTTONUP                                                 0x208 
#Define WM_MDIACTIVATE                                               0x222 
#Define WM_MDICASCADE                                                0x227 
#Define WM_MDICREATE                                                 0x220 
#Define WM_MDIDESTROY                                                0x221 
#Define WM_MDIGETACTIVE                                              0x229 
#Define WM_MDIICONARRANGE                                            0x228 
#Define WM_MDIMAXIMIZE                                               0x225 
#Define WM_MDINEXT                                                   0x224 
#Define WM_MDIREFRESHMENU                                            0x234 
#Define WM_MDIRESTORE                                                0x223 
#Define WM_MDISETMENU                                                0x230 
#Define WM_MDITILE                                                   0x226 
#Define WM_MEASUREITEM                                               0x2C 
#Define WM_MENUCHAR                                                  0x120 
#Define WM_MENUCOMMAND                                               0x126 
#Define WM_MENUDRAG                                                  0x123 
#Define WM_MENUGETOBJECT                                             0x124 
#Define WM_MENURBUTTONUP                                             0x122 
#Define WM_MENUSELECT                                                0x11F 
#Define WM_MOUSEACTIVATE                                             0x21 
#Define WM_MOUSEFIRST                                                0x200 
#Define WM_MOUSEHOVER                                                0x2A1 
#Define WM_MOUSELAST                                                 0x209 
#Define WM_MOUSELEAVE                                                0x2A3 
#Define WM_MOUSEMOVE                                                 0x200 
#Define WM_MOUSEWHEEL                                                0x20A 
#Define WM_MOVE                                                      0x3 
#Define WM_MOVING                                                    0x216 
#Define WM_NCACTIVATE                                                0x86 
#Define WM_NCCALCSIZE                                                0x83 
#Define WM_NCCREATE                                                  0x81 
#Define WM_NCDESTROY                                                 0x82 
#Define WM_NCHITTEST                                                 0x84 
#Define WM_NCLBUTTONDBLCLK                                           0xA3 
#Define WM_NCLBUTTONDOWN                                             0xA1 
#Define WM_NCLBUTTONUP                                               0xA2 
#Define WM_NCMBUTTONDBLCLK                                           0xA9 
#Define WM_NCMBUTTONDOWN                                             0xA7 
#Define WM_NCMBUTTONUP                                               0xA8 
#Define WM_NCMOUSEHOVER                                              0x2A0 
#Define WM_NCMOUSELEAVE                                              0x2A2 
#Define WM_NCMOUSEMOVE                                               0xA0 
#Define WM_NCPAINT                                                   0x85 
#Define WM_NCRBUTTONDBLCLK                                           0xA6 
#Define WM_NCRBUTTONDOWN                                             0xA4 
#Define WM_NCRBUTTONUP                                               0xA5 
#Define WM_NCXBUTTONDBLCLK                                           0xAD 
#Define WM_NCXBUTTONDOWN                                             0xAB 
#Define WM_NCXBUTTONUP                                               0xAC 
#Define WM_NEXTDLGCTL                                                0x28 
#Define WM_NEXTMENU                                                  0x213 
#Define WM_NOTIFY                                                    0x4E 
#Define WM_NOTIFYFORMAT                                              0x55 
#Define WM_NULL                                                      0x0 
#Define WM_OTHERWINDOWCREATED                                        0x42 
#Define WM_OTHERWINDOWDESTROYED                                      0x43 
#Define WM_PAINT                                                     0xF 
#Define WM_PAINTCLIPBOARD                                            0x309 
#Define WM_PAINTICON                                                 0x26 
#Define WM_PALETTECHANGED                                            0x311 
#Define WM_PALETTEISCHANGING                                         0x310 
#Define WM_PARENTNOTIFY                                              0x210 
#Define WM_PASTE                                                     0x302 
#Define WM_PENWINFIRST                                               0x380 
#Define WM_PENWINLAST                                                0x38F 
#Define WM_POWER                                                     0x48 
#Define WM_POWERBROADCAST                                            0x218 
#Define WM_PRINT                                                     0x317 
#Define WM_PRINTCLIENT                                               0x318 
#Define WM_PSD_ENVSTAMPRECT                                          0x405 
#Define WM_PSD_FULLPAGERECT                                          0x401 
#Define WM_PSD_GREEKTEXTRECT                                         0x404 
#Define WM_PSD_MARGINRECT                                            0x403 
#Define WM_PSD_MINMARGINRECT                                         0x402 
#Define WM_PSD_PAGESETUPDLG                                          0x400 
#Define WM_PSD_YAFULLPAGERECT                                        0x406 
#Define WM_QUERYDRAGICON                                             0x37 
#Define WM_QUERYENDSESSION                                           0x11 
#Define WM_QUERYNEWPALETTE                                           0x30F 
#Define WM_QUERYOPEN                                                 0x13 
#Define WM_QUERYUISTATE                                              0x129 
#Define WM_QUEUESYNC                                                 0x23 
#Define WM_QUIT                                                      0x12 
#Define WM_RASDIALEVENT                                              0xCCCD 
#Define WM_RBUTTONDBLCLK                                             0x206 
#Define WM_RBUTTONDOWN                                               0x204 
#Define WM_RBUTTONUP                                                 0x205 
#Define WM_RENDERALLFORMATS                                          0x306 
#Define WM_RENDERFORMAT                                              0x305 
#Define WM_SETCURSOR                                                 0x20 
#Define WM_SETFOCUS                                                  0x7 
#Define WM_SETFONT                                                   0x30 
#Define WM_SETHOTKEY                                                 0x32 
#Define WM_SETICON                                                   0x80 
#Define WM_SETREDRAW                                                 0xB 
#Define WM_SETTEXT                                                   0xC 
#Define WM_SETTINGCHANGE                                             0x1A 
#Define WM_SHOWWINDOW                                                0x18 
#Define WM_SIZE                                                      0x5 
#Define WM_SIZECLIPBOARD                                             0x30B 
#Define WM_SIZING                                                    0x214 
#Define WM_SPOOLERSTATUS                                             0x2A 
#Define WM_STYLECHANGED                                              0x7D 
#Define WM_STYLECHANGING                                             0x7C 
#Define WM_SYNCPAINT                                                 0x88 
#Define WM_SYSCHAR                                                   0x106 
#Define WM_SYSCOLORCHANGE                                            0x15 
#Define WM_SYSCOMMAND                                                0x112 
#Define WM_SYSDEADCHAR                                               0x107 
#Define WM_SYSKEYDOWN                                                0x104 
#Define WM_SYSKEYUP                                                  0x105 
#Define WM_SYSTIMER                                                  0x0118
#Define WM_TCARD                                                     0x52 
#Define WM_THEMECHANGED                                              0x031A 
#Define WM_TIMECHANGE                                                0x1E 
#Define WM_TIMER                                                     0x113 
#Define WM_UNDO                                                      0x304 
#Define WM_UNINITMENUPOPUP                                           0x125 
#Define WM_UPDATEUISTATE                                             0x128 
#Define WM_USER                                                      0x400 
#Define WM_USERCHANGED                                               0x54 
#Define WM_VKEYTOITEM                                                0x2E 
#Define WM_VSCROLL                                                   0x115 
#Define WM_VSCROLLCLIPBOARD                                          0x30A 
#Define WM_WINDOWPOSCHANGED                                          0x47 
#Define WM_WINDOWPOSCHANGING                                         0x46 
#Define WM_WININICHANGE                                              0x1A 
#Define WM_WNT_CONVERTREQUESTEX                                      0x109 
#Define WM_XBUTTONDBLCLK                                             0x20D 
#Define WM_XBUTTONDOWN                                               0x20B 
#Define WM_XBUTTONUP                                                 0x20C 
#Define WPF_ASYNCWINDOWPLACEMENT                                     0x4 
#Define WPF_RESTORETOMAXIMIZED                                       0x2 
#Define WPF_SETMINPOSITION                                           0x1 
#Define WRITE_DAC                                                    0x40000 
#Define WRITE_OWNER                                                  0x80000 
#Define WS_ACTIVECAPTION                                             0x1 
#Define WS_BORDER                                                    0x800000 
#Define WS_CAPTION                                                   0xC00000 
#Define WS_CHILD                                                     0x40000000 
#Define WS_CHILDWINDOW                                               0x40000000 
#Define WS_CLIPCHILDREN                                              0x2000000 
#Define WS_CLIPSIBLINGS                                              0x4000000 
#Define WS_DISABLED                                                  0x8000000 
#Define WS_DLGFRAME                                                  0x400000 
#Define WS_EX_ACCEPTFILES                                            0x10 
#Define WS_EX_APPWINDOW                                              0x40000 
#Define WS_EX_CLIENTEDGE                                             0x200 
#Define WS_EX_CONTEXTHELP                                            0x400 
#Define WS_EX_CONTROLPARENT                                          0x10000 
#Define WS_EX_DLGMODALFRAME                                          0x1 
#Define WS_EX_LAYERED                                                0x80000 
#Define WS_EX_LAYOUTRTL                                              0x400000 
#Define WS_EX_LEFT                                                   0x0 
#Define WS_EX_LEFTSCROLLBAR                                          0x4000 
#Define WS_EX_LTRREADING                                             0x0 
#Define WS_EX_MDICHILD                                               0x40 
#Define WS_EX_NOACTIVATE                                             0x8000000 
#Define WS_EX_NOINHERITLAYOUT                                        0x100000 
#Define WS_EX_NOPARENTNOTIFY                                         0x4 
#Define WS_EX_OVERLAPPEDWINDOW                                       0x300 
#Define WS_EX_PALETTEWINDOW                                          0x188 
#Define WS_EX_RIGHT                                                  0x1000 
#Define WS_EX_RIGHTSCROLLBAR                                         0x0 
#Define WS_EX_RTLREADING                                             0x2000 
#Define WS_EX_STATICEDGE                                             0x20000 
#Define WS_EX_TOOLWINDOW                                             0x80 
#Define WS_EX_TOPMOST                                                0x8 
#Define WS_EX_TRANSPARENT                                            0x20 
#Define WS_EX_WINDOWEDGE                                             0x100 
#Define WS_GROUP                                                     0x20000 
#Define WS_GT                                                        0x30000 
#Define WS_HSCROLL                                                   0x100000 
#Define WS_ICONIC                                                    0x20000000 
#Define WS_MAXIMIZE                                                  0x1000000 
#Define WS_MAXIMIZEBOX                                               0x10000 
#Define WS_MINIMIZE                                                  0x20000000 
#Define WS_MINIMIZEBOX                                               0x20000 
#Define WS_OVERLAPPED                                                0x0 
#Define WS_OVERLAPPEDWINDOW                                          0xCF0000 
#Define WS_POPUP                                                     0x80000000 
#Define WS_POPUPWINDOW                                               0x80880000 
#Define WS_SIZEBOX                                                   0x40000 
#Define WS_SYSMENU                                                   0x80000 
#Define WS_TABSTOP                                                   0x10000 
#Define WS_THICKFRAME                                                0x40000 
#Define WS_TILED                                                     0x0 
#Define WS_TILEDWINDOW                                               0xCF0000 
#Define WS_VISIBLE                                                   0x10000000 
#Define WS_VSCROLL                                                   0x200000 

#Define XMLELEMTYPE_ELEMENT	0
#Define XMLELEMTYPE_TEXT	1
#Define XMLELEMTYPE_COMMENT	2
#Define XMLELEMTYPE_DOCUMENT	3
#Define XMLELEMTYPE_DTD	4
#Define XMLELEMTYPE_PI	5
#Define XMLELEMTYPE_OTHER	6

********************************************************************************
*!* From vsstyle.h uxtheme.h
********************************************************************************
#Define ABS_DOWNDISABLED                                             8 
#Define ABS_DOWNHOT                                                  6 
#Define ABS_DOWNHOVER                                                18 
#Define ABS_DOWNNORMAL                                               5 
#Define ABS_DOWNPRESSED                                              7 
#Define ABS_LEFTDISABLED                                             12 
#Define ABS_LEFTHOT                                                  10 
#Define ABS_LEFTHOVER                                                19 
#Define ABS_LEFTNORMAL                                               9 
#Define ABS_LEFTPRESSED                                              11 
#Define ABS_RIGHTDISABLED                                            16 
#Define ABS_RIGHTHOT                                                 14 
#Define ABS_RIGHTHOVER                                               20 
#Define ABS_RIGHTNORMAL                                              13 
#Define ABS_RIGHTPRESSED                                             15 
#Define ABS_UPDISABLED                                               4 
#Define ABS_UPHOT                                                    2 
#Define ABS_UPHOVER                                                  17 
#Define ABS_UPNORMAL                                                 1 
#Define ABS_UPPRESSED                                                3 
#Define AW_BUTTON                                                    5 
#Define AW_COMMANDAREA                                               4 
#Define AW_CONTENTAREA                                               3 
#Define AW_HEADERAREA                                                2 
#Define AW_S_CONTENTAREA_NOMARGIN                                    1 
#Define AW_S_HEADERAREA_NOMARGIN                                     1 
#Define AW_S_TITLEBAR_ACTIVE                                         1 
#Define AW_S_TITLEBAR_INACTIVE                                       2 
#Define AW_TITLEBAR                                                  1 
#Define BP_CHECKBOX                                                  3 
#Define BP_COMMANDLINK                                               6 
#Define BP_COMMANDLINKGLYPH                                          7 
#Define BP_GROUPBOX                                                  4 
#Define BP_PUSHBUTTON                                                1 
#Define BP_RADIOBUTTON                                               2 
#Define BP_USERBUTTON                                                5 
#Define CBB_DISABLED                                                 4 
#Define CBB_FOCUSED                                                  3 
#Define CBB_HOT                                                      2 
#Define CBB_NORMAL                                                   1 
#Define CBCB_DISABLED                                                4 
#Define CBCB_HOT                                                     2 
#Define CBCB_NORMAL                                                  1 
#Define CBCB_PRESSED                                                 3 
#Define CBRO_DISABLED                                                4 
#Define CBRO_HOT                                                     2 
#Define CBRO_NORMAL                                                  1 
#Define CBRO_PRESSED                                                 3 
#Define CBS_CHECKEDDISABLED                                          8 
#Define CBS_CHECKEDHOT                                               6 
#Define CBS_CHECKEDNORMAL                                            5 
#Define CBS_CHECKEDPRESSED                                           7 
#Define CBS_DISABLED                                                 4 
#Define CBS_EXCLUDEDDISABLED                                         20 
#Define CBS_EXCLUDEDHOT                                              18 
#Define CBS_EXCLUDEDNORMAL                                           17 
#Define CBS_EXCLUDEDPRESSED                                          19 
#Define CBS_HOT                                                      2 
#Define CBS_IMPLICITDISABLED                                         16 
#Define CBS_IMPLICITHOT                                              14 
#Define CBS_IMPLICITNORMAL                                           13 
#Define CBS_IMPLICITPRESSED                                          15 
#Define CBS_MIXEDDISABLED                                            12 
#Define CBS_MIXEDHOT                                                 10 
#Define CBS_MIXEDNORMAL                                              9 
#Define CBS_MIXEDPRESSED                                             11 
#Define CBS_NORMAL                                                   1 
#Define CBS_PUSHED                                                   3 
#Define CBS_UNCHECKEDDISABLED                                        4 
#Define CBS_UNCHECKEDHOT                                             2 
#Define CBS_UNCHECKEDNORMAL                                          1 
#Define CBS_UNCHECKEDPRESSED                                         3 
#Define CBTBS_DISABLED                                               3 
#Define CBTBS_FOCUSED                                                4 
#Define CBTBS_HOT                                                    2 
#Define CBTBS_NORMAL                                                 1 
#Define CBXS_DISABLED                                                4 
#Define CBXS_HOT                                                     2 
#Define CBXS_NORMAL                                                  1 
#Define CBXS_PRESSED                                                 3 
#Define CBXSL_DISABLED                                               4 
#Define CBXSL_HOT                                                    2 
#Define CBXSL_NORMAL                                                 1 
#Define CBXSL_PRESSED                                                3 
#Define CBXSR_DISABLED                                               4 
#Define CBXSR_HOT                                                    2 
#Define CBXSR_NORMAL                                                 1 
#Define CBXSR_PRESSED                                                3 
#Define CHEVS_HOT                                                    2 
#Define CHEVS_NORMAL                                                 1 
#Define CHEVS_PRESSED                                                3 
#Define CHEVSV_HOT                                                   2 
#Define CHEVSV_NORMAL                                                1 
#Define CHEVSV_PRESSED                                               3 
#Define CMDLGS_DEFAULTED                                             5 
#Define CMDLGS_DISABLED                                              4 
#Define CMDLGS_HOT                                                   2 
#Define CMDLGS_NORMAL                                                1 
#Define CMDLGS_PRESSED                                               3 
#Define CMDLS_DEFAULTED                                              5 
#Define CMDLS_DEFAULTED_ANIMATING                                    6 
#Define CMDLS_DISABLED                                               4 
#Define CMDLS_HOT                                                    2 
#Define CMDLS_NORMAL                                                 1 
#Define CMDLS_PRESSED                                                3 
#Define CP_BACKGROUND                                                2 
#Define CP_BORDER                                                    4 
#Define CP_CUEBANNER                                                 8 
#Define CP_DROPDOWNBUTTON                                            1 
#Define CP_DROPDOWNBUTTONLEFT                                        7 
#Define CP_DROPDOWNBUTTONRIGHT                                       6 
#Define CP_READONLY                                                  5 
#Define CP_TRANSPARENTBACKGROUND                                     3 
#Define CPANEL_BANNERAREA                                            18 
#Define CPANEL_BODYTEXT                                              6 
#Define CPANEL_BODYTITLE                                             19 
#Define CPANEL_BUTTON                                                14 
#Define CPANEL_CONTENTLINK                                           10 
#Define CPANEL_CONTENTPANE                                           2 
#Define CPANEL_CONTENTPANELABEL                                      4 
#Define CPANEL_CONTENTPANELINE                                       17 
#Define CPANEL_GROUPTEXT                                             9 
#Define CPANEL_HELPLINK                                              7 
#Define CPANEL_LARGECOMMANDAREA                                      12 
#Define CPANEL_MESSAGETEXT                                           15 
#Define CPANEL_NAVIGATIONPANE                                        1 
#Define CPANEL_NAVIGATIONPANELABEL                                   3 
#Define CPANEL_NAVIGATIONPANELINE                                    16 
#Define CPANEL_SECTIONTITLELINK                                      11 
#Define CPANEL_SMALLCOMMANDAREA                                      13 
#Define CPANEL_TASKLINK                                              8 
#Define CPANEL_TITLE                                                 5 
#Define CPCL_DISABLED                                                4 
#Define CPCL_HOT                                                     2 
#Define CPCL_NORMAL                                                  1 
#Define CPCL_PRESSED                                                 3 
#Define CPHL_DISABLED                                                4 
#Define CPHL_HOT                                                     2 
#Define CPHL_NORMAL                                                  1 
#Define CPHL_PRESSED                                                 3 
#Define CPSTL_HOT                                                    2 
#Define CPSTL_NORMAL                                                 1 
#Define CPTL_DISABLED                                                4 
#Define CPTL_HOT                                                     2 
#Define CPTL_NORMAL                                                  1 
#Define CPTL_PAGE                                                    5 
#Define CPTL_PRESSED                                                 3 
#Define CS_ACTIVE                                                    1 
#Define CS_DISABLED                                                  3 
#Define CS_INACTIVE                                                  2 
#Define CSST_TAB                                                     1 
#Define CSTB_HOT                                                     2 
#Define CSTB_NORMAL                                                  1 
#Define CSTB_SELECTED                                                3 
#Define DD_COPY                                                      1 
#Define DD_CREATELINK                                                4 
#Define DD_IMAGEBG                                                   7 
#Define DD_MOVE                                                      2 
#Define DD_NONE                                                      6 
#Define DD_TEXTBG                                                    8 
#Define DD_UPDATEMETADATA                                            3 
#Define DD_WARNING                                                   5 
#Define DDCOPY_HIGHLIGHT                                             1 
#Define DDCOPY_NOHIGHLIGHT                                           2 
#Define DDCREATELINK_HIGHLIGHT                                       1 
#Define DDCREATELINK_NOHIGHLIGHT                                     2 
#Define DDMOVE_HIGHLIGHT                                             1 
#Define DDMOVE_NOHIGHLIGHT                                           2 
#Define DDNONE_HIGHLIGHT                                             1 
#Define DDNONE_NOHIGHLIGHT                                           2 
#Define DDUPDATEMETADATA_HIGHLIGHT                                   1 
#Define DDUPDATEMETADATA_NOHIGHLIGHT                                 2 
#Define DDWARNING_HIGHLIGHT                                          1 
#Define DDWARNING_NOHIGHLIGHT                                        2 
#Define DNHZS_DISABLED                                               4 
#Define DNHZS_HOT                                                    2 
#Define DNHZS_NORMAL                                                 1 
#Define DNHZS_PRESSED                                                3 
#Define DNS_DISABLED                                                 4 
#Define DNS_HOT                                                      2 
#Define DNS_NORMAL                                                   1 
#Define DNS_PRESSED                                                  3 
#Define DP_DATEBORDER                                                2 
#Define DP_DATETEXT                                                  1 
#Define DP_SHOWCALENDARBUTTONRIGHT                                   3 
#Define DPDB_DISABLED                                                4 
#Define DPDB_FOCUSED                                                 3 
#Define DPDB_HOT                                                     2 
#Define DPDB_NORMAL                                                  1 
#Define DPDT_DISABLED                                                2 
#Define DPDT_NORMAL                                                  1 
#Define DPDT_SELECTED                                                3 
#Define DPSCBR_DISABLED                                              4 
#Define DPSCBR_HOT                                                   2 
#Define DPSCBR_NORMAL                                                1 
#Define DPSCBR_PRESSED                                               3 
#Define EBHC_HOT                                                     2 
#Define EBHC_NORMAL                                                  1 
#Define EBHC_PRESSED                                                 3 
#Define EBHP_HOT                                                     2 
#Define EBHP_NORMAL                                                  1 
#Define EBHP_PRESSED                                                 3 
#Define EBHP_SELECTEDHOT                                             5 
#Define EBHP_SELECTEDNORMAL                                          4 
#Define EBHP_SELECTEDPRESSED                                         6 
#Define EBM_HOT                                                      2 
#Define EBM_NORMAL                                                   1 
#Define EBM_PRESSED                                                  3 
#Define EBNGC_HOT                                                    2 
#Define EBNGC_NORMAL                                                 1 
#Define EBNGC_PRESSED                                                3 
#Define EBNGE_HOT                                                    2 
#Define EBNGE_NORMAL                                                 1 
#Define EBNGE_PRESSED                                                3 
#Define EBP_HEADERBACKGROUND                                         1 
#Define EBP_HEADERCLOSE                                              2 
#Define EBP_HEADERPIN                                                3 
#Define EBP_IEBARMENU                                                4 
#Define EBP_NORMALGROUPBACKGROUND                                    5 
#Define EBP_NORMALGROUPCOLLAPSE                                      6 
#Define EBP_NORMALGROUPEXPAND                                        7 
#Define EBP_NORMALGROUPHEAD                                          8 
#Define EBP_SPECIALGROUPBACKGROUND                                   9 
#Define EBP_SPECIALGROUPCOLLAPSE                                     10 
#Define EBP_SPECIALGROUPEXPAND                                       11 
#Define EBP_SPECIALGROUPHEAD                                         12 
#Define EBS_ASSIST                                                   6 
#Define EBS_DISABLED                                                 3 
#Define EBS_FOCUSED                                                  4 
#Define EBS_HOT                                                      2 
#Define EBS_NORMAL                                                   1 
#Define EBS_READONLY                                                 5 
#Define EBSGC_HOT                                                    2 
#Define EBSGC_NORMAL                                                 1 
#Define EBSGC_PRESSED                                                3 
#Define EBSGE_HOT                                                    2 
#Define EBSGE_NORMAL                                                 1 
#Define EBSGE_PRESSED                                                3 
#Define EBWBS_DISABLED                                               3 
#Define EBWBS_FOCUSED                                                4 
#Define EBWBS_HOT                                                    2 
#Define EBWBS_NORMAL                                                 1 
#Define EP_BACKGROUND                                                3 
#Define EP_BACKGROUNDWITHBORDER                                      5 
#Define EP_CARET                                                     2 
#Define EP_EDITBORDER_HSCROLL                                        7 
#Define EP_EDITBORDER_HVSCROLL                                       9 
#Define EP_EDITBORDER_NOSCROLL                                       6 
#Define EP_EDITBORDER_VSCROLL                                        8 
#Define EP_EDITTEXT                                                  1 
#Define EP_PASSWORD                                                  4 
#Define EPSH_DISABLED                                                4 
#Define EPSH_FOCUSED                                                 3 
#Define EPSH_HOT                                                     2 
#Define EPSH_NORMAL                                                  1 
#Define EPSHV_DISABLED                                               4 
#Define EPSHV_FOCUSED                                                3 
#Define EPSHV_HOT                                                    2 
#Define EPSHV_NORMAL                                                 1 
#Define EPSN_DISABLED                                                4 
#Define EPSN_FOCUSED                                                 3 
#Define EPSN_HOT                                                     2 
#Define EPSN_NORMAL                                                  1 
#Define EPSV_DISABLED                                                4 
#Define EPSV_FOCUSED                                                 3 
#Define EPSV_HOT                                                     2 
#Define EPSV_NORMAL                                                  1 
#Define ETS_ASSIST                                                   7 
#Define ETS_CUEBANNER                                                8 
#Define ETS_DISABLED                                                 4 
#Define ETS_FOCUSED                                                  5 
#Define ETS_HOT                                                      2 
#Define ETS_NORMAL                                                   1 
#Define ETS_READONLY                                                 6 
#Define ETS_SELECTED                                                 3 
#Define FBS_EMPHASIZED                                               2 
#Define FBS_NORMAL                                                   1 
#Define FLH_HOVER                                                    2 
#Define FLH_NORMAL                                                   1 
#Define FLS_DISABLED                                                 4 
#Define FLS_EMPHASIZED                                               3 
#Define FLS_NORMAL                                                   1 
#Define FLS_SELECTED                                                 2 
#Define FLYOUT_BODY                                                  2 
#Define FLYOUT_DIVIDER                                               5 
#Define FLYOUT_HEADER                                                1 
#Define FLYOUT_LABEL                                                 3 
#Define FLYOUT_LINK                                                  4 
#Define FLYOUT_LINKAREA                                              7 
#Define FLYOUT_LINKHEADER                                            8 
#Define FLYOUT_WINDOW                                                6 
#Define FLYOUTLINK_HOVER                                             2 
#Define FLYOUTLINK_NORMAL                                            1 
#Define FS_ACTIVE                                                    1 
#Define FS_INACTIVE                                                  2 
#Define GBS_DISABLED                                                 2 
#Define GBS_NORMAL                                                   1 
#Define GLPS_CLOSED                                                  1 
#Define GLPS_OPENED                                                  2 
#Define HBG_DETAILS                                                  1 
#Define HBG_ICON                                                     2 
#Define HBS_DISABLED                                                 4 
#Define HBS_HOT                                                      2 
#Define HBS_NORMAL                                                   1 
#Define HBS_PUSHED                                                   3 
#Define HDDFS_HOT                                                    3 
#Define HDDFS_NORMAL                                                 1 
#Define HDDFS_SOFTHOT                                                2 
#Define HDDS_HOT                                                     3 
#Define HDDS_NORMAL                                                  1 
#Define HDDS_SOFTHOT                                                 2 
#Define HGLPS_CLOSED                                                 1 
#Define HGLPS_OPENED                                                 2 
#Define HILS_HOT                                                     2 
#Define HILS_NORMAL                                                  1 
#Define HILS_PRESSED                                                 3 
#Define HIRS_HOT                                                     2 
#Define HIRS_NORMAL                                                  1 
#Define HIRS_PRESSED                                                 3 
#Define HIS_HOT                                                      2 
#Define HIS_ICONHOT                                                  8 
#Define HIS_ICONNORMAL                                               7 
#Define HIS_ICONPRESSED                                              9 
#Define HIS_ICONSORTEDHOT                                            11 
#Define HIS_ICONSORTEDNORMAL                                         10 
#Define HIS_ICONSORTEDPRESSED                                        12 
#Define HIS_NORMAL                                                   1 
#Define HIS_PRESSED                                                  3 
#Define HIS_SORTEDHOT                                                5 
#Define HIS_SORTEDNORMAL                                             4 
#Define HIS_SORTEDPRESSED                                            6 
#Define HOFS_HOT                                                     2 
#Define HOFS_NORMAL                                                  1 
#Define HP_HEADERDROPDOWN                                            5 
#Define HP_HEADERDROPDOWNFILTER                                      6 
#Define HP_HEADERITEM                                                1 
#Define HP_HEADERITEMLEFT                                            2 
#Define HP_HEADERITEMRIGHT                                           3 
#Define HP_HEADEROVERFLOW                                            7 
#Define HP_HEADERSORTARROW                                           4 
#Define HSAS_SORTEDDOWN                                              2 
#Define HSAS_SORTEDUP                                                1 
#Define HSS_DISABLED                                                 4 
#Define HSS_HOT                                                      2 
#Define HSS_NORMAL                                                   1 
#Define HSS_PUSHED                                                   3 
#Define HTS_DISABLED                                                 4 
#Define HTS_HOT                                                      2 
#Define HTS_NORMAL                                                   1 
#Define HTS_PUSHED                                                   3 
#Define LBCP_BORDER_HSCROLL                                          1 
#Define LBCP_BORDER_HVSCROLL                                         2 
#Define LBCP_BORDER_NOSCROLL                                         3 
#Define LBCP_BORDER_VSCROLL                                          4 
#Define LBCP_ITEM                                                    5 
#Define LBPSH_DISABLED                                               4 
#Define LBPSH_FOCUSED                                                2 
#Define LBPSH_HOT                                                    3 
#Define LBPSH_NORMAL                                                 1 
#Define LBPSHV_DISABLED                                              4 
#Define LBPSHV_FOCUSED                                               2 
#Define LBPSHV_HOT                                                   3 
#Define LBPSHV_NORMAL                                                1 
#Define LBPSI_HOT                                                    1 
#Define LBPSI_HOTSELECTED                                            2 
#Define LBPSI_SELECTED                                               3 
#Define LBPSI_SELECTEDNOTFOCUS                                       4 
#Define LBPSN_DISABLED                                               4 
#Define LBPSN_FOCUSED                                                2 
#Define LBPSN_HOT                                                    3 
#Define LBPSN_NORMAL                                                 1 
#Define LBPSV_DISABLED                                               4 
#Define LBPSV_FOCUSED                                                2 
#Define LBPSV_HOT                                                    3 
#Define LBPSV_NORMAL                                                 1 
#Define LISS_DISABLED                                                4 
#Define LISS_HOT                                                     2 
#Define LISS_HOTSELECTED                                             6 
#Define LISS_NORMAL                                                  1 
#Define LISS_SELECTED                                                3 
#Define LISS_SELECTEDNOTFOCUS                                        5 
#Define LVCB_HOVER                                                   2 
#Define LVCB_NORMAL                                                  1 
#Define LVCB_PUSHED                                                  3 
#Define LVEB_HOVER                                                   2 
#Define LVEB_NORMAL                                                  1 
#Define LVEB_PUSHED                                                  3 
#Define LVGH_CLOSE                                                   9 
#Define LVGH_CLOSEHOT                                                10 
#Define LVGH_CLOSEMIXEDSELECTION                                     15 
#Define LVGH_CLOSEMIXEDSELECTIONHOT                                  16 
#Define LVGH_CLOSESELECTED                                           11 
#Define LVGH_CLOSESELECTEDHOT                                        12 
#Define LVGH_CLOSESELECTEDNOTFOCUSED                                 13 
#Define LVGH_CLOSESELECTEDNOTFOCUSEDHOT                              14 
#Define LVGH_OPEN                                                    1 
#Define LVGH_OPENHOT                                                 2 
#Define LVGH_OPENMIXEDSELECTION                                      7 
#Define LVGH_OPENMIXEDSELECTIONHOT                                   8 
#Define LVGH_OPENSELECTED                                            3 
#Define LVGH_OPENSELECTEDHOT                                         4 
#Define LVGH_OPENSELECTEDNOTFOCUSED                                  5 
#Define LVGH_OPENSELECTEDNOTFOCUSEDHOT                               6 
#Define LVGHL_CLOSE                                                  9 
#Define LVGHL_CLOSEHOT                                               10 
#Define LVGHL_CLOSEMIXEDSELECTION                                    15 
#Define LVGHL_CLOSEMIXEDSELECTIONHOT                                 16 
#Define LVGHL_CLOSESELECTED                                          11 
#Define LVGHL_CLOSESELECTEDHOT                                       12 
#Define LVGHL_CLOSESELECTEDNOTFOCUSED                                13 
#Define LVGHL_CLOSESELECTEDNOTFOCUSEDHOT                             14 
#Define LVGHL_OPEN                                                   1 
#Define LVGHL_OPENHOT                                                2 
#Define LVGHL_OPENMIXEDSELECTION                                     7 
#Define LVGHL_OPENMIXEDSELECTIONHOT                                  8 
#Define LVGHL_OPENSELECTED                                           3 
#Define LVGHL_OPENSELECTEDHOT                                        4 
#Define LVGHL_OPENSELECTEDNOTFOCUSED                                 5 
#Define LVGHL_OPENSELECTEDNOTFOCUSEDHOT                              6 
#Define LVP_COLLAPSEBUTTON                                           9 
#Define LVP_COLUMNDETAIL                                             10 
#Define LVP_EMPTYTEXT                                                5 
#Define LVP_EXPANDBUTTON                                             8 
#Define LVP_GROUPHEADER                                              6 
#Define LVP_GROUPHEADERLINE                                          7 
#Define LVP_LISTDETAIL                                               3 
#Define LVP_LISTGROUP                                                2 
#Define LVP_LISTITEM                                                 1 
#Define LVP_LISTSORTEDDETAIL                                         4 
#Define MAXBS_DISABLED                                               4 
#Define MAXBS_HOT                                                    2 
#Define MAXBS_NORMAL                                                 1 
#Define MAXBS_PUSHED                                                 3 
#Define MB_ACTIVE                                                    1 
#Define MB_INACTIVE                                                  2 
#Define MBI_DISABLED                                                 4 
#Define MBI_DISABLEDHOT                                              5 
#Define MBI_DISABLEDPUSHED                                           6 
#Define MBI_HOT                                                      2 
#Define MBI_NORMAL                                                   1 
#Define MBI_PUSHED                                                   3 
#Define MC_BULLETDISABLED                                            4 
#Define MC_BULLETNORMAL                                              3 
#Define MC_CHECKMARKDISABLED                                         2 
#Define MC_CHECKMARKNORMAL                                           1 
#Define MCB_BITMAP                                                   3 
#Define MCB_DISABLED                                                 1 
#Define MCB_NORMAL                                                   2 
#Define MENU_BARBACKGROUND                                           7 
#Define MENU_BARITEM                                                 8 
#Define MENU_CHEVRON_TMSCHEMA                                        5 
#Define MENU_MENUBARDROPDOWN_TMSCHEMA                                4 
#Define MENU_MENUBARITEM_TMSCHEMA                                    3 
#Define MENU_MENUDROPDOWN_TMSCHEMA                                   2 
#Define MENU_MENUITEM_TMSCHEMA                                       1 
#Define MENU_POPUPBACKGROUND                                         9 
#Define MENU_POPUPBORDERS                                            10 
#Define MENU_POPUPCHECK                                              11 
#Define MENU_POPUPCHECKBACKGROUND                                    12 
#Define MENU_POPUPGUTTER                                             13 
#Define MENU_POPUPITEM                                               14 
#Define MENU_POPUPSEPARATOR                                          15 
#Define MENU_POPUPSUBMENU                                            16 
#Define MENU_SEPARATOR_TMSCHEMA                                      6 
#Define MENU_SYSTEMCLOSE                                             17 
#Define MENU_SYSTEMMAXIMIZE                                          18 
#Define MENU_SYSTEMMINIMIZE                                          19 
#Define MENU_SYSTEMRESTORE                                           20 
#Define MINBS_DISABLED                                               4 
#Define MINBS_HOT                                                    2 
#Define MINBS_NORMAL                                                 1 
#Define MINBS_PUSHED                                                 3 
#Define MNCS_ACTIVE                                                  1 
#Define MNCS_DISABLED                                                3 
#Define MNCS_INACTIVE                                                2 
#Define MPI_DISABLED                                                 3 
#Define MPI_DISABLEDHOT                                              4 
#Define MPI_HOT                                                      2 
#Define MPI_NORMAL                                                   1 
#Define MSM_DISABLED                                                 2 
#Define MSM_NORMAL                                                   1 
#Define MSYSC_DISABLED                                               2 
#Define MSYSC_NORMAL                                                 1 
#Define MSYSMN_DISABLED                                              2 
#Define MSYSMN_NORMAL                                                1 
#Define MSYSMX_DISABLED                                              2 
#Define MSYSMX_NORMAL                                                1 
#Define MSYSR_DISABLED                                               2 
#Define MSYSR_NORMAL                                                 1 
#Define MXCS_ACTIVE                                                  1 
#Define MXCS_DISABLED                                                3 
#Define MXCS_INACTIVE                                                2 
#Define NAV_BACKBUTTON                                               1 
#Define NAV_BB_DISABLED                                              4 
#Define NAV_BB_HOT                                                   2 
#Define NAV_BB_NORMAL                                                1 
#Define NAV_BB_PRESSED                                               3 
#Define NAV_FB_DISABLED                                              4 
#Define NAV_FB_HOT                                                   2 
#Define NAV_FB_NORMAL                                                1 
#Define NAV_FB_PRESSED                                               3 
#Define NAV_FORWARDBUTTON                                            2 
#Define NAV_MB_DISABLED                                              4 
#Define NAV_MB_HOT                                                   2 
#Define NAV_MB_NORMAL                                                1 
#Define NAV_MB_PRESSED                                               3 
#Define NAV_MENUBUTTON                                               3 
#Define PBBS_NORMAL                                                  1 
#Define PBBS_PARTIAL                                                 2 
#Define PBBVS_NORMAL                                                 1 
#Define PBBVS_PARTIAL                                                2 
#Define PBFS_ERROR                                                   2 
#Define PBFS_NORMAL                                                  1 
#Define PBFS_PARTIAL                                                 4 
#Define PBFS_PAUSED                                                  3 
#Define PBFVS_ERROR                                                  2 
#Define PBFVS_NORMAL                                                 1 
#Define PBFVS_PARTIAL                                                4 
#Define PBFVS_PAUSED                                                 3 
#Define PBS_DEFAULTED                                                5 
#Define PBS_DEFAULTED_ANIMATING                                      6 
#Define PBS_DISABLED                                                 4 
#Define PBS_HOT                                                      2 
#Define PBS_NORMAL                                                   1 
#Define PBS_PRESSED                                                  3 
#Define PP_BAR                                                       1 
#Define PP_BARVERT                                                   2 
#Define PP_CHUNK                                                     3 
#Define PP_CHUNKVERT                                                 4 
#Define PP_FILL                                                      5 
#Define PP_FILLVERT                                                  6 
#Define PP_MOVEOVERLAY                                               8 
#Define PP_MOVEOVERLAYVERT                                           10 
#Define PP_PULSEOVERLAY                                              7 
#Define PP_PULSEOVERLAYVERT                                          9 
#Define PP_TRANSPARENTBAR                                            11 
#Define PP_TRANSPARENTBARVERT                                        12 
#Define RBS_CHECKEDDISABLED                                          8 
#Define RBS_CHECKEDHOT                                               6 
#Define RBS_CHECKEDNORMAL                                            5 
#Define RBS_CHECKEDPRESSED                                           7 
#Define RBS_DISABLED                                                 4 
#Define RBS_HOT                                                      2 
#Define RBS_NORMAL                                                   1 
#Define RBS_PUSHED                                                   3 
#Define RBS_UNCHECKEDDISABLED                                        4 
#Define RBS_UNCHECKEDHOT                                             2 
#Define RBS_UNCHECKEDNORMAL                                          1 
#Define RBS_UNCHECKEDPRESSED                                         3 
#Define RP_BACKGROUND                                                6 
#Define RP_BAND                                                      3 
#Define RP_CHEVRON                                                   4 
#Define RP_CHEVRONVERT                                               5 
#Define RP_GRIPPER                                                   1 
#Define RP_GRIPPERVERT                                               2 
#Define RP_SPLITTER                                                  7 
#Define RP_SPLITTERVERT                                              8 
#Define SBP_ARROWBTN                                                 1 
#Define SBP_GRIPPERHORZ                                              8 
#Define SBP_GRIPPERVERT                                              9 
#Define SBP_LOWERTRACKHORZ                                           4 
#Define SBP_LOWERTRACKVERT                                           6 
#Define SBP_SIZEBOX                                                  10 
#Define SBP_THUMBBTNHORZ                                             2 
#Define SBP_THUMBBTNVERT                                             3 
#Define SBP_UPPERTRACKHORZ                                           5 
#Define SBP_UPPERTRACKVERT                                           7 
#Define SBS_DISABLED                                                 4 
#Define SBS_HOT                                                      2 
#Define SBS_NORMAL                                                   1 
#Define SBS_PUSHED                                                   3 
#Define SCRBS_DISABLED                                               4 
#Define SCRBS_HOT                                                    2 
#Define SCRBS_HOVER                                                  5 
#Define SCRBS_NORMAL                                                 1 
#Define SCRBS_PRESSED                                                3 
#Define SP_GRIPPER                                                   3 
#Define SP_GRIPPERPANE                                               2 
#Define SP_PANE                                                      1 
#Define SPLITS_HOT                                                   2 
#Define SPLITS_NORMAL                                                1 
#Define SPLITS_PRESSED                                               3 
#Define SPLITSV_HOT                                                  2 
#Define SPLITSV_NORMAL                                               1 
#Define SPLITSV_PRESSED                                              3 
#Define SPNP_DOWN                                                    2 
#Define SPNP_DOWNHORZ                                                4 
#Define SPNP_UP                                                      1 
#Define SPNP_UPHORZ                                                  3 
#Define SZB_HALFBOTTOMLEFTALIGN                                      6 
#Define SZB_HALFBOTTOMRIGHTALIGN                                     5 
#Define SZB_HALFTOPLEFTALIGN                                         8 
#Define SZB_HALFTOPRIGHTALIGN                                        7 
#Define SZB_LEFTALIGN                                                2 
#Define SZB_RIGHTALIGN                                               1 
#Define SZB_TOPLEFTALIGN                                             4 
#Define SZB_TOPRIGHTALIGN                                            3 
#Define TABP_AEROWIZARDBODY                                          11 
#Define TABP_BODY                                                    10 
#Define TABP_PANE                                                    9 
#Define TABP_TABITEM                                                 1 
#Define TABP_TABITEMBOTHEDGE                                         4 
#Define TABP_TABITEMLEFTEDGE                                         2 
#Define TABP_TABITEMRIGHTEDGE                                        3 
#Define TABP_TOPTABITEM                                              5 
#Define TABP_TOPTABITEMBOTHEDGE                                      8 
#Define TABP_TOPTABITEMLEFTEDGE                                      6 
#Define TABP_TOPTABITEMRIGHTEDGE                                     7 
#Define TDLG_BUTTONSECTION                                           10 
#Define TDLG_BUTTONWRAPPER                                           11 
#Define TDLG_COMMANDLINKPANE                                         7 
#Define TDLG_CONTENTICON                                             5 
#Define TDLG_CONTENTPANE                                             4 
#Define TDLG_CONTROLPANE                                             9 
#Define TDLG_EXPANDEDCONTENT                                         6 
#Define TDLG_EXPANDEDFOOTERAREA                                      18 
#Define TDLG_EXPANDOBUTTON                                           13 
#Define TDLG_EXPANDOTEXT                                             12 
#Define TDLG_FOOTNOTEAREA                                            16 
#Define TDLG_FOOTNOTEPANE                                            15 
#Define TDLG_FOOTNOTESEPARATOR                                       17 
#Define TDLG_IMAGEALIGNMENT                                          20 
#Define TDLG_MAINICON                                                3 
#Define TDLG_MAININSTRUCTIONPANE                                     2 
#Define TDLG_PRIMARYPANEL                                            1 
#Define TDLG_PROGRESSBAR                                             19 
#Define TDLG_RADIOBUTTONPANE                                         21 
#Define TDLG_SECONDARYPANEL                                          8 
#Define TDLG_VERIFICATIONTEXT                                        14 
#Define TDLGCPS_STANDALONE                                           1 
#Define TDLGEBS_EXPANDEDHOVER                                        5 
#Define TDLGEBS_EXPANDEDNORMAL                                       4 
#Define TDLGEBS_EXPANDEDPRESSED                                      6 
#Define TDLGEBS_HOVER                                                2 
#Define TDLGEBS_NORMAL                                               1 
#Define TDLGEBS_PRESSED                                              3 
#Define TEXT_BODYTEXT                                                4 
#Define TEXT_BODYTITLE                                               3 
#Define TEXT_CONTROLLABEL                                            9 
#Define TEXT_EXPANDED                                                7 
#Define TEXT_HYPERLINKTEXT                                           6 
#Define TEXT_INSTRUCTION                                             2 
#Define TEXT_LABEL                                                   8 
#Define TEXT_MAININSTRUCTION                                         1 
#Define TEXT_SECONDARYTEXT                                           5 
#Define TIBES_DISABLED                                               4 
#Define TIBES_FOCUSED                                                5 
#Define TIBES_HOT                                                    2 
#Define TIBES_NORMAL                                                 1 
#Define TIBES_SELECTED                                               3 
#Define TILES_DISABLED                                               4 
#Define TILES_FOCUSED                                                5 
#Define TILES_HOT                                                    2 
#Define TILES_NORMAL                                                 1 
#Define TILES_SELECTED                                               3 
#Define TIRES_DISABLED                                               4 
#Define TIRES_FOCUSED                                                5 
#Define TIRES_HOT                                                    2 
#Define TIRES_NORMAL                                                 1 
#Define TIRES_SELECTED                                               3 
#Define TIS_DISABLED                                                 4 
#Define TIS_FOCUSED                                                  5 
#Define TIS_HOT                                                      2 
#Define TIS_NORMAL                                                   1 
#Define TIS_SELECTED                                                 3 
#Define TKP_THUMB                                                    3 
#Define TKP_THUMBBOTTOM                                              4 
#Define TKP_THUMBLEFT                                                7 
#Define TKP_THUMBRIGHT                                               8 
#Define TKP_THUMBTOP                                                 5 
#Define TKP_THUMBVERT                                                6 
#Define TKP_TICS                                                     9 
#Define TKP_TICSVERT                                                 10 
#Define TKP_TRACK                                                    1 
#Define TKP_TRACKVERT                                                2 
#Define TKS_NORMAL                                                   1 
#Define TP_BUTTON                                                    1 
#Define TP_DROPDOWNBUTTON                                            2 
#Define TP_SEPARATOR                                                 5 
#Define TP_SEPARATORVERT                                             6 
#Define TP_SPLITBUTTON                                               3 
#Define TP_SPLITBUTTONDROPDOWN                                       4 
#Define TREIS_DISABLED                                               4 
#Define TREIS_HOT                                                    2 
#Define TREIS_HOTSELECTED                                            6 
#Define TREIS_NORMAL                                                 1 
#Define TREIS_SELECTED                                               3 
#Define TREIS_SELECTEDNOTFOCUS                                       5 
#Define TRS_NORMAL                                                   1 
#Define TRVS_NORMAL                                                  1 
#Define TS_CHECKED                                                   5 
#Define TS_CONTROLLABEL_DISABLED                                     2 
#Define TS_CONTROLLABEL_NORMAL                                       1 
#Define TS_DISABLED                                                  4 
#Define TS_HOT                                                       2 
#Define TS_HOTCHECKED                                                6 
#Define TS_HYPERLINK_DISABLED                                        4 
#Define TS_HYPERLINK_HOT                                             2 
#Define TS_HYPERLINK_NORMAL                                          1 
#Define TS_HYPERLINK_PRESSED                                         3 
#Define TS_NEARHOT                                                   7 
#Define TS_NORMAL                                                    1 
#Define TS_OTHERSIDEHOT                                              8 
#Define TS_PRESSED                                                   3 
#Define TSS_NORMAL                                                   1 
#Define TSVS_NORMAL                                                  1 
#Define TTBS_LINK                                                    2 
#Define TTBS_NORMAL                                                  1 
#Define TTBSS_POINTINGDOWNCENTERED                                   5 
#Define TTBSS_POINTINGDOWNLEFTWALL                                   6 
#Define TTBSS_POINTINGDOWNRIGHTWALL                                  4 
#Define TTBSS_POINTINGUPCENTERED                                     2 
#Define TTBSS_POINTINGUPLEFTWALL                                     1 
#Define TTBSS_POINTINGUPRIGHTWALL                                    3 
#Define TTCS_HOT                                                     2 
#Define TTCS_NORMAL                                                  1 
#Define TTCS_PRESSED                                                 3 
#Define TTIBES_DISABLED                                              4 
#Define TTIBES_FOCUSED                                               5 
#Define TTIBES_HOT                                                   2 
#Define TTIBES_NORMAL                                                1 
#Define TTIBES_SELECTED                                              3 
#Define TTILES_DISABLED                                              4 
#Define TTILES_FOCUSED                                               5 
#Define TTILES_HOT                                                   2 
#Define TTILES_NORMAL                                                1 
#Define TTILES_SELECTED                                              3 
#Define TTIRES_DISABLED                                              4 
#Define TTIRES_FOCUSED                                               5 
#Define TTIRES_HOT                                                   2 
#Define TTIRES_NORMAL                                                1 
#Define TTIRES_SELECTED                                              3 
#Define TTIS_DISABLED                                                4 
#Define TTIS_FOCUSED                                                 5 
#Define TTIS_HOT                                                     2 
#Define TTIS_NORMAL                                                  1 
#Define TTIS_SELECTED                                                3 
#Define TTP_BALLOON                                                  3 
#Define TTP_BALLOONSTEM                                              6 
#Define TTP_BALLOONTITLE                                             4 
#Define TTP_CLOSE                                                    5 
#Define TTP_STANDARD                                                 1 
#Define TTP_STANDARDTITLE                                            2 
#Define TTSS_LINK                                                    2 
#Define TTSS_NORMAL                                                  1 
#Define TUBS_DISABLED                                                5 
#Define TUBS_FOCUSED                                                 4 
#Define TUBS_HOT                                                     2 
#Define TUBS_NORMAL                                                  1 
#Define TUBS_PRESSED                                                 3 
#Define TUS_DISABLED                                                 5 
#Define TUS_FOCUSED                                                  4 
#Define TUS_HOT                                                      2 
#Define TUS_NORMAL                                                   1 
#Define TUS_PRESSED                                                  3 
#Define TUTS_DISABLED                                                5 
#Define TUTS_FOCUSED                                                 4 
#Define TUTS_HOT                                                     2 
#Define TUTS_NORMAL                                                  1 
#Define TUTS_PRESSED                                                 3 
#Define TUVLS_DISABLED                                               5 
#Define TUVLS_FOCUSED                                                4 
#Define TUVLS_HOT                                                    2 
#Define TUVLS_NORMAL                                                 1 
#Define TUVLS_PRESSED                                                3 
#Define TUVRS_DISABLED                                               5 
#Define TUVRS_FOCUSED                                                4 
#Define TUVRS_HOT                                                    2 
#Define TUVRS_NORMAL                                                 1 
#Define TUVRS_PRESSED                                                3 
#Define TUVS_DISABLED                                                5 
#Define TUVS_FOCUSED                                                 4 
#Define TUVS_HOT                                                     2 
#Define TUVS_NORMAL                                                  1 
#Define TUVS_PRESSED                                                 3 
#Define TVP_BRANCH                                                   3 
#Define TVP_GLYPH                                                    2 
#Define TVP_HOTGLYPH                                                 4 
#Define TVP_TREEITEM                                                 1 
#Define UPHZS_DISABLED                                               4 
#Define UPHZS_HOT                                                    2 
#Define UPHZS_NORMAL                                                 1 
#Define UPHZS_PRESSED                                                3 
#Define UPS_DISABLED                                                 4 
#Define UPS_HOT                                                      2 
#Define UPS_NORMAL                                                   1 
#Define UPS_PRESSED                                                  3 
#Define VSS_DISABLED                                                 4 
#Define VSS_HOT                                                      2 
#Define VSS_NORMAL                                                   1 
#Define VSS_PUSHED                                                   3 
#Define VTS_DISABLED                                                 4 
#Define VTS_HOT                                                      2 
#Define VTS_NORMAL                                                   1 
#Define VTS_PUSHED                                                   3 
#Define WP_CAPTION                                                   1 
#Define WP_CAPTIONSIZINGTEMPLATE                                     30 
#Define WP_CLOSEBUTTON                                               18 
#Define WP_DIALOG                                                    29 
#Define WP_FRAME                                                     38 
#Define WP_FRAMEBOTTOM                                               9 
#Define WP_FRAMEBOTTOMSIZINGTEMPLATE                                 36 
#Define WP_FRAMELEFT                                                 7 
#Define WP_FRAMELEFTSIZINGTEMPLATE                                   32 
#Define WP_FRAMERIGHT                                                8 
#Define WP_FRAMERIGHTSIZINGTEMPLATE                                  34 
#Define WP_HELPBUTTON                                                23 
#Define WP_HORZSCROLL                                                25 
#Define WP_HORZTHUMB                                                 26 
#Define WP_MAXBUTTON                                                 17 
#Define WP_MAXCAPTION                                                5 
#Define WP_MDICLOSEBUTTON                                            20 
#Define WP_MDIHELPBUTTON                                             24 
#Define WP_MDIMINBUTTON                                              16 
#Define WP_MDIRESTOREBUTTON                                          22 
#Define WP_MDISYSBUTTON                                              14 
#Define WP_MINBUTTON                                                 15 
#Define WP_MINCAPTION                                                3 
#Define WP_RESTOREBUTTON                                             21 
#Define WP_SMALLCAPTION                                              2 
#Define WP_SMALLCAPTIONSIZINGTEMPLATE                                31 
#Define WP_SMALLCLOSEBUTTON                                          19 
#Define WP_SMALLFRAMEBOTTOM                                          12 
#Define WP_SMALLFRAMEBOTTOMSIZINGTEMPLATE                            37 
#Define WP_SMALLFRAMELEFT                                            10 
#Define WP_SMALLFRAMELEFTSIZINGTEMPLATE                              33 
#Define WP_SMALLFRAMERIGHT                                           11 
#Define WP_SMALLFRAMERIGHTSIZINGTEMPLATE                             35 
#Define WP_SMALLMAXCAPTION                                           6 
#Define WP_SMALLMINCAPTION                                           4 
#Define WP_SYSBUTTON                                                 13 
#Define WP_VERTSCROLL                                                27 
#Define WP_VERTTHUMB                                                 28 
#Define VSCLASS_AEROWIZARD                                           Strconv("AEROWIZARD"+0h00,5) 
#Define VSCLASS_AEROWIZARDSTYLE                                      Strconv("AEROWIZARDSTYLE"+0h00,5) 
#Define VSCLASS_BUTTON                                               Strconv("BUTTON"+0h00,5) 
#Define VSCLASS_BUTTONSTYLE                                          Strconv("BUTTONSTYLE"+0h00,5) 
#Define VSCLASS_COMBOBOX                                             Strconv("COMBOBOX"+0h00,5) 
#Define VSCLASS_COMBOBOXSTYLE                                        Strconv("COMBOBOXSTYLE"+0h00,5) 
#Define VSCLASS_COMMUNICATIONS                                       Strconv("COMMUNICATIONS"+0h00,5) 
#Define VSCLASS_COMMUNICATIONSSTYLE                                  Strconv("COMMUNICATIONSSTYLE"+0h00,5) 
#Define VSCLASS_CONTROLPANEL                                         Strconv("CONTROLPANEL"+0h00,5) 
#Define VSCLASS_CONTROLPANELSTYLE                                    Strconv("CONTROLPANELSTYLE"+0h00,5) 
#Define VSCLASS_DATEPICKER                                           Strconv("DATEPICKER"+0h00,5) 
#Define VSCLASS_DATEPICKERSTYLE                                      Strconv("DATEPICKERSTYLE"+0h00,5) 
#Define VSCLASS_DRAGDROP                                             Strconv("DRAGDROP"+0h00,5) 
#Define VSCLASS_DRAGDROPSTYLE                                        Strconv("DRAGDROPSTYLE"+0h00,5) 
#Define VSCLASS_EDIT                                                 Strconv("EDIT"+0h00,5) 
#Define VSCLASS_EDITSTYLE                                            Strconv("EDITSTYLE"+0h00,5) 
#Define VSCLASS_EXPLORERBAR                                          Strconv("EXPLORERBAR"+0h00,5) 
#Define VSCLASS_EXPLORERBARSTYLE                                     Strconv("EXPLORERBARSTYLE"+0h00,5) 
#Define VSCLASS_FLYOUT                                               Strconv("FLYOUT"+0h00,5) 
#Define VSCLASS_FLYOUTSTYLE                                          Strconv("FLYOUTSTYLE"+0h00,5) 
#Define VSCLASS_HEADER                                               Strconv("HEADER"+0h00,5) 
#Define VSCLASS_HEADERSTYLE                                          Strconv("HEADERSTYLE"+0h00,5) 
#Define VSCLASS_LISTBOX                                              Strconv("LISTBOX"+0h00,5) 
#Define VSCLASS_LISTBOXSTYLE                                         Strconv("LISTBOXSTYLE"+0h00,5) 
#Define VSCLASS_LISTVIEW                                             Strconv("LISTVIEW"+0h00,5) 
#Define VSCLASS_LISTVIEWSTYLE                                        Strconv("LISTVIEWSTYLE"+0h00,5) 
#Define VSCLASS_MENU                                                 Strconv("MENU"+0h00,5) 
#Define VSCLASS_MENUSTYLE                                            Strconv("MENUSTYLE"+0h00,5) 
#Define VSCLASS_NAVIGATION                                           Strconv("NAVIGATION"+0h00,5) 
#Define VSCLASS_PROGRESS                                             Strconv("PROGRESS"+0h00,5) 
#Define VSCLASS_PROGRESSSTYLE                                        Strconv("PROGRESSSTYLE"+0h00,5) 
#Define VSCLASS_REBAR                                                Strconv("REBAR"+0h00,5) 
#Define VSCLASS_REBARSTYLE                                           Strconv("REBARSTYLE"+0h00,5) 
#Define VSCLASS_SCROLLBAR                                            Strconv("SCROLLBAR"+0h00,5) 
#Define VSCLASS_SCROLLBARSTYLE                                       Strconv("SCROLLBARSTYLE"+0h00,5) 
#Define VSCLASS_SPIN                                                 Strconv("SPIN"+0h00,5) 
#Define VSCLASS_SPINSTYLE                                            Strconv("SPINSTYLE"+0h00,5) 
#Define VSCLASS_STATUS                                               Strconv("STATUS"+0h00,5) 
#Define VSCLASS_STATUSSTYLE                                          Strconv("STATUSSTYLE"+0h00,5) 
#Define VSCLASS_TAB                                                  Strconv("TAB"+0h00,5) 
#Define VSCLASS_TABSTYLE                                             Strconv("TABSTYLE"+0h00,5) 
#Define VSCLASS_TASKDIALOG                                           Strconv("TASKDIALOG"+0h00,5) 
#Define VSCLASS_TASKDIALOGSTYLE                                      Strconv("TASKDIALOGSTYLE"+0h00,5) 
#Define VSCLASS_TEXTSTYLE                                            Strconv("TEXTSTYLE"+0h00,5) 
#Define VSCLASS_TOOLBAR                                              Strconv("TOOLBAR"+0h00,5) 
#Define VSCLASS_TOOLBARSTYLE                                         Strconv("TOOLBARSTYLE"+0h00,5) 
#Define VSCLASS_TOOLTIP                                              Strconv("TOOLTIP"+0h00,5) 
#Define VSCLASS_TOOLTIPSTYLE                                         Strconv("TOOLTIPSTYLE"+0h00,5) 
#Define VSCLASS_TRACKBAR                                             Strconv("TRACKBAR"+0h00,5) 
#Define VSCLASS_TRACKBARSTYLE                                        Strconv("TRACKBARSTYLE"+0h00,5) 
#Define VSCLASS_TREEVIEW                                             Strconv("TREEVIEW"+0h00,5) 
#Define VSCLASS_TREEVIEWSTYLE                                        Strconv("TREEVIEWSTYLE"+0h00,5) 
#Define VSCLASS_WINDOW                                               Strconv("WINDOW"+0h00,5) 
#Define VSCLASS_WINDOWSTYLE                                          Strconv("WINDOWSTYLE"+0h00,5) 


********************************************************************************
* FROM FOXPRO.H
********************************************************************************

*!* Sysmetric() parameter values
#Define SYSMETRIC_SCREENWIDTH                                        1 && Screen width
#Define SYSMETRIC_SCREENHEIGHT                                       2 && Screen width
#Define SYSMETRIC_SIZINGBORDERWIDTH                                  3 && Width of the sizing border around a resizable window
#Define SYSMETRIC_SIZINGBORDERHEIGHT                                 4 && Height of the sizing border around a resizable window
#Define SYSMETRIC_VSCROLLBARWIDTH                                    5 && Width of a vertical scroll bar
#Define SYSMETRIC_VSCROLLBARHEIGHT                                   6 && Height of the arrow bitmap on a vertical scroll bar
#Define SYSMETRIC_HSCROLLBARWIDTH                                    7 && Width of the arrow bitmap on a horizontal scroll bar
#Define SYSMETRIC_HSCROLLBARHEIGHT                                   8 && Height of a horizontal scroll bar
#Define SYSMETRIC_WINDOWTITLEHEIGHT                                  9 && Height of window title (caption) area
#Define SYSMETRIC_WINDOWBORDERWIDTH                                  10 && Width of a window border
#Define SYSMETRIC_WINDOWBORDERHEIGHT                                 11 && Height of a window border
#Define SYSMETRIC_WINDOWFRAMEWIDTH                                   12 && Width of the frame around the perimeter of a window that has a caption but is not sizable
#Define SYSMETRIC_WINDOWFRAMEHEIGHT                                  13 && Height of the frame around the perimeter of a window that has a caption but is not sizable
#Define SYSMETRIC_THUMBBOXWIDTH                                      14 && Width of the thumb box in a horizontal scroll bar
#Define SYSMETRIC_THUMBBOXHEIGHT                                     15 && Height of the thumb box in a vertical scroll bar
#Define SYSMETRIC_ICONWIDTH                                          16 && Width of an icon
#Define SYSMETRIC_ICONHEIGHT                                         17 && Height of an icon
#Define SYSMETRIC_CURSORWIDTH                                        18 && Width of a cursor
#Define SYSMETRIC_CURSORHEIGHT                                       19 && Height of a cursor
#Define SYSMETRIC_MENUBAR                                            20 && Height of a single-line menu bar
#Define SYSMETRIC_CLIENTWIDTH                                        21 && Width of the client area for a full-screen window
#Define SYSMETRIC_CLIENTHEIGHT                                       22 && Height of the client area for a full-screen window
#Define SYSMETRIC_KANJIWINHEIGHT                                     23 && Height of the Kanji window at the bottom of the screen in DBCS versions
#Define SYSMETRIC_MINDRAGWIDTH                                       24 && Minimum tracking width of a window. (The user cannot drag the window frame to a size smaller than this)
#Define SYSMETRIC_MINDRAGHEIGHT                                      25 && Minimum tracking height of a window. (The user cannot drag the window frame to a size smaller than this)
#Define SYSMETRIC_MINWINDOWWIDTH                                     26 && Minimum width of a window
#Define SYSMETRIC_MINWINDOWHEIGHT                                    27 && Minimum height of a window
#Define SYSMETRIC_TITLEBARBUTTONWIDTH                                28 && Width of a title bar button
#Define SYSMETRIC_TITLEBARBUTTONHEIGHT                               29 && Height of a title bar button
#Define SYSMETRIC_MOUSEPRESENT                                       30 && Is mouse present?1 => mouse is installed, 0 => no mouse is installed
#Define SYSMETRIC_DEBUGVERSION                                       31 && Is this a debug version?1 => debug version, 0 => retail version
#Define SYSMETRIC_MOUSEBUTTONSWAP                                    32 && Are mouse buttons swapped?1 => Yes, 0 => No
#Define SYSMETRIC_HALFHEIGHTBUTTONWIDTH                              33 && Width of a button in a half-height title bar
#Define SYSMETRIC_HALFHEIGHTBUTTONHEIGHT                             34 && Height of a button in a half-height title bar

*!* Window Borders
#Define BORDER_NONE                                                  0 
#Define BORDER_SINGLE                                                1 
#Define BORDER_DOUBLE                                                2 
#Define BORDER_SYSTEM                                                3 

*!* WindowState
#Define WINDOWSTATE_NORMAL                                           0 && Normal
#Define WINDOWSTATE_MINIMIZED                                        1 && Minimized
#Define WINDOWSTATE_MAXIMIZED                                        2 && Maximized

*!* Toolbar and Form Docking Positions
#Define TOOL_NOTDOCKED                                               -1 
#Define TOOL_TOP                                                     0 
#Define TOOL_LEFT                                                    1 
#Define TOOL_RIGHT                                                   2 
#Define TOOL_BOTTOM                                                  3 
#Define TOOL_TAB                                                     4 
#Define TOOL_LINK                                                    5 

*!* TYPE() tags
#Define T_BLOB                                                       "W"
#Define T_BOOLEAN                                                    "L"
#Define T_CHARACTER                                                  "C"
#Define T_CURRENCY                                                   "Y"
#Define T_DATE                                                       "D"
#Define T_DATETIME                                                   "T"
#Define T_DOUBLE                                                     "B"
#Define T_FLOAT                                                      "N"
#Define T_GENERAL                                                    "G"
#Define T_INTEGER                                                    "N"
#Define T_LOGICAL                                                    "L"
#Define T_MEMO                                                       "M"
#Define T_NULL                                                       "X"
#Define T_NUMERIC                                                    "N"
#Define T_OBJECT                                                     "O"
#Define T_SCREEN                                                     "S"
#Define T_UNDEFINED                                                  "U"
#Define T_UNKNOWN                                                    "U"
#Define T_VARBINARY                                                  "Q"
#Define T_VARCHAR                                                    "C"

*!* Button parameter masks
#Define BUTTON_LEFT                                                  1
#Define BUTTON_RIGHT                                                 2
#Define BUTTON_MIDDLE                                                4

*!* Function Parameters
*!* MessageBox parameters
#Define MB_OK                                                        0 && OK button only
#Define MB_OKCANCEL                                                  1 && OK and Cancel buttons
#Define MB_ABORTRETRYIGNORE                                          2 && Abort, Retry, and Ignore buttons
#Define MB_YESNOCANCEL                                               3 && Yes, No, and Cancel buttons
#Define MB_YESNO                                                     4 && Yes and No buttons
#Define MB_RETRYCANCEL                                               5 && Retry and Cancel buttons

#Define MB_ICONSTOP                                                  16 && Critical message
#Define MB_ICONQUESTION                                              32 && Warning query
#Define MB_ICONEXCLAMATION                                           48 && Warning message
#Define MB_ICONINFORMATION                                           64 && Information message

#Define MB_APPLMODAL                                                 0 && Application modal message box
#Define MB_DEFBUTTON1                                                0 && First button is default
#Define MB_DEFBUTTON2                                                256 && Second button is default
#Define MB_DEFBUTTON3                                                512 && Third button is default
#Define MB_SYSTEMMODAL                                               4096 && System Modal

*!* MousePointer
#Define MOUSE_DEFAULT                                                0 && 0 - Default
#Define MOUSE_ARROW                                                  1 && 1 - Arrow
#Define MOUSE_CROSSHAIR                                              2 && 2 - Cross
#Define MOUSE_IBEAM                                                  3 && 3 - I-Beam
#Define MOUSE_ICON_POINTER                                           4 && 4 - Icon
#Define MOUSE_SIZE_POINTER                                           5 && 5 - Size
#Define MOUSE_SIZE_NE_SW                                             6 && 6 - Size NE SW
#Define MOUSE_SIZE_N_S                                               7 && 7 - Size N S
#Define MOUSE_SIZE_NW_SE                                             8 && 8 - Size NW SE
#Define MOUSE_SIZE_W_E                                               9 && 9 - Size W E
#Define MOUSE_UP_ARROW                                               10 && 10 - Up Arrow
#Define MOUSE_HOURGLASS                                              11 && 11 - Hourglass
#Define MOUSE_NO_DROP                                                12 && 12 - No drop
#Define MOUSE_HIDE_POINTER                                           13 && 13 - Hide Pointer
#Define MOUSE_ARROW2                                                 14 && 14 - Arrow
#Define MOUSE_CUSTOM                                                 99 && 99 - Custom
