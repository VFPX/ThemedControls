********************************************************************************
*!* ctl32_api.prg
********************************************************************************
*!* |http://www.codeplex.com/VFPX/Thread/View.aspx?ThreadId=11535
*!* GDIPLUSX method of declaring and protecting api declares
*!* 200+ API declares and counting...
********************************************************************************
#Include ctl32.h

If Not Sys(16) $ Upper(Set("Procedure")) Then
	Set Procedure To Sys(16) Additive
Endif

Return

Function apiAppendMenu
	Lparameters hMenu, wFlags, uIDNewItem, lpNewItem
	Declare Integer AppendMenu In win32api As apiAppendMenu ;
		Integer hMenu, ;
		Integer wFlags, ;
		Integer uIDNewItem, ;
		String  lpNewItem
	Return apiAppendMenu(m.hMenu, m.wFlags, m.uIDNewItem, m.lpNewItem)
Endfunc

Function apiAttachThreadInput
	Lparameters idAttach, idAttachTo, fAttach
	Declare Integer AttachThreadInput In win32api As apiAttachThreadInput;
		Integer idAttach, ;
		Integer idAttachTo, ;
		Integer fAttach
	Return apiAttachThreadInput(m.idAttach, m.idAttachTo, m.fAttach)
Endfunc

Function apiBitBlt
	Lparameters hdcDest, nXDest, nYDest, nWidth, nHeight, hdcSrc, nXSrc, nYSrc, dwRop
	Declare Integer BitBlt In win32api As apiBitBlt ;
		Integer hdcDest, ;
		Integer nXDest, ;
		Integer nYDest, ;
		Integer nWidth, ;
		Integer nHeight, ;
		Integer hdcSrc, ;
		Integer nXSrc, ;
		Integer nYSrc, ;
		Integer dwRop
	Return apiBitBlt(m.hdcDest, m.nXDest, m.nYDest, m.nWidth, m.nHeight, m.hdcSrc, m.nXSrc, m.nYSrc, m.dwRop)
Endfunc

Function apiCallWindowProc
	Lparameters lpPrevWndFunc, nhWnd, Msg, wParam, Lparam
	Declare Integer CallWindowProc In win32api As apiCallWindowProc ;
		Integer lpPrevWndFunc, ;
		Integer nhWnd, ;
		Integer msg, ;
		Integer wParam, ;
		Integer Lparam
	Return apiCallWindowProc(m.lpPrevWndFunc, m.nhWnd, m.Msg, m.wParam, m.lParam)
Endfunc

Function apiCheckMenuItem
	Lparameters hMenu, uIDCheckItem, uCheck
	Declare Integer CheckMenuItem In win32api As apiCheckMenuItem ;
		Integer hmenu, ;
		Integer uIDCheckItem, ;
		Integer uCheck
	Return apiCheckMenuItem(m.hMenu, m.uIDCheckItem, m.uCheck)
Endfunc

Function apiCheckMenuRadioItem
	Lparameters hMenu, idFirst, idLast, idCheck, uFlags
	Declare Integer CheckMenuRadioItemA In win32api As apiCheckMenuRadioItem ;
		Integer hmenu, ;
		Integer idFirst, ;
		Integer idLast, ;
		Integer idCheck, ;
		Integer uFlags
	Return apiCheckMenuRadioItem(m.hMenu, m.idFirst, m.idLast, m.idCheck, m.uFlags)
Endfunc

Function apiChildWindowFromPoint
	Lparameters nHwndParent, px, py
	Declare Integer ChildWindowFromPoint In win32api As apiChildWindowFromPoint ;
		Integer nHwndParent,;
		Integer px,;
		Integer py
	Return apiChildWindowFromPoint(m.nHwndParent, m.px, m.py)
Endfunc

Function apiClientToScreen
	Lparameters nhWnd, lpPoint
	Declare Integer ClientToScreen In win32api As apiClientToScreen ;
		Integer nhWnd, ;
		String  @lpPoint
	Return apiClientToScreen(m.nhWnd, @m.lpPoint)
Endfunc

Function apiCloseHandle
	Lparameters hObject
	Declare Integer CloseHandle In win32api As apiCloseHandle ;
		Integer hObject
	Return apiCloseHandle(m.hObject)
Endfunc

Function apiClosePrinter
	Lparameters hPrinter
	Declare Integer ClosePrinter In winspool.drv As apiClosePrinter ;
		Integer hPrinter
	Return apiClosePrinter(m.hPrinter)
Endfunc

Function apiCloseThemeData
	Lparameters hTheme
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer CloseThemeData In uxtheme As apiCloseThemeData ;
			Integer hTheme
		Return apiCloseThemeData(m.hTheme)
	Else
		Return 0
	Endif
Endfunc

Function apiCoCreateGuid
	Lparameters pguid
	Declare Integer CoCreateGuid In Ole32 As apiCoCreateGuid;
		String  @pguid
	Return apiCoCreateGuid(@m.pguid)
Endfunc

Function apiColorAdjustLuma
	Lparameters clrRGB, nLum, fScale
	Declare Integer ColorAdjustLuma In shlwapi.Dll As apiColorAdjustLuma ;
		Integer clrRGB, ;
		Integer nLum, ;
		Integer fScale
	Return apiColorAdjustLuma(m.clrRGB, m.nLum, m.fScale)
Endfunc

Function apiColorRGBToHLS
	Lparameters clrRGB, pwHue, pwLuminance, pwSaturation
	Declare ColorRGBToHLS In shlwapi.Dll As apiColorRGBToHLS ;
		Integer clrRGB,;
		Integer @pwHue,;
		Integer @pwLuminance,;
		Integer @pwSaturation
	Return apiColorRGBToHLS(clrRGB, @pwHue, @pwLuminance, @pwSaturation)
Endfunc

Function apiCommDlgExtendedError()
	Declare Integer CommDlgExtendedError In comdlg32.Dll As apiCommDlgExtendedError
	Return apiCommDlgExtendedError()
Endfunc

Function apiCoTaskMemFree
	Lparameters Pv
	Declare CoTaskMemFree In ole32.Dll As apiCoTaskMemFree ;
		Integer Pv
	Return apiCoTaskMemFree(m.pv)
Endfunc

Function apiCreateCompatibleBitmap
	Lparameters hdc, nWidth, nHeight
	Declare Integer CreateCompatibleBitmap In win32api As apiCreateCompatibleBitmap ;
		Integer hdc,;
		Integer nWidth,;
		Integer nHeight
	Return apiCreateCompatibleBitmap(m.hdc, m.nWidth, m.nHeight)
Endfunc

Function apiCreateCompatibleDC
	Lparameters hdc
	Declare Integer CreateCompatibleDC In win32api As apiCreateCompatibleDC ;
		Integer hdc
	Return apiCreateCompatibleDC(m.hdc)
Endfunc

Function apiCreateFile
	Lparameters lpFileName, dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwCreationDisposition, dwFlagsAndAttributes, hTemplateFile
	Declare Integer CreateFile In win32api As apiCreateFile ;
		String  lpFileName, ;
		Integer dwDesiredAccess, ;
		Integer dwShareMode, ;
		Integer lpSecurityAttributes, ;
		Integer dwCreationDisposition, ;
		Integer dwFlagsAndAttributes, ;
		Integer hTemplateFile
	Return apiCreateFile(m.lpFileName, m.dwDesiredAccess, m.dwShareMode, m.lpSecurityAttributes, m.dwCreationDisposition, m.dwFlagsAndAttributes, m.hTemplateFile)
Endfunc

Function apiCreateFont
	Lparameters nHeight, nWidth, nEscapement, nOrientation, fnWeight, fdwItalic, fdwUnderline, fdwStrikeOut, fdwCharSet, fdwOutputPrecision, fdwClipPrecision, fdwQuality, fdwPitchAndFamily, lpszFace
	*!* lpszFace
	*!* [in] Pointer to a null-terminated String that specifies the typeface
	*!* name of the font. The length of this String must not exceed 32 characters,
	*!* including the terminating null character.
	Declare Integer CreateFont In win32api As apiCreateFont ;
		Integer nHeight, ;
		Integer nWidth, ;
		Integer nEscapement, ;
		Integer nOrientation, ;
		Integer fnWeight, ;
		Integer fdwItalic, ;
		Integer fdwUnderline, ;
		Integer fdwStrikeOut, ;
		Integer fdwCharSet, ;
		Integer fdwOutputPrecision, ;
		Integer fdwClipPrecision, ;
		Integer fdwQuality, ;
		Integer fdwPitchAndFamily, ;
		String  lpszFace
	Return apiCreateFont(m.nHeight, m.nWidth, m.nEscapement, m.nOrientation, m.fnWeight, m.fdwItalic, m.fdwUnderline, m.fdwStrikeOut, m.fdwCharSet, m.fdwOutputPrecision, m.fdwClipPrecision, m.fdwQuality, m.fdwPitchAndFamily, m.lpszFace)
Endfunc

Function apiCreateFontIndirect
	Lparameters lpLogFont
	Declare Integer CreateFontIndirect In win32api As apiCreateFontIndirect ;
		String  lpLogFont
	Return apiCreateFontIndirect(m.lpLogFont)
Endfunc

Function apiCreateMenu()
	Declare Integer CreateMenu In win32api As apiCreateMenu
	Return apiCreateMenu()
Endfunc

Function apiCreatePatternBrush
	Lparameters hBitmap
	Declare Integer CreatePatternBrush In gdi32 As apiCreatePatternBrush ;
		Integer hBitmap
	Return apiCreatePatternBrush(m.hBitmap)
Endfunc

Function apiCreatePopupMenu()
	Declare Integer CreatePopupMenu In win32api As apiCreatePopupMenu
	Return apiCreatePopupMenu()
Endfunc

Function apiCreateRectRgn
	Lparameters x1, y1, x2, y2
	Declare Integer CreateRectRgn In win32api As apiCreateRectRgn ;
		Integer x1, ;
		Integer y1, ;
		Integer x2, ;
		Integer y2
	Return apiCreateRectRgn(m.x1, m.y1, m.x2, m.y2)
Endfunc

Function apiCreateSolidBrush
	Lparameters crColor
	Declare Integer CreateSolidBrush In win32api As apiCreateSolidBrush ;
		Integer crColor
	Return apiCreateSolidBrush(m.crColor)
Endfunc

Function apiCreateWindowEx
	Lparameters dwExStyle, lpClassName, lpWindowName, dwStyle, nx, ny, nWidth, nHeight, nHwndParent, hMenu, hInstance, lpParam
	Declare Integer CreateWindowEx In win32api As apiCreateWindowEx ;
		Integer dwExStyle, ;
		String  lpClassName, ;
		String  lpWindowName, ;
		Integer dwStyle, ;
		Integer nx, ;
		Integer ny, ;
		Integer nWidth, ;
		Integer nHeight, ;
		Integer nHwndParent, ;
		Integer hMenu, ;
		Integer hInstance, ;
		Integer lpParam
	Return apiCreateWindowEx(m.dwExStyle, m.lpClassName, m.lpWindowName, m.dwStyle, m.nx, m.ny, m.nWidth, m.nHeight, m.nHwndParent, m.hMenu, m.hInstance, m.lpParam)
Endfunc

Function apiDeleteObject
	Lparameters hObject
	Declare Integer DeleteObject In win32api As apiDeleteObject;
		Integer hObject
	Return apiDeleteObject(m.hObject)
Endfunc

Function apiDeleteUrlCacheEntry
	Lparameters lpszUrlName
	Declare Integer apiDeleteUrlCacheEntry In wininet.Dll As apiDeleteUrlCacheEntry ;
		String  lpszUrlName
	Return apiDeleteUrlCacheEntry(m.lpszUrlName)
Endfunc

Function apiDestroyMenu
	Lparameters hMenu
	Declare Integer DestroyMenu In win32api As apiDestroyMenu;
		Integer hMenu
	Return apiDestroyMenu(m.hMenu)
Endfunc

Function apiDestroyWindow
	Lparameters nhWnd
	Declare Integer DestroyWindow In win32api As apiDestroyWindow ;
		Integer nhWnd
	Return apiDestroyWindow(m.nhWnd)
Endfunc

Function apiDrawIconEx
	Lparameters hdc, xLeft, yTop, hIcon, cxWidth, cyWidth, istepIfAniCur, hbrFlickerFreeDraw, diFlags
	Declare Integer DrawIconEx In win32api As apiDrawIconEx ;
		Integer hdc, ;
		Integer xLeft, ;
		Integer yTop, ;
		Integer hIcon, ;
		Integer cxWidth, ;
		Integer cyWidth, ;
		Integer istepIfAniCur, ;
		Integer hbrFlickerFreeDraw, ;
		Integer diFlags
	Return apiDrawIconEx(m.hdc, m.xLeft, m.yTop, m.hIcon, m.cxWidth, m.cyWidth, m.istepIfAniCur, m.hbrFlickerFreeDraw, m.diFlags)
Endfunc

Function apiDrawThemeBackground
	Lparameters hTheme, hdc, iPartId, iStateId, pRect, pClipRect
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer DrawThemeBackground In uxtheme As apiDrawThemeBackground ;
			Integer hTheme, ;
			Integer hdc, ;
			Integer iPartId, ;
			Integer iStateId, ;
			String  pRect, ;
			String  pClipRect
		Return apiDrawThemeBackground(m.hTheme, m.hdc, m.iPartId, m.iStateId, m.pRect, m.pClipRect)
	Else
		Return 0
	Endif
Endfunc

Function apiEnableMenuItem
	Lparameters hMenu, uIDEnableItem, uEnable
	Declare Integer EnableMenuItem In win32api As apiEnableMenuItem;
		Integer hMenu, ;
		Integer uIDEnableItem, ;
		Integer uEnable
	Return apiEnableMenuItem(m.hMenu, m.uIDEnableItem, m.uEnable)
Endfunc

Function apiEnableWindow
	Lparameters nhWnd, bEnable
	Declare Integer EnableWindow In win32api As apiEnableWindow ;
		Integer nhWnd, ;
		Integer bEnable
	Return apiEnableWindow(m.nhWnd, m.bEnable)
Endfunc

Function apiEndDocPrinter
	Lparameters hPrinter
	Declare Integer EndDocPrinter In winspool.drv As apiEndDocPrinter;
		Integer hPrinter
	Return apiEndDocPrinter(m.hPrinter)
Endfunc

Function apiFileTimeToLocalFileTime
	Lparameters lpFileTime, lpLocalFileTime
	Declare Integer FileTimeToLocalFileTime In win32api As apiFileTimeToLocalFileTime ;
		Integer lpFileTime, ;
		Integer lpLocalFileTime
	Return apiFileTimeToLocalFileTime(m.lpFileTime, m.lpLocalFileTime)
Endfunc

Function apiFileTimeToSystemTime
	Lparameters lpFileTime, lpSystemTime
	Declare Integer FileTimeToSystemTime In win32api As apiFileTimeToSystemTime ;
		Integer lpFileTime, ;
		Integer lpSystemTime
	Return apiFileTimeToSystemTime(m.lpFileTime, m.lpSystemTime)
Endfunc

Function apiFillRect
	Lparameters hdc, lprc, hbr
	Declare Integer FillRect In win32api As apiFillRect ;
		Integer hDC, ;
		Integer lprc, ;
		Integer hbr
	Return apiFillRect(m.hdc, m.lprc, m.hbr)
Endfunc

Function apiFindClose
	Lparameters hFindFile
	Declare Integer FindClose In win32api As apiFindClose ;
		Integer hFindFile
	Return apiFindClose(m.hFindFile)
Endfunc

Function apiFindFirstFile
	Lparameters lpFileName, lpFindFileData
	Declare Integer FindFirstFile In win32api As apiFindFirstFile ;
		String  lpFileName, ;
		Integer lpFindFileData
	Return apiFindFirstFile(m.lpFileName, m.lpFindFileData)
Endfunc

Function apiFindNextFile
	Lparameters hFindFile, lpFindFileData
	Declare Integer FindNextFile In win32api As apiFindNextFile ;
		Integer hFindFile, ;
		Integer lpFindFileData
	Return apiFindNextFile(m.hFindFile, m.lpFindFileData)
Endfunc

Function apiFindWindow
	Lparameters lpClassName, lpWindowName
	Declare Integer FindWindow In win32api As apiFindWindow;
		String  lpClassName, ;
		String  lpWindowName
	Return apiFindWindow(m.lpClassName, m.lpWindowName)
Endfunc

Function apiFindWindowEx
	Lparameters hWnd1, hWnd2, lpsz1, lpsz2
	Declare Integer FindWindowEx In win32api As apiFindWindowEx ;
		Integer hWnd1, ;
		Integer hWnd2, ;
		String  lpsz1, ;
		String  lpsz2
	Return apiFindWindowEx(m.hWnd1, m.hWnd2, m.lpsz1, m.lpsz2)
Endfunc

Function apiFormatMessage
	Lparameters dwFlags, lpSource, dwMessageId, dwLanguageId, lpBuffer, nSize, Arguments
	Declare Integer FormatMessage In win32api As apiFormatMessage ;
		Integer dwFlags, ;
		Integer lpSource, ;
		Integer dwMessageId, ;
		Integer dwLanguageId, ;
		String  @lpBuffer, ;
		Integer nSize, ;
		Integer Arguments
	Return apiFormatMessage(m.dwFlags, m.lpSource, m.dwMessageId, m.dwLanguageId, @m.lpBuffer, m.nSize, m.Arguments)
Endfunc

Function apiFreeLibrary
	Lparameters hLibModule
	Declare Integer FreeLibrary In win32api As apiFreeLibrary ;
		Integer hLibModule
	Return apiFreeLibrary(m.hLibModule)
Endfunc

Function apiFtpCommand
	Lparameters hConnect, fExpectResponse, dwFlags, lpszCommand, dwContext, phFtpCommand
	Declare Integer FtpCommand In wininet As apiFtpCommand ;
		Integer hConnect, ;
		Integer fExpectResponse, ;
		Integer dwFlags, ;
		String  lpszCommand, ;
		Integer dwContext, ;
		Integer @phFtpCommand
	Return apiFtpCommand(m.hConnect, m.fExpectResponse, m.dwFlags, m.lpszCommand, m.dwContext, @m.phFtpCommand)
Endfunc

Function apiFtpCreateDirectory
	Lparameters hConnect, lpszDirectory
	Declare Integer FtpCreateDirectory In wininet As apiFtpCreateDirectory ;
		Integer hConnect, ;
		String  lpszDirectory
	Return apiFtpCreateDirectory(m.hConnect, m.lpszDirectory)
Endfunc

Function apiFtpDeleteFile
	Lparameters hConnect, lpszFileName
	Declare Integer FtpDeleteFile In wininet As apiFtpDeleteFile ;
		Integer hConnect, ;
		String  lpszFileName
	Return apiFtpDeleteFile(m.hConnect, m.lpszFileName)
Endfunc

Function apiFtpFindFirstFile
	Lparameters hConnect, lpszSearchFile, lpFindFileData, dwFlags, dwContext
	Declare Integer FtpFindFirstFile In wininet As apiFtpFindFirstFile ;
		Integer hConnect, ;
		String  lpszSearchFile, ;
		Integer lpFindFileData, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiFtpFindFirstFile(m.hConnect, m.lpszSearchFile, m.lpFindFileData, m.dwFlags, m.dwContext)
Endfunc

Function apiFtpGetCurrentDirectory
	Lparameters hConnect, lpszCurrentDirectory, lpdwCurrentDirectory
	Declare Integer FtpGetCurrentDirectory In wininet As apiFtpGetCurrentDirectory ;
		Integer hConnect, ;
		String  @lpszCurrentDirectory, ;
		Integer @lpdwCurrentDirectory
	Return apiFtpGetCurrentDirectory(m.hConnect, @m.lpszCurrentDirectory, @m.lpdwCurrentDirectory)
Endfunc

Function apiFtpGetFile
	Lparameters hConnect, lpszRemoteFile, lpszNewFile, fFailIfExists, dwFlagsAndAttributes, dwFlags, dwContext
	Declare Integer FtpGetFile In wininet As apiFtpGetFile ;
		Integer hConnect, ;
		String  lpszRemoteFile, ;
		String  lpszNewFile, ;
		Integer fFailIfExists, ;
		Integer dwFlagsAndAttributes, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiFtpGetFile(m.hConnect, m.lpszRemoteFile, m.lpszNewFile, m.fFailIfExists, m.dwFlagsAndAttributes, m.dwFlags, m.dwContext)
Endfunc

Function apiFtpGetFileSize
	Lparameters hFile, lpdwFileSizeHigh
	Declare Integer FtpGetFileSize In wininet As apiFtpGetFileSize ;
		Integer hFile, ;
		Integer @lpdwFileSizeHigh
	Return apiFtpGetFileSize(m.hFile, @m.lpdwFileSizeHigh)
Endfunc

Function apiFtpOpenFile
	Lparameters hConnect, lpszFileName, dwAccess, dwFlags, dwContext
	Declare Integer FtpOpenFile In wininet As apiFtpOpenFile ;
		Integer hConnect, ;
		String  lpszFileName, ;
		Integer dwAccess, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiFtpOpenFile(m.hConnect, m.lpszFileName, m.dwAccess, m.dwFlags, m.dwContext)
Endfunc

Function apiFtpPutFile
	Lparameters hConnect, lpszLocalFile, lpszNewRemoteFile, dwFlags, dwContext
	Declare Integer FtpPutFile In wininet As apiFtpPutFile ;
		Integer hConnect, ;
		String  lpszLocalFile, ;
		String  lpszNewRemoteFile, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiFtpPutFile(m.hConnect, m.lpszLocalFile, m.lpszNewRemoteFile, m.dwFlags, m.dwContext)
Endfunc

Function apiFtpRemoveDirectory
	Lparameters hConnect, lpszDirectory
	Declare Integer FtpRemoveDirectory In wininet As apiFtpRemoveDirectory ;
		Integer hConnect, ;
		String  lpszDirectory
	Return apiFtpRemoveDirectory(m.hConnect, m.lpszDirectory)
Endfunc

Function apiFtpRenameFile
	Lparameters hConnect, lpszExisting, lpszNew
	Declare Integer FtpRenameFile In wininet As apiFtpRenameFile ;
		Integer hConnect, ;
		String  lpszExisting, ;
		String  lpszNew
	Return apiFtpRenameFile(m.hConnect, m.lpszExisting, m.lpszNew)
Endfunc

Function apiFtpSetCurrentDirectory
	Lparameters hConnect, lpszDirectory
	Declare Integer FtpSetCurrentDirectory In wininet As apiFtpSetCurrentDirectory ;
		Integer hConnect, ;
		String  lpszDirectory
	Return apiFtpSetCurrentDirectory(m.hConnect, m.lpszDirectory)
Endfunc

Function apiGetActiveWindow()
	Declare Integer GetActiveWindow In win32api As apiGetActiveWindow
	Return apiGetActiveWindow()
Endfunc

Function apiGetCaretPos
	Lparameters lpPoint
	Declare Integer GetCaretPos In win32api As apiGetCaretPos;
		String  @lpPoint
	Return apiGetCaretPos(@m.lpPoint)
Endfunc

Function apiGetClassLong
	Lparameters nhWnd, nIndex
	Declare Integer GetClassLong In win32api As apiGetClassLong;
		Integer nhWnd, ;
		Integer nIndex
	Return apiGetClassLong(m.nhWnd, m.nIndex)
Endfunc

Function apiGetClientRect
	Lparameters nhWnd, lcRect
	Declare Integer GetClientRect In win32api As apiGetClientRect ;
		Integer nhWnd,;
		String  @lcRect
	Return apiGetClientRect(m.nhWnd, @m.lcRect)
Endfunc

Function apiGetCursorPos
	Lparameters lpPoint
	Declare Integer GetCursorPos In win32api As apiGetCursorPos;
		String  @lpPoint
	Return apiGetCursorPos(@m.lpPoint)
Endfunc

Function apiGetDateFormat
	Lparameters Locale, dwFlags, lpDate, lpFormat, lpDateStr, cchDate
	Declare Integer GetDateFormat In win32api As apiGetDateFormat ;
		Integer Locale, ;
		Integer dwFlags, ;
		String  lpDate, ;
		String  lpFormat, ;
		String  @lpDateStr, ;
		Integer cchDate
	Return apiGetDateFormat(m.Locale, m.dwFlags, m.lpDate, m.lpFormat, @m.lpDateStr, m.cchDate)
Endfunc

Function apiGetDC
	Lparameters nhWnd
	Declare Integer GetDC In win32api As apiGetDC ;
		Integer nhWnd
	Return apiGetDC(m.nhWnd)
Endfunc

Function apiGetDesktopWindow()
	Declare Integer GetDesktopWindow In win32api As apiGetDesktopWindow
	Return apiGetDesktopWindow()
Endfunc

Function apiGetDeviceCaps
	Lparameters hdc, nIndex
	Declare Integer GetDeviceCaps In win32api As apiGetDeviceCaps ;
		Integer hdc, ;
		Integer nIndex
	Return apiGetDeviceCaps(m.hdc, m.nIndex)
Endfunc

Function apiGetDoubleClickTime()
	Declare Integer GetDoubleClickTime In win32api As apiGetDoubleClickTime
	Return apiGetDoubleClickTime()
Endfunc

Function apiGetFileSizeEx
	Lparameters hFile, lpFileSize
	Declare Integer GetFileSizeEx In win32api As apiGetFileSizeEx ;
		Integer hFile, ;
		String  @lpFileSize
	Return apiGetFileSizeEx(m.hFile, @m.lpFileSize)
Endfunc

Function apiGetFocus()
	Declare Integer GetFocus In win32api As apiGetFocus
	Return apiGetFocus()
Endfunc

Function apiGetForegroundWindow()
	Declare Integer GetForegroundWindow In win32api As apiGetForegroundWindow
	Return apiGetForegroundWindow()
Endfunc

Function apiGetIpAddrTable
	Lparameters pIpAddrTable, pdwSize, nbOrder
	Declare Integer GetIpAddrTable In iphlpapi As apiGetIpAddrTable ;
		String  @pIpAddrTable, ;
		Integer @pdwSize, ;
		Integer  nbOrder
	Return apiGetIpAddrTable(@m.pIpAddrTable, @m.pdwSize, m.nbOrder)
Endfunc

Function apiGetKeyState
	Lparameters nVirtKey
	Declare Integer GetKeyState In win32api As apiGetKeyState ;
		Integer nVirtKey
	Return apiGetKeyState(m.nVirtKey)
Endfunc

Function apiGetLastError()
	Declare Integer GetLastError In win32api As apiGetLastError
	Return apiGetLastError()
Endfunc

Function apiGetLocaleInfo
	Lparameters Locale, LCType, lpLCData, cchData
	Declare Integer GetLocaleInfo In win32api As apiGetLocaleInfo;
		Integer Locale, ;
		Integer LCType, ;
		String  @lpLCData, ;
		Integer cchData
	Return apiGetLocaleInfo(m.Locale, m.LCType, @m.lpLCData, m.cchData)
Endfunc

Function apiGetMenu
	Lparameters nhWnd
	Declare Integer GetMenu In win32api As apiGetMenu ;
		Integer nhWnd
	Return apiGetMenu(m.nhWnd)
Endfunc

Function apiGetMenuBarInfo
	Lparameters nhWnd, idObject, idItem, pmbi
	Declare Integer GetMenuBarInfo In win32api As apiGetMenuBarInfo ;
		Integer nhWnd, ;
		Integer idObject, ;
		Integer idItem, ;
		String  @pmbi
	Return apiGetMenuBarInfo(m.nhWnd, m.idObject, m.idItem, m.pmbi)
Endfunc

Function apiGetMenuCheckMarkDimensions()
	*!* The GetMenuCheckMarkDimensions function is included only for compatibility
	*!* with 16-bit versions of Microsoft Windows. Applications should use the
	*!* GetSystemMetrics function with the CXMENUCHECK and CYMENUCHECK values to
	*!* retrieve the bitmap dimensions.
	Return apiGetSystemMetrics(SM_CXMENUCHECK) + apiGetSystemMetrics(SM_CYMENUCHECK) * 0x10000
Endfunc

Function apiGetMenuContextHelpId
	Lparameters hMenu
	Declare Integer GetMenuContextHelpId In win32api As apiGetMenuContextHelpId ;
		Integer hMenu
	Return apiGetMenuContextHelpId(m.hMenu)
Endfunc

Function apiGetMenuDefaultItem
	Lparameters hMenu, fByPos, gmdiFlags
	Declare Integer GetMenuDefaultItem In win32api As apiGetMenuDefaultItem ;
		Integer hMenu, ;
		Integer fByPos, ;
		Integer gmdiFlags
	Return apiGetMenuDefaultItem(m.hMenu, m.fByPos, m.gmdiFlags)
Endfunc

Function apiGetMenuInfo
	Lparameters hMenu, lpcmi
	Declare Integer GetMenuInfo In win32api As apiGetMenuInfo ;
		Integer hmenu, ;
		String  @lpcmi
	Return apiGetMenuInfo(m.hMenu, m.lpcmi)
Endfunc

Function apiGetMenuItemCount
	Lparameters hMenu
	Declare Integer GetMenuItemCount In win32api As apiGetMenuItemCount ;
		Integer hMenu
	Return apiGetMenuItemCount(m.hMenu)
Endfunc

Function apiGetMenuItemID
	Lparameters hMenu, nPos
	Declare Integer GetMenuItemID In win32api As apiGetMenuItemID ;
		Integer hMenu, ;
		Integer nPos
	Return apiGetMenuItemID(m.hMenu, m.nPos)
Endfunc

Function apiGetMenuItemInfo
	Lparameters hMenu, uItem, fByPosition, lpmii
	Declare Integer GetMenuItemInfo In win32api As apiGetMenuItemInfo ;
		Integer hMenu, ;
		Integer uItem, ;
		Integer fByPosition, ;
		String  @lpmii
	Return apiGetMenuItemInfo(m.hMenu, m.uItem, m.fByPosition, @m.lpmii)
Endfunc

Function apiGetMenuItemRect
	Lparameters nhWnd, hMenu, uItem, lprcItem
	Declare Integer GetMenuItemRect In win32api As apiGetMenuItemRect ;
		Integer nhWnd, ;
		Integer hMenu, ;
		Integer uItem, ;
		String  @lprcItem
	Return apiGetMenuItemRect(m.nhWnd, m.hMenu, m.uItem, @m.lprcItem)
Endfunc

Function apiGetMenuState
	Lparameters hMenu, uID, uwFlags
	Declare Integer GetMenuState In win32api As apiGetMenuState ;
		Integer hMenu, ;
		Integer uID, ;
		Integer uFlags
	Return apiGetMenuState(m.hMenu, m.uID, m.uwFlags)
Endfunc

Function apiGetMenuString
	Lparameters hMenu, uIDItem , lpString , nMaxCount , uFlag
	Declare Integer GetMenuString In win32api As apiGetMenuString ;
		Integer hMenu, ;
		Integer uIDItem, ;
		String  @lpString, ;
		Integer nMaxCount, ;
		Integer uFlag
	Return apiGetMenuString(m.hMenu, m.uIDItem , @m.lpString , m.nMaxCount , m.uFlag)
Endfunc

Function apiGetModuleHandle
	Lparameters lpModule
	Declare Integer GetModuleHandle In win32api As apiGetModuleHandle ;
		String  lpModule
	Return apiGetModuleHandle(m.lpModule)
Endfunc

Function apiGetMonitorInfo
	Lparameters hMonitor, lpmi
	Declare Integer GetMonitorInfo In win32api As apiGetMonitorInfo ;
		Integer hMonitor, ;
		Integer lpmi
	Return apiGetMonitorInfo(m.hMonitor, m.lpmi)
Endfunc

Function apiGetObject
	Lparameters hObject, nCount, lpObject
*#beautify keyword_nochange
	Declare Integer GetObject In win32api as apiGetObject ;
		Integer hObject, ;
		Integer nCount, ;
		String  @lpObject
*#beautify
	Return apiGetObject(m.hObject, m.nCount, @m.lpObject)
Endfunc

Function apiGetOpenFileName
	Lparameters m.lpofn
	Declare Integer GetOpenFileName In comdlg32.Dll As apiGetOpenFileName ;
		Integer lpofn
	Return apiGetOpenFileName(m.lpofn)
Endfunc

Function apiGetParent
	Lparameters nhWnd
	Declare Integer GetParent In win32api As apiGetParent;
		Integer nhWnd
	Return apiGetParent(m.nhWnd)
Endfunc

Function apiGetPixel
	Lparameters hdc, pointx, pointy
	Declare Integer GetPixel In win32api As apiGetPixel ;
		Integer hdc,;
		Integer pointx,;
		Integer pointy
	Return apiGetPixel(m.hdc, m.pointx, m.pointy)
Endfunc

Function apiGetPrivateProfileString
	Lparameters lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize, lpFileName
	Declare Integer GetPrivateProfileString In win32api As apiGetPrivateProfileString ;
		String  lpAppName,;
		String  lpKeyName,;
		String  lpDefault,;
		String  @lpReturnedString,;
		Integer nSize,;
		String  lpFileName
	Return apiGetPrivateProfileString(m.lpAppName, m.lpKeyName, m.lpDefault, @m.lpReturnedString, m.nSize, m.lpFileName)
Endfunc

Function apiGetProcAddress
	Lparameters hModule, lpProcName
	Declare Integer GetProcAddress In win32api As apiGetProcAddress;
		Integer hModule, ;
		String  lpProcName
	Return apiGetProcAddress(m.hModule, m.lpProcName)
Endfunc

Function apiGetProcessHeap()
	Declare Integer GetProcessHeap In win32api As apiGetProcessHeap
	Return apiGetProcessHeap()
Endfunc

Function apiGetProp
	Lparameters nhWnd, lpString
	Declare Integer GetProp In win32api As apiGetProp ;
		Integer nhWnd, ;
		String  lpString
	Return apiGetProp(m.nhWnd, m.lpString)
Endfunc

Function apiGetSaveFileName
	Lparameters m.lpofn
	Declare Integer GetSaveFileName In comdlg32.Dll As apiGetSaveFileName ;
		Integer lpofn
	Return apiGetSaveFileName(m.lpofn)
Endfunc

Function apiGetScrollPos
	Lparameters nWnd, nBar
	Declare Integer GetScrollPos In win32api As apiGetScrollPos ;
		Integer nhWnd, ;
		Integer nBar
	Return apiGetScrollPos(m.nWnd, m.nBar)
Endfunc

Function apiGetScrollRange
	Lparameters nhWnd, nBar, lpMinPos, lpMaxPos
	Declare Integer GetScrollRange In win32api As apiGetScrollRange ;
		Integer nhWnd, ;
		Integer nBar, ;
		Integer @lpMinPos, ;
		Integer @lpMaxPos
	Return apiGetScrollRange(m.nhWnd, m.nBar, @m.lpMinPos, @m.lpMaxPos)
Endfunc

Function apiGetStockObject
	Lparameters fnObject
	Declare Integer GetStockObject In win32api As apiGetStockObject ;
		Integer fnObject
	Return apiGetStockObject(m.fnObject)
Endfunc

Function apiGetSubMenu
	Lparameters hMenu, nPos
	Declare Integer GetSubMenu In win32api As apiGetSubMenu ;
		Integer hMenu, ;
		Integer nPos
	Return apiGetSubMenu(m.hMenu, m.nPos)
Endfunc

Function apiGetSysColor
	Lparameters nIndex
	Declare Integer GetSysColor In win32api As apiGetSysColor ;
		Integer nIndex
	Return apiGetSysColor(m.nIndex)
Endfunc

Function apiGetSystemMetrics
	Lparameters nIndex
	Declare Integer GetSystemMetrics In win32api As apiGetSystemMetrics ;
		Integer nIndex
	Return apiGetSystemMetrics(m.nIndex)
Endfunc

Function apiGetTextExtentPoint32
	Lparameters hdc, lpsz, cbString, lpSize
	Declare Integer GetTextExtentPoint32 In win32api As apiGetTextExtentPoint32 ;
		Integer hdc, ;
		String  lpsz, ;
		Integer cbString, ;
		String  @lpSize
	Return apiGetTextExtentPoint32(m.hdc, m.lpsz, m.cbString, @m.lpSize)
Endfunc

Function apiGetThemeBitmap
	Lparameters hTheme, iPartId, iStateId , iPropId, dwFlags, phBitmap
	If ctlGetOsVersion() >= NTDDI_VISTA
		Declare Integer GetThemeBitmap In uxtheme As apiGetThemeBitmap ;
			Integer hTheme, ;
			Integer iPartId, ;
			Integer iStateId, ;
			Integer dwFlags, ;
			Integer @phBitmap
		Return apiGetThemeBitmap(m.hTheme, m.iPartId, m.iStateId , m.iPropId, m.dwFlags, m.phBitmap)
	Else
		Return 0
	Endif
Endfunc

Function apiGetThemeColor
	Lparameters hTheme, iPartId , iStateId , iPropId, pColor
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer GetThemeColor In uxtheme As apiGetThemeColor ;
			Integer hTheme, ;
			Integer iPartId, ;
			Integer iStateId, ;
			Integer iPropId, ;
			Integer @pColor
		Return apiGetThemeColor(m.hTheme, m.iPartId , m.iStateId , m.iPropId , @m.pColor )
	Else
		Return ERROR_INVALID_FUNCTION
	Endif
Endfunc

Function apiGetThemePartSize
	Lparameters hTheme, hdc, iPartId, iStateId, prc, eSize, psz
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer GetThemePartSize In uxtheme As apiGetThemePartSize ;
			Integer hTheme, ;
			Integer hdc, ;
			Integer iPartId, ;
			Integer iStateId, ;
			String  prc, ;
			Integer eSize, ;
			String  @psz
		Return apiGetThemePartSize(m.hTheme, m.hdc, m.iPartId, m.iStateId, m.prc, m.eSize, @m.psz)
	Else
		Return 0
	Endif
Endfunc

Function apiGetTickCount()
	Declare Integer GetTickCount In win32api As apiGetTickCount
	Return apiGetTickCount()
Endfunc

Function apiGetUserName
	Lparameters lpBuffer, nSize
	Declare Integer GetUserName In advapi32 As apiGetUserName;
		String  @lpBuffer,;
		Integer @nSize
	Return apiGetUserName(@m.lpBuffer, @m.nSize)
Endfunc

Function apiGetWindow
	Lparameters nhWnd, wCmd
	Declare Integer GetWindow In win32api As apiGetWindow;
		Integer nhWnd, ;
		Integer wCmd
	Return apiGetWindow(m.nhWnd, m.wCmd)
Endfunc

Function apiGetWindowLong
	Lparameters nhWnd, nIndex
	Declare Integer GetWindowLong In win32api As apiGetWindowLong;
		Integer nhWnd, ;
		Integer nIndex
	Return apiGetWindowLong(m.nhWnd, m.nIndex)
Endfunc

Function apiGetWindowPlacement
	Lparameters nhWnd, lpwndpl
	Declare Integer GetWindowPlacement In win32api As apiGetWindowPlacement ;
		Integer nhWnd, ;
		Integer lpwndpl
	Return apiGetWindowPlacement(m.nhWnd, m.lpwndpl)
Endfunc

Function apiGetWindowRect
	Lparameters nhWnd, lpRect
	Declare Integer GetWindowRect In win32api As apiGetWindowRect ;
		Integer nhWnd, ;
		Integer lpRect
	Return apiGetWindowRect(m.nhWnd, m.lpRect)
Endfunc

Function apiGetWindowThreadProcessId
	Lparameters nhWnd, lpdwProcessId
	Declare Integer GetWindowThreadProcessId In win32api As apiGetWindowThreadProcessId;
		Integer nhWnd, ;
		Integer lpdwProcessId
	Return apiGetWindowThreadProcessId(m.nhWnd, m.lpdwProcessId)
Endfunc

Function apiHeapAlloc
	Lparameters hHeap, dwFlags, dwBytes
	Declare Integer HeapAlloc In win32api As apiHeapAlloc ;
		Integer hHeap, ;
		Integer dwFlags, ;
		Integer dwBytes
	Return apiHeapAlloc(m.hHeap, m.dwFlags, m.dwBytes)
Endfunc

Function apiHeapFree
	Lparameters hHeap, dwFlags, lpMem
	Declare Integer HeapFree In win32api As apiHeapFree;
		Integer hHeap, ;
		Integer dwFlags, ;
		Integer lpMem
	Return apiHeapFree(m.hHeap, m.dwFlags, m.lpMem)
Endfunc

Function apiHeapSize
	Lparameters hHeap, dwFlags, lpMem
	Declare Integer HeapSize In win32api As apiHeapSize;
		Integer hHeap, ;
		Integer dwFlags, ;
		Integer lpMem
	Return apiHeapSize(m.hHeap, m.dwFlags, m.lpMem)
Endfunc

Function apiInitCommonControlsEx
	Lparameters lpInitCtrls
	Declare Integer InitCommonControlsEx In comctl32 As apiInitCommonControlsEx ;
		String  lpInitCtrls
	Return apiInitCommonControlsEx(m.lpInitCtrls)
Endfunc

Function apiInsertMenuItem
	Lparameters hMenu, uItem, fByPosition, lpmii
	Declare Integer InsertMenuItem In win32api As apiInsertMenuItem ;
		Integer hMenu, ;
		Integer uItem, ;
		Integer fByPosition, ;
		String  @lpmii
	Return apiInsertMenuItem(m.hMenu, m.uItem, m.fByPosition, @lpmii)
Endfunc

Function apiInternetAttemptConnect
	Lparameters dwReserved
	Declare Integer InternetAttemptConnect In wininet As apiInternetAttemptConnect ;
		Integer dwReserved
	Return apiInternetAttemptConnect(m.dwReserved)
Endfunc

Function apiInternetAutodial
	Lparameters dwFlags, hwndParent
	Declare Integer InternetAutodial In wininet As apiInternetAutodial ;
		Integer dwFlags, ;
		Integer hwndParent
	Return apiInternetAutodial(m.dwFlags, m.hwndParent)
Endfunc

Function apiInternetCloseHandle
	Lparameters hInternet
	Declare Integer InternetCloseHandle In wininet As apiInternetCloseHandle ;
		Integer hInternet
	Return apiInternetCloseHandle(m.hInternet)
Endfunc

Function apiInternetConnect
	Lparameters hInternet, lpszServerName, nServerPort, lpszUserName, lpszPassword, dwService, dwFlags, dwContext
	Declare Integer InternetConnect In wininet As apiInternetConnect ;
		Integer hInternet, ;
		String  lpszServerName, ;
		Integer nServerPort, ;
		String  lpszUserName, ;
		String  lpszPassword, ;
		Integer dwService, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiInternetConnect(m.hInternet, m.lpszServerName, m.nServerPort, m.lpszUserName, m.lpszPassword, m.dwService, m.dwFlags, m.dwContext)
Endfunc

Function apiInternetCrackUrl
	Lparameters lpszUrl, dwUrlLength, dwFlags, lpUrlComponents
	Declare Integer InternetCrackUrl In wininet As apiInternetCrackUrl ;
		String  lpszUrl, ;
		Integer dwUrlLength, ;
		Integer dwFlags, ;
		String  @lpUrlComponents
	Return apiInternetCrackUrl(m.lpszUrl, m.dwUrlLength, m.dwFlags, @m.lpUrlComponents)
Endfunc

Function apiInternetErrorDlg
	Lparameters nhWnd, hRequest, dwError, dwFlags, lppvData
	Declare Integer InternetErrorDlg In wininet As apiInternetErrorDlg ;
		Integer nhWnd, ;
		Integer hRequest, ;
		Integer dwError, ;
		Integer dwFlags, ;
		Integer lppvData
	Return apiInternetErrorDlg(m.nhWnd, m.hRequest, m.dwError, m.dwFlags, m.lppvData)
Endfunc

Function apiInternetFindNextFile
	Lparameters hFind, lpFindFileData
	Declare Integer InternetFindNextFile In wininet As apiInternetFindNextFile ;
		Integer hFind, ;
		Integer lpFindFileData
	Return apiInternetFindNextFile(m.hFind, m.lpFindFileData)
Endfunc

Function apiInternetGetLastResponseInfo
	Lparameters lpdwError, lpszBuffer, lpdwBufferLength
	Declare Integer InternetGetLastResponseInfo In wininet As apiInternetGetLastResponseInfo ;
		Integer @lpdwError, ;
		String  @lpszBuffer, ;
		Integer @lpdwBufferLength
	Return apiInternetGetLastResponseInfo(@m.lpdwError, @m.lpszBuffer, @m.lpdwBufferLength)
Endfunc

Function apiInternetOpen
	Lparameters lpszAgent, dwAccessType, lpszProxy, lpszProxyBypass, dwFlags
	Declare Integer InternetOpen In wininet As apiInternetOpen ;
		String  lpszAgent, ;
		Integer dwAccessType, ;
		String  lpszProxy, ;
		String  lpszProxyBypass, ;
		Integer dwFlags
	Return apiInternetOpen(m.lpszAgent, m.dwAccessType, m.lpszProxy, m.lpszProxyBypass, m.dwFlags)
Endfunc

Function apiInternetQueryDataAvailable
	Lparameters hFile, lpdwNumberOfBytesAvailable, dwFlags, dwContext
	Declare Integer InternetQueryDataAvailable In wininet As apiInternetQueryDataAvailable ;
		Integer hFile, ;
		Integer @lpdwNumberOfBytesAvailable, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiInternetQueryDataAvailable(m.hFile, @m.lpdwNumberOfBytesAvailable, m.dwFlags, m.dwContext)
Endfunc

Function apiInternetQueryOption
	Lparameters hInternet, dwOption, lpBuffer, lpdwBufferLength
	Declare Integer InternetQueryOption In wininet As apiInternetQueryOption ;
		Integer hInternet, ;
		Integer dwOption, ;
		String  @lpBuffer, ;
		Integer @lpdwBufferLength
	Return apiInternetQueryOption(m.hInternet, m.dwOption, @m.lpBuffer, @m.lpdwBufferLength)
Endfunc

Function apiInternetReadFile
	Lparameters hFile, lpBuffer, dwNumberOfBytesToRead, lpdwNumberOfBytesRead
	Declare Integer InternetReadFile In wininet As apiInternetReadFile ;
		Integer hFile, ;
		String  @lpBuffer, ;
		Integer dwNumberOfBytesToRead, ;
		Integer @lpdwNumberOfBytesRead
	Return apiInternetReadFile(m.hFile, @m.lpBuffer, m.dwNumberOfBytesToRead, @m.lpdwNumberOfBytesRead)
Endfunc

Function apiInternetReadFileEx
	Lparameters hFile, lpBuffersOut, dwFlags, dwContext
	Declare Integer InternetReadFileEx In wininet As apiInternetReadFileEx ;
		Integer hFile, ;
		String  @lpBuffersOut, ;
		Integer dwFlags, ;
		Integer dwContext
	Return apiInternetReadFileEx(m.hFile, m.lpBuffersOut, m.dwFlags, m.dwContext)
Endfunc

Function apiInternetSetFilePointer
	Lparameters hFile, lDistanceToMove, pReserved, dwMoveMethod, dwContext
	Declare Integer InternetSetFilePointer In wininet As apiInternetSetFilePointer ;
		Integer hFile, ;
		Integer lDistanceToMove, ;
		String  pReserved, ;
		Integer dwMoveMethod, ;
		Integer dwContext
	Return apiInternetSetFilePointer(m.hFile, m.lDistanceToMove, m.pReserved, m.dwMoveMethod, m.dwContext)
Endfunc

Function apiInternetSetOption
	Lparameters hInternet, dwOption, lpBuffer, dwBufferLength
	Declare Integer InternetSetOption In wininet As apiInternetSetOption ;
		Integer hInternet, ;
		Integer dwOption, ;
		String  lpBuffer, ;
		Integer dwBufferLength
	Return apiInternetSetOption(m.hInternet, m.dwOption, m.lpBuffer, m.dwBufferLength)
Endfunc

Function apiInternetWriteFile
	Lparameters hFile, lpBuffer, dwNumberOfBytesToWrite, lpdwNumberOfBytesWritten
	Declare Integer InternetWriteFile In wininet As apiInternetWriteFile ;
		Integer hFile, ;
		String  lpBuffer, ;
		Integer dwNumberOfBytesToWrite, ;
		Integer @lpdwNumberOfBytesWritten
	Return apiInternetWriteFile(m.hFile, m.lpBuffer, m.dwNumberOfBytesToWrite, @m.lpdwNumberOfBytesWritten)
Endfunc

Function apiIsIconic
	Lparameters nhWnd
	Declare Integer IsIconic In win32api As apiIsIconic;
		Integer nhWnd
	Return apiIsIconic(m.nhWnd)
Endfunc

Function apiIsThemeActive()
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer IsThemeActive In uxtheme As apiIsThemeActive
		Return apiIsThemeActive()
	Else
		Return 0
	Endif
Endfunc

Function apiIsWindow
	Lparameters nhWnd
	Declare Integer IsWindow In win32api As apiIsWindow ;
		Integer nhWnd
	Return apiIsWindow(m.nhWnd)
Endfunc

Function apiKeybd_Event
	Lparameters bVk, bScan, dwFlags, dwExtraInfo
	Declare Integer keybd_event In win32api As apiKeybd_Event ;
		Integer bVk, ;
		Integer bScan, ;
		Integer dwFlags, ;
		Integer dwExtraInfo
	Return apiKeybd_Event(m.bVk, m.bScan, m.dwFlags, m.dwExtraInfo)
Endfunc

Function apiKillTimer
	Lparameters nhWnd, nIDEvent
	Declare Integer KillTimer In win32api As apiKillTimer ;
		Integer nhWnd, ;
		Integer nIDEvent
	Return apiKillTimer(m.nhWnd, m.nIDEvent)
Endfunc

Function apiLoadLibrary
	Lparameters lpLibFileName
	Declare Integer LoadLibrary In win32api As apiLoadLibrary;
		String  lpLibFileName
	Return apiLoadLibrary(m.lpLibFileName)
Endfunc

Function apiLoadMenu
	Lparameters hInstance, lpMenuName
	Declare Integer LoadMenu In win32api As apiLoadMenu ;
		Integer hInstance, ;
		Integer lpMenuName
	Return apiLoadMenu(m.hInstance, m.lpMenuName)
Endfunc

Function apiLoadString
	Lparameters hInstance, uID, lpBuffer, nBufferMax
	Declare Integer LoadString In win32api As apiLoadString ;
		Integer hInstance, ;
		Integer uID, ;
		String  lpBuffer, ;
		Integer nBufferMax
	Return apiLoadString(m.hInstance, m.uID, @m.lpBuffer, m.nBufferMax)
Endfunc

Function apiMapVirtualKey
	Lparameters uCode, uMapType
	Declare Integer MapVirtualKey In win32api As apiMapVirtualKey ;
		Integer uCode, ;
		Integer uMapType
	Return apiMapVirtualKey(m.uCode, m.uMapType)
Endfunc

Function apiMessageBeep
	Lparameters uType
	Declare Integer MessageBeep In win32api As apiMessageBeep ;
		Integer uType
	Return apiMessageBeep(m.uType)
Endfunc

Function apiMonitorFromRect
	Lparameters lprc, dwFlags
	Declare Integer MonitorFromRect In win32api As apiMonitorFromRect ;
		Integer lprc, ;
		Integer dwFlags
	Return apiMonitorFromRect(m.lprc, m.dwFlags)
Endfunc

Function apiMulDiv
	Lparameters nNumber, nNumerator, nDenominator
	Declare Integer MulDiv In win32api As apiMulDiv ;
		Integer nNumber, ;
		Integer nNumerator, ;
		Integer nDenominator
	Return apiMulDiv(m.nNumber, m.nNumerator, m.nDenominator)
Endfunc

Function apiOpenFile
	Lparameters lpFileName, lpReOpenBuff, wStyle
	*!* Only use this function with 16-bit versions of Windows. For newer
	*!* applications, use the CreateFile function.
	Declare Integer OpenFile In win32api As apiOpenFile ;
		String  lpFileName, ;
		String  @lpReOpenBuff, ;
		Integer wStyle
	Return apiOpenFile(m.lpFileName, @m.lpReOpenBuff, m.wStyle)
Endfunc

Function apiOpenPrinter
	Lparameters pPrinterName, phPrinter, pDefault
	Declare Integer OpenPrinter In winspool.drv As apiOpenPrinter ;
		String  pPrinterName, ;
		Integer @phPrinter, ;
		Integer pDefault
	Return apiOpenPrinter(m.pPrinterName, @m.phPrinter, m.pDefault)
Endfunc

Function apiOpenThemeData
	Lparameters nhWnd, pszClassList
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer OpenThemeData In uxtheme As apiOpenThemeData ;
			Integer nhWnd, ;
			String  pszClassList
		Return apiOpenThemeData(m.nhWnd, m.pszClassList)
	Else
		Return 0
	Endif
Endfunc

Function apiPrintDlg
	Lparameters lppd
	Declare Integer PrintDlg In comdlg32 As apiPrintDlg;
		String  @lppd
	Return apiPrintDlg(@m.lppd)
Endfunc

Function apiPrintDlgEx
	Lparameters lppd
	Declare Integer PrintDlgEx In comdlg32 As apiPrintDlgEx;
		String  @lppd
	Return apiPrintDlgEx(@m.lppd)
Endfunc

Function apiReadFile
	Lparameters hFile, lpBuffer, nNumberOfBytesToRead, lpNumberOfBytesRead, lpOverlapped
	Declare Integer ReadFile In win32api As apiReadFile ;
		Integer hFile, ;
		String  @lpBuffer, ;
		Integer nNumberOfBytesToRead, ;
		Integer @lpNumberOfBytesRead, ;
		Integer lpOverlapped
	Return apiReadFile(m.hFile, @m.lpBuffer, m.nNumberOfBytesToRead, @m.lpNumberOfBytesRead, m.lpOverlapped)
Endfunc

Function apiRealGetWindowClass
	Lparameters nhWnd, pszType, cchType
	Declare Integer RealGetWindowClass In win32api As apiRealGetWindowClass ;
		Integer nhWnd, ;
		String  @pszType, ;
		Integer cchType
	Return apiRealGetWindowClass(m.nhWnd, @m.pszType, m.cchType)
Endfunc

Function apiRedrawWindow
	Lparameters nhWnd, lprcUpdate, hrgnUpdate, uFlags
	Declare Integer RedrawWindow In win32api As apiRedrawWindow ;
		Integer nhWnd, ;
		String  lprcUpdate, ;
		Integer hrgnUpdate, ;
		Integer uflags
	Return apiRedrawWindow(m.nhWnd, m.lprcUpdate, m.hrgnUpdate, m.uFlags)
Endfunc

Function apiRegCloseKey
	Lparameters hKeyHandle
	Declare Integer RegCloseKey In Advapi32 As apiRegCloseKey;
		Integer hKeyHandle
	Return apiRegCloseKey(m.hKeyHandle)
Endfunc

Function apiRegCreateKeyEx
	Lparameters hKey, lpSubKey, Reserved, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition
	Declare Integer RegCreateKeyEx In Advapi32 As apiRegCreateKeyEx ;
		Integer hKey, ;
		String  lpSubKey, ;
		Integer Reserved, ;
		String  lpClass, ;
		Integer dwOptions, ;
		Integer samDesired, ;
		Integer lpSecurityAttributes, ;
		Integer @phkResult, ;
		Integer @lpdwDisposition
	Return apiRegCreateKeyEx(m.hKey, m.lpSubKey, m.Reserved, m.lpClass, m.dwOptions, m.samDesired, m.lpSecurityAttributes, @m.phkResult, @m.lpdwDisposition)
Endfunc

Function apiRegDeleteKey
	Lparameters hKey, lpSubKey
	Declare Integer RegDeleteKey In Advapi32 As apiRegDeleteKey ;
		Integer hKey, ;
		String  lpSubKey
	Return apiRegDeleteKey(m.hKey, m.lpSubKey)
Endfunc

Function apiRegDeleteValue
	Lparameters hKey, lpValueName
	Declare Integer RegDeleteValue In advapi32 As apiRegDeleteValue ;
		Integer hKey, ;
		String  lpValueName
	Return apiRegDeleteValue(m.hKey, m.lpValueName)
Endfunc

Function apiRegOpenKeyEx
	Lparameters hKey, lpSubKey, ulOptions, samDesired, phkResult
	Declare Integer RegOpenKeyEx In advapi32 As apiRegOpenKeyEx;
		Integer hKey, ;
		String  lpSubKey, ;
		Integer ulOptions, ;
		Integer samDesired, ;
		Integer @phkResult
	Return apiRegOpenKeyEx(m.hKey, m.lpSubKey, m.ulOptions, m.samDesired, @m.phkResult)
Endfunc

Function apiRegQueryValueEx
	Lparameters hKeyHandle, lpValueName, lpReserved, lpType, lpData, lpcbData
	Declare Integer RegQueryValueEx In advapi32 As apiRegQueryValueEx ;
		Integer hKeyHandle, ;
		String  lpValueName, ;
		Integer lpReserved, ;
		Integer @lpType, ;
		String  @lpData, ;
		Integer @lpcbData
	Return apiRegQueryValueEx(m.hKeyHandle, m.lpValueName, m.lpReserved, @m.lpType, @m.lpData, @m.lpcbData)
Endfunc

Function apiRegSetValueEx
	Lparameters hKeyHandle, lpValueName, Reserved, dwType, lpData, cbData
	Declare Integer RegSetValueEx In advapi32 As apiRegSetValueEx ;
		Integer hKeyHandle, ;
		String  lpValueName, ;
		Integer Reserved, ;
		Integer dwType, ;
		String  @lpData, ;
		Integer cbData
	Return apiRegSetValueEx(m.hKeyHandle, m.lpValueName, m.Reserved, m.dwType, @m.lpData, m.cbData)
Endfunc

Function apiReleaseDC
	Lparameters nhWnd, hdc
	Declare Integer ReleaseDC In win32api As apiReleaseDC ;
		Integer nhWnd, ;
		Integer hdc
	Return apiReleaseDC(m.nhWnd, m.hdc)
Endfunc

Function apiScreenToClient
	Lparameters nhWnd, lpPoint
	Declare Integer ScreenToClient In win32api As apiScreenToClient ;
		Integer nhWnd, ;
		String  @lpPoint
	Return apiScreenToClient(m.nhWnd, @m.lpPoint)
Endfunc

Function apiSelectObject
	Lparameters hdc, hObject
	Declare Integer SelectObject In win32api As apiSelectObject ;
		Integer hdc, ;
		Integer hObject
	Return apiSelectObject(m.hdc, m.hObject)
Endfunc

Function apiSendMessage
	Lparameters nhWnd, Msg, wParam, Lparam
	*!* 2008-04-18 Changed to wrap SendMessage with a string lParam
	*!* and SendMessage with an integer lParam
	If Vartype(m.lParam) = T_CHARACTER Then
		Return apiSendMessageString(m.nhWnd, m.Msg, m.wParam, @m.lParam)
	Else
		Return apiSendMessageInteger(m.nhWnd, m.Msg, m.wParam, m.lParam)
	Endif
Endfunc

Function apiSendMessageInteger
	Lparameters nhWnd, Msg, wParam, Lparam
	Declare Integer SendMessage In win32api As apiSendMessageInteger ;
		Integer nhWnd, ;
		Integer Msg, ;
		Integer wParam, ;
		Integer Lparam
	Return apiSendMessageInteger(m.nhWnd, m.Msg, m.wParam, m.lParam)
Endfunc

Function apiSendMessageString
	Lparameters nhWnd, Msg, wParam, Lparam
	Declare Integer SendMessage In win32api As apiSendMessageString ;
		Integer nhWnd, ;
		Integer Msg, ;
		Integer wParam, ;
		String  @Lparam
	Return apiSendMessageString(m.nhWnd, m.Msg, m.wParam, @m.lParam)
Endfunc

Function apiSetClassLong
	Lparameters nhWnd, nIndex, dwNewLong
	Declare Integer SetClassLong In win32api As apiSetClassLong ;
		Integer nhWnd, ;
		Integer nIndex, ;
		Integer dwNewLong
	Return apiSetClassLong(m.nhWnd, m.nIndex, m.dwNewLong)
Endfunc

Function apiSetFilePointerEx
	Lparameters hFile, iDistanceToMoveLow, iDistanceToMoveHigh, lpNewFilePointer, dwMoveMethod
	Declare Integer SetFilePointerEx In win32api As apiSetFilePointerEx ;
		Integer hFile, ;
		Integer iDistanceToMoveLow, ;
		Integer iDistanceToMoveHigh, ;
		String  @lpNewFilePointer, ;
		Integer dwMoveMethod
	Return apiSetFilePointerEx(m.hFile, m.iDistanceToMoveLow, m.iDistanceToMoveHigh, @m.lpNewFilePointer, m.dwMoveMethod)
Endfunc

Function apiSetFocus
	Lparameters nhWnd
	Declare Integer SetFocus In win32api As apiSetFocus ;
		Integer nhWnd
	Return apiSetFocus(m.nhWnd)
Endfunc

Function apiSetForegroundWindow
	Lparameters nhWnd
	Declare Integer SetForegroundWindow In win32api As apiSetForegroundWindow ;
		Integer nhWnd
	Return apiSetForegroundWindow(m.nhWnd)
Endfunc

Function apiSetMenu
	Lparameters nhWnd, hMenu
	Declare Integer SetMenu In win32api As apiSetMenu;
		Integer nhWnd, ;
		Integer hMenu
	Return apiSetMenu(m.nhWnd, m.hMenu)
Endfunc

Function apiSetMenuDefaultItem
	Lparameters hMenu, uItem, fByPos
	Declare Integer SetMenuDefaultItem In win32api As apiSetMenuDefaultItem;
		Integer hMenu, ;
		Integer uItem, ;
		Integer fByPos
	Return apiSetMenuDefaultItem(m.hMenu, m.uItem, m.fByPos)
Endfunc

Function apiSetMenuInfo
	Lparameters hMenu, lpcmi
	Declare Integer SetMenuInfo In win32api As apiSetMenuInfo;
		Integer hmenu, ;
		String  @lpcmi
	Return apiSetMenuInfo(m.hMenu, @m.lpcmi)
Endfunc

Function apiSetMenuItemBitmaps
	Lparameters hMenu, uPosition, uFlags, hBitmapUnchecked, hBitmapChecked
	Declare Integer SetMenuItemBitmaps In win32api As apiSetMenuItemBitmaps ;
		Integer hMenu, ;
		Integer uPosition, ;
		Integer uFlags, ;
		Integer hBitmapUnchecked, ;
		Integer hBitmapChecked
	Return apiSetMenuItemBitmaps(m.hMenu, m.uPosition, m.uFlags, m.hBitmapUnchecked, m.hBitmapChecked)
Endfunc

Function apiSetMenuItemInfo
	Lparameters hMenu, uItem, fByPosition, lpmii
	Declare Integer SetMenuItemInfo In win32api As apiSetMenuItemInfo;
		Integer hMenu, ;
		Integer uItem, ;
		Integer fByPosition, ;
		String  @lpmii
	Return apiSetMenuItemInfo(m.hMenu, m.uItem, m.fByPosition, @m.lpmii)
Endfunc

Function apiSetParent
	Lparameters nHwndChild, nHwndNewParent
	Declare Integer SetParent In win32api As apiSetParent ;
		Integer nHwndChild, ;
		Integer nHwndNewParent
	Return apiSetParent(m.nHwndChild, m.nHwndNewParent)
Endfunc

Function apiSetProp
	Lparameters nhWnd, lpString, hData
	Declare Integer SetProp In win32api As apiSetProp ;
		Integer nhWnd, ;
		String  lpString, ;
		Integer hData
	Return apiSetProp(m.nhWnd, m.lpString, m.hData)
Endfunc

Function apiSetScrollInfo
	Lparameters nhWnd, fnBar, lpsi, fRedraw
	Declare Integer SetScrollInfo In win32api As apiSetScrollInfo ;
		Integer nhWnd, ;
		Integer fnBar, ;
		Integer lpsi, ;
		Integer fRedraw
	Return apiSetScrollInfo(m.nhWnd, m.fnBar, m.lpsi, m.fRedraw)
Endfunc

Function apiSetTimer
	Lparameters nhWnd, nIDEvent, uElapse, lpTimerFunc
	Declare Integer SetTimer In win32api As apiSetTimer ;
		Integer nhWnd, ;
		Integer nIDEvent, ;
		Integer uElapse, ;
		Integer lpTimerFunc
	Return apiSetTimer(m.nhWnd, m.nIDEvent, m.uElapse, m.lpTimerFunc)
Endfunc

Function apiSetWindowLong
	Lparameters nhWnd, nIndex, dwNewLong
	Declare Integer SetWindowLong In win32api As apiSetWindowLong ;
		Integer nhWnd, ;
		Integer nIndex, ;
		Integer dwNewLong
	Return apiSetWindowLong(m.nhWnd, m.nIndex, m.dwNewLong)
Endfunc

Function apiSetWindowPlacement
	Lparameters nhWnd, lpwndpl
	Declare Integer SetWindowPlacement In win32api As apiSetWindowPlacement;
		Integer nhWnd, ;
		Integer lpwndpl
	Return apiSetWindowPlacement(m.nhWnd, m.lpwndpl)
Endfunc

Function apiSetWindowPos
	Lparameters nhWnd, nHwndInsertAfter, nx, ny, cx, cy, wFlags
	Declare Integer SetWindowPos In win32api As apiSetWindowPos ;
		Integer nhWnd, ;
		Integer nHwndInsertAfter, ;
		Integer nx, ;
		Integer ny, ;
		Integer cx, ;
		Integer cy, ;
		Integer wFlags
	Return apiSetWindowPos(m.nhWnd, m.nHwndInsertAfter, m.nx, m.ny, m.cx, m.cy, m.wFlags)
Endfunc

Function apiSetWindowRgn
	Lparameters nhWnd, hRgn, bRedraw
	Declare Integer SetWindowRgn In win32api As apiSetWindowRgn ;
		Integer nhWnd, ;
		Integer hRgn, ;
		Integer bRedraw
	Return apiSetWindowRgn(m.nhWnd, m.hRgn, m.bRedraw)
Endfunc

Function apiSetWindowText
	Lparameters nhWnd, lpString
	Declare Integer SetWindowText In win32api As apiSetWindowText ;
		Integer nHwnd, ;
		String  lpString
	Return 	apiSetWindowText(m.nhWnd, m.lpString)
Endfunc

Function apiSetWindowTheme
	Lparameters nhWnd, pszSubAppName, pszSubIdList
	If ctlGetOsVersion() >= NTDDI_WINXP
		Declare Integer SetWindowTheme In uxtheme As apiSetWindowTheme ;
			Integer nhWnd, ;
			String  pszSubAppName, ;
			String  pszSubIdList
		Return  apiSetWindowTheme(m.nhWnd, m.pszSubAppName, m.pszSubIdList)
	Else
		Return 0
	Endif
Endfunc

Function apiSHBrowseForFolder
	Lparameters lpbi
	Declare Integer SHBrowseForFolder In shell32.Dll As apiSHBrowseForFolder ;
		Integer lpbi
	Return apiSHBrowseForFolder(m.lpbi)
Endfunc

Function apiSHDeleteKey
	Lparameters hKey, pszSubKey
	Declare Integer SHDeleteKey In shlwapi As apiSHDeleteKey ;
		Integer hkey, ;
		String  pszSubKey
	Return apiSHDeleteKey(m.hKey, m.pszSubKey)
Endfunc

Function apiShellExecute
	Lparameters nhWnd, lpOperation, lpFile, lpParameters, lpDirectory, nShowCmd
	Declare Integer ShellExecute In shell32.Dll As apiShellExecute ;
		Integer nhWnd, ;
		String  lpOperation, ;
		String  lpFile, ;
		String  lpParameters, ;
		String  lpDirectory, ;
		Integer nShowCmd
	Return apiShellExecute(m.nhWnd, m.lpOperation, m.lpFile, m.lpParameters, m.lpDirectory, m.nShowCmd)
Endfunc

Function apiSHGetFolderLocation
	Lparameters hwndOwner, nFolder, hToken, dwReserved, ppidl
	Declare Integer SHGetFolderLocation In shell32.Dll As apiSHGetFolderLocation ;
		Integer hwndOwner, ;
		Integer nFolder, ;
		Integer hToken, ;
		Integer dwReserved, ;
		Integer @ppidl
	Return apiSHGetFolderLocation(m.hwndOwner, m.nFolder, m.hToken, m.dwReserved, @m.ppidl)
Endfunc

Function apiSHGetFolderPath
	Lparameters nHwndOwner, nFolder, hToken, dwFlags, pszPath
	Declare Integer SHGetFolderPath In shfolder As apiSHGetFolderPath ;
		Integer nHwndOwner, ;
		Integer nFolder, ;
		Integer hToken, ;
		Integer dwFlags, ;
		String  @pszPath
	Return apiSHGetFolderPath(m.nHwndOwner, m.nFolder, m.hToken, m.dwFlags, @m.pszPath)
Endfunc

Function apiSHGetKnownFolderPath
	*!* WINDOWS VISTA ONLY
	Lparameters rfid, dwFlags, hToken, ppszPath
	Declare Integer SHGetKnownFolderPath In shell32.Dll As apiSHGetKnownFolderPath ;
		String  rfid, ;
		Integer dwFlags, ;
		Integer hToken, ;
		Integer @ppszPath
	Return apiSHGetKnownFolderPath(m.rfid, m.dwFlags, m.hToken, @m.ppszPath)
Endfunc

Function apiSHGetNameFromIDList
	Lparameters pidl, sigdnName, ppszName
	Declare Integer SHGetNameFromIDList In shell32.Dll As apiSHGetNameFromIDList ;
		Integer pidl, ;
		Integer sigdnName, ;
		Integer @ppszName
	Return apiSHGetNameFromIDList(m.pidl, m.sigdnName, @m.ppszName)
Endfunc

Function apiSHGetPathFromIDList
	Lparameters pidl, pszPath
	Declare Integer SHGetPathFromIDList In Shell32.Dll As apiSHGetPathFromIDList ;
		Integer pidl, ;
		String  @pszPath
	Return apiSHGetPathFromIDList(m.pidl, @m.pszPath)
Endfunc

Function apiShowScrollBar
	Lparameters nhWnd, wBar, bShow
	Declare Integer ShowScrollBar In win32api As apiShowScrollBar ;
		Integer nhWnd, ;
		Integer wBar, ;
		Integer bShow
	Return apiShowScrollBar(m.nhWnd, m.wBar, m.bShow)
Endfunc

Function apiShowWindow
	Lparameters nhWnd, nCmdShow
*#beautify keyword_nochange
	Declare Integer ShowWindow In win32api As apiShowWindow ;
		Integer nhWnd, ;
		Integer nCmdShow
*#beautify
	Return apiShowWindow(m.nhWnd, m.nCmdShow)
Endfunc

Function apiStartDocPrinter
	Lparameters hPrinter, nLevel, pDocInfo
	Declare Integer StartDocPrinter In winspool.drv As apiStartDocPrinter ;
		Integer hPrinter,  ;
		Integer nLevel,  ;
		String  pDocInfo
	Return apiStartDocPrinter(m.hPrinter, m.nLevel, m.pDocInfo)
Endfunc

Function apiStrFormatByteSize
	Lparameters dw, szBuf, uiBufSize
	Declare Integer StrFormatByteSize In shlwapi As apiStrFormatByteSize;
		Integer dw, ;
		String  @szBuf, ;
		Integer uiBufSize
	Return apiStrFormatByteSize(m.dw, @m.szBuf, m.uiBufSize)
Endfunc

Function apiStrFormatByteSize64
	Lparameters dw, szBuf, uiBufSize
	Declare Integer StrFormatByteSize64 In shlwapi As apiStrFormatByteSize64;
		Integer dw, ;
		String  @szBuf, ;
		Integer uiBufSize
	Return apiStrFormatByteSize64(m.dw, @m.szBuf, m.uiBufSize)
Endfunc

Function apiStringFromGUID2
	Lparameters rguid, lpsz, cchMax
	Declare Integer StringFromGUID2 In ole32 As apiStringFromGUID2;
		String  rguid, ;
		String  @lpsz, ;
		Integer cchMax
	Return apiStringFromGUID2(m.rguid, @m.lpsz, m.cchMax)
Endfunc

Function apiSwitchToThisWindow
	Lparameters nhWnd, fAltTab
	Declare SwitchToThisWindow In win32api As apiSwitchToThisWindow ;
		Integer nhWnd, ;
		Integer fAltTab
	Return apiSwitchToThisWindow(m.nhWnd, m.fAltTab)
Endfunc

Function apiSystemParametersInfo
	Lparameters uiAction, uiParam, pvParam, fWinIni
	Declare Integer SystemParametersInfo In win32api As apiSystemParametersInfo ;
		Integer uiAction, ;
		Integer uiParam, ;
		String  @pvParam, ;
		Integer fWinIni
	Return apiSystemParametersInfo(m.uiAction, m.uiParam, @m.pvParam, m.fWinIni)
Endfunc

Function apiTrackPopupMenuEx
	Lparameters hMenu, fuFlags, nx, ny, nhWnd, lptpm
	Declare Integer TrackPopupMenuEx In win32api As apiTrackPopupMenuEx;
		Integer hMenu, ;
		Integer fuFlags, ;
		Integer nX, ;
		Integer nY, ;
		Integer nhWnd, ;
		String  @lptpm
	Return apiTrackPopupMenuEx(m.hMenu, m.fuFlags, m.nx, m.ny, m.nhWnd, @m.lptpm)
Endfunc

Function apiURLDownloadToFile
	Lparameters pCaller, szURL, szFileName, dwReserved, lpfnCB
	Declare Integer URLDownloadToFile In urlmon As apiURLDownloadToFile;
		Integer pCaller, ;
		String  szURL, ;
		String  szFileName, ;
		Integer dwReserved, ;
		Integer lpfnCB
	Return apiURLDownloadToFile(m.pCaller, m.szURL, m.szFileName, m.dwReserved, m.lpfnCB)
Endfunc

Function apiUuidCreate
	Lparameters Uuid
	Declare Integer UuidCreate In rpcrt4 As apiUuidCreate ;
		String  @Uuid
	Return apiUuidCreate(@m.Uuid)
Endfunc

Function apiUuidCreateNil
	Lparameters Nil_Uuid
	Declare Integer UuidCreateNil In rpcrt4 As apiUuidCreateNil ;
		String  @Nil_Uuid
	Return apiUuidCreate(@m.Nil_Uuid)
Endfunc

Function apiUuidCreateSequential
	Lparameters Uuid
	Declare Integer UuidCreateSequential In rpcrt4 As apiUuidCreateSequential ;
		String  @Uuid
	Return apiUuidCreateSequential(@m.Uuid)
Endfunc

Function apiUuidFromString
	Lparameters StringUuid, Uuid
	Declare Integer UuidFromString In rpcrt4 As apiUuidFromString ;
		String  StringUuid, ;
		String  @Uuid
	Return 	apiUuidFromString(m.StringUuid, @m.Uuid)
Endfunc

Function apiUuidToString
	Lparameters Uuid, StringUuid
	Declare Integer UuidToString In rpcrt4 As apiUuidToString ;
		String  Uuid, ;
		Integer @StringUuid
	Return apiUuidToString(m.Uuid, @m.StringUuid)
Endfunc

Function apiWindowFromPoint
	Lparameters pointx, pointy
	Declare Integer WindowFromPoint In win32api As apiWindowFromPoint ;
		Integer PointX, ;
		Integer PointY
	Return apiWindowFromPoint(m.pointx, m.pointy)
Endfunc

Function apiWriteFile
	Lparameters hFile, lpBuffer, nNumberOfBytesToWrite, lpNumberOfBytesWritten, lpOverlapped
	Declare Integer WriteFile In win32api As apiWriteFile ;
		Integer hFile, ;
		String  lpBuffer, ;
		Integer nNumberOfBytesToWrite, ;
		Integer @lpNumberOfBytesWritten, ;
		Integer lpOverlapped
	Return apiWriteFile(m.hFile, m.lpBuffer, m.nNumberOfBytesToWrite, @m.lpNumberOfBytesWritten, m.lpOverlapped)
Endfunc

Function apiWritePrinter
	Lparameters hPrinter, pBuf, cbBuf, pcWritten
	Declare Integer WritePrinter In winspool.drv As apiWritePrinter;
		Integer hPrinter, ;
		String  pBuf, ;
		Integer cbBuf,  ;
		Integer @pcWritten
	Return apiWritePrinter(m.hPrinter, m.pBuf, m.cbBuf, @m.pcWritten)
Endfunc

Function apiWritePrivateProfileString
	Lparameters lpAppName, lpKeyName, lpString, lpFileName
	Declare Integer WritePrivateProfileString In win32api As apiWritePrivateProfileString ;
		String  lpAppName, ;
		String  lpKeyName, ;
		String  lpString, ;
		String  lpFileName
	Return apiWritePrivateProfileString(m.lpAppName, m.lpKeyName, m.lpString, m.lpFileName)
Endfunc

