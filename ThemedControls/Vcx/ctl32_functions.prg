********************************************************************************
*!* ctl32_functions.prg
********************************************************************************
#Include ctl32.h

If Not Sys(16) $ Upper(Set("Procedure")) Then
	Set Procedure To Sys(16) Additive
Endif

Return

********************************************************************************
*!* ctlClientToScreen(nhWnd, @nX, @nY)
********************************************************************************
*!* Returns client coords x, y translated into screen coords x, y
********************************************************************************
Function ctlClientToScreen(pnHWnd As Integer, pnX As Integer, pnY As Integer)

	Local ;
		m.lcPoint As String, ;
		m.lnRetVal As Integer

	m.lcPoint = BinToC(m.pnX, "4RS") + BinToC(m.pnY, "4RS")
	m.lnRetVal = apiClientToScreen(m.pnHWnd, @m.lcPoint)

	m.pnX = CToBin(Substr(m.lcPoint , 1, 4), "4RS")
	m.pnY = CToBin(Substr(m.lcPoint , 5, 4), "4RS")

	Return m.lnRetVal <> 0
Endfunc

********************************************************************************
*!* ctlComRegister(cFileName)
********************************************************************************
*!* Registers a self registering dll or activex
********************************************************************************
Function ctlComRegister(pcFileName As String)

	Local ;
		m.lnHandle As Integer, ;
		m.llRetVal As Boolean

	m.llRetVal = FALSE

	m.lnHandle = apiLoadLibrary(m.pcFileName)

	If m.lnHandle <> 0 Then

		If apiGetProcAddress(m.lnHandle, "DllRegisterServer") <> 0

			Declare Integer DllRegisterServer In (m.pcFileName) ;
				As DllRegisterServer_2CC11JLUG

			If DllRegisterServer_2CC11JLUG() = S_OK Then
				m.llRetVal = TRUE
			Endif

			Clear Dlls DllRegisterServer_2CC11JLUG
		Endif
		apiFreeLibrary(m.lnHandle)
	Endif
	Return m.llRetVal
Endfunc

********************************************************************************
*!* ctlComUnregister(cFileName)
********************************************************************************
*!* Unregisters a self registering dll or activex
********************************************************************************
Function ctlComUnregister(m.pcFileName As String)

	Local ;
		m.lnHandle As Integer, ;
		m.llRetVal As Boolean

	m.llRetVal = FALSE

	m.lnHandle = apiLoadLibrary(m.pcFileName)

	If m.lnHandle <> 0 Then

		If apiGetProcAddress(m.lnHandle, "DllRegisterServer") <> 0

			Declare Integer DllUnregisterServer In (m.pcFileName) ;
				As DllUnregisterServer_2CC11JLUG

			If DllUnregisterServer_2CC11JLUG() = S_OK Then
				m.llRetVal = TRUE
			Endif

			Clear Dlls DllUnregisterServer_2CC11JLUG

		Endif
		apiFreeLibrary(m.lnHandle)
	Endif

Endfunc

********************************************************************************
*!* ctlCToLargeInteger(cLargeInt)
********************************************************************************
*!* Converts a large integer binary value (8 bytes) to a VFP number
********************************************************************************
Function ctlCToLargeInteger(pcLargeInt As String)

	Local ;
		lnLow As Integer, ;
		lnHigh As Integer, ;
		lnLargeInt As Integer

	m.lnLow = CToBin(Left(m.pcLargeInt, 4), "4rs")
	m.lnHigh = CToBin(Right(m.pcLargeInt, 4), "4rs")
	m.lnLargeInt = ctlLowHighToLargeInteger(m.lnLow, m.lnHigh)

	Return m.lnLargeInt
Endfunc

********************************************************************************
*!* ctlGetOsVersion()
********************************************************************************
*!* Returns the operating system version in a NTDDI format
********************************************************************************
*!* NTDDI version constants
*!* /http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=2095548&SiteID=1
*!* #define NTDDI_WIN2K                         05000000
*!* #define NTDDI_WIN2KSP1                      05000100
*!* #define NTDDI_WIN2KSP2                      05000200
*!* #define NTDDI_WIN2KSP3                      05000300
*!* #define NTDDI_WIN2KSP4                      05000400

*!* #define NTDDI_WINXP                         05010000
*!* #define NTDDI_WINXPSP1                      05010100
*!* #define NTDDI_WINXPSP2                      05010200
*!* #define NTDDI_WINXPSP3                      05010300
*!* #define NTDDI_WINXPSP4                      05010400

*!* #define NTDDI_WS03                          05020000
*!* #define NTDDI_WS03SP1                       05020100
*!* #define NTDDI_WS03SP2                       05020200
*!* #define NTDDI_WS03SP3                       05020300
*!* #define NTDDI_WS03SP4                       05020400

*!* #define NTDDI_WIN6                          06000000
*!* #define NTDDI_WIN6SP1                       06000100
*!* #define NTDDI_WIN6SP2                       06000200
*!* #define NTDDI_WIN6SP3                       06000300
*!* #define NTDDI_WIN6SP4                       06000400
*!* #define NTDDI_VISTA                         NTDDI_WIN6
*!* #define NTDDI_VISTASP1                      NTDDI_WIN6SP1
*!* #define NTDDI_VISTASP2                      NTDDI_WIN6SP2
*!* #define NTDDI_VISTASP3                      NTDDI_WIN6SP3
*!* #define NTDDI_VISTASP4                      NTDDI_WIN6SP4
*!* #define NTDDI_WS08                          NTDDI_WIN6SP1
*!* #define NTDDI_WS08SP2                       NTDDI_WIN6SP2
*!* #define NTDDI_WS08SP3                       NTDDI_WIN6SP3
*!* #define NTDDI_WS08SP4                       NTDDI_WIN6SP4
*!* #define NTDDI_LONGHORN  					NTDDI_VISTA
********************************************************************************
Function ctlGetOsVersion()
	Return Val(Os(3)) * 1000000 + Val(Os(4)) * 10000 + Val(Os(8)) * 100 + Val(Os(9))
Endfunc

********************************************************************************
*!* ctlGetCaretPos(@nX, @nY)
********************************************************************************
*!* Returns the position of the caret in CLIENT coordinates.
********************************************************************************
Function ctlGetCaretPos(pnX As Integer, pnY As Integer)

	Local ;
		m.lcPoint As String, ;
		m.lnRetVal As Integer

	m.lcPoint = 0h0000000000000000
	m.lnRetVal = apiGetCaretPos(@m.lcPoint)
	m.pnX = CToBin(Substr(m.lcPoint, 1, 4), "4RS")
	m.pnY = CToBin(Substr(m.lcPoint, 5, 4), "4RS")
	Return m.lnRetVal <> 0
Endfunc

********************************************************************************
*!* ctlGetCaretPosX()
********************************************************************************
*!* Returns the X coordinate of the caret position in CLIENT coordinates
********************************************************************************
Function ctlGetCaretPosX()

	Local m.lcPoint As String

	m.lcPoint = 0h0000000000000000
	apiGetCaretPos(@m.lcPoint)
	Return CToBin(Substr(m.lcPoint, 1, 4), "4RS")
Endfunc

********************************************************************************
*!* ctlGetCaretPosY()
********************************************************************************
*!* Returns the Y coordinate of the caret position in CLIENT coordinates
********************************************************************************
Function ctlGetCaretPosY()

	Local m.lcPoint As String

	m.lcPoint = 0h0000000000000000
	apiGetCaretPos(@m.lcPoint)
	Return CToBin(Substr(m.lcPoint, 5, 4), "4RS")
Endfunc

********************************************************************************
*!* ctlGetCursorPos(@nX, @nY)
********************************************************************************
*!* Returns the position of the mouse cursor in SCREEN coordinates.
********************************************************************************
Function ctlGetCursorPos(m.pnX As Integer, m.pnY As Integer)

	Local ;
		m.lcPoint As String, ;
		m.lnRetVal As Integer

	m.lcPoint = 0h0000000000000000
	m.lnRetVal = apiGetCursorPos(@m.lcPoint)
	m.pnX = CToBin(Substr(m.lcPoint, 1, 4), "4RS")
	m.pnY = CToBin(Substr(m.lcPoint, 5, 4), "4RS")
	Return m.lnRetVal <> 0
Endfunc

********************************************************************************
*!* ctlGetCursorPosX()
********************************************************************************
*!* Returns the x coordinate position of the mouse cursor in SCREEN coordinates.
********************************************************************************
Function ctlGetCursorPosX()

	Local m.lcPoint As String

	m.lcPoint = 0h0000000000000000
	apiGetCursorPos(@m.lcPoint)
	Return CToBin(Substr(m.lcPoint, 1, 4), "4RS")
Endfunc

********************************************************************************
*!* ctlGetCursorPosY()
********************************************************************************
*!* Returns the y coordinate position of the mouse cursor in SCREEN coordinates.
********************************************************************************
Function ctlGetCursorPosY()

	Local m.lcPoint As String

	m.lcPoint = 0h0000000000000000
	apiGetCursorPos(@m.lcPoint)
	Return CToBin(Substr(m.lcPoint, 5, 4), "4RS")
Endfunc

********************************************************************************
*!* ctlHiMetricToPixelsX(nHiMetricX)
********************************************************************************
*!* :http://www.experts-exchange.com/Programming/Languages/Visual_Basic/Q_20024530.html
*!*	HIMETRIC / 2540 = INCHES
*!*	INCHES * 1440 = TWIPS
*!*	TWIPS / TwipsPerPixel = PIXELS
********************************************************************************
Function ctlHiMetricToPixelsX(m.pnHiMetricX As Integer)
	Return Round(m.pnHiMetricX / 2540 * 1440 / ctlTwipsPerPixelX(), 0)
Endfunc

********************************************************************************
*!* :http://www.experts-exchange.com/Programming/Languages/Visual_Basic/Q_20024530.html
*!*	HIMETRIC / 2540 = INCHES
*!*	INCHES * 1440 = TWIPS
*!*	TWIPS / TwipsPerPixel = PIXELS
********************************************************************************
Function ctlHiMetricToPixelsY(m.pnHiMetricY As Integer)
	Return Round(m.pnHiMetricY / 2540 * 1440 / ctlTwipsPerPixelY(), 0)
Endfunc

********************************************************************************
*!* ctlIsObjectInPage(oControl)
********************************************************************************
*!* Determines if a control is contained in a page somewhere
*!* along its object hierarchy
********************************************************************************
Function ctlIsObjectInPage(m.poControl As Control)

	Local ;
		m.llIsInPage As Boolean, ;
		m.loControl As Control

	m.llIsInPage = FALSE

	m.loControl = m.poControl
	Do While Inlist(Upper(m.loControl.BaseClass), "FORM", "TOOLBAR") = FALSE
		If Upper(m.loControl.BaseClass) == "PAGE" Then
			m.llIsInPage = TRUE
			Exit
		Endif
		m.loControl = m.loControl.Parent
	Enddo
	m.loControl = .Null.
	m.poControl = .Null.

	Return m.llIsInPage
Endfunc

********************************************************************************
Function ctlIsThemeActive(m.poObject As Object)
	If Vartype(m.poObject) = T_OBJECT Then

		Local ;
			m.loForm As Form, ;
			m.llFormThemeActive As Boolean, ;
			m.llControlThemeActive As Boolean

		*!* Get theme status of object:
		Do Case
			Case Pemstatus(m.poObject, "ctlThemes", CON_PEMSTAT_DEFINED)
				m.llControlThemeActive = m.poObject.ctlThemes
			Case Pemstatus(m.poObject, "Themes", CON_PEMSTAT_DEFINED)
				m.llControlThemeActive = m.poObject.Themes
			Otherwise
				m.llControlThemeActive = TRUE
		Endcase

		*!* Get theme status of parent form
		m.loForm = m.poObject

		Do While Inlist(Upper(m.loForm.BaseClass), "FORM", "TOOLBAR") = FALSE
			m.loForm = m.loForm.Parent
		Enddo

		m.llFormThemeActive = m.loForm.Themes

		m.loForm = .Null.
		m.poObject = .Null.

		Return apiIsThemeActive() = 1 And _Screen.Themes And m.llFormThemeActive And m.llControlThemeActive
	Else
		Return apiIsThemeActive() <> 0
	Endif
Endfunc

********************************************************************************
*!* Allocates a block of memory of m.pnBytes
*!* Returns a handle to the allocated memory
*!* Must be freed after use
********************************************************************************
Function ctlMemAlloc(m.pnBytesToAllocate As Integer)
	Return apiHeapAlloc(apiGetProcessHeap(), HEAP_ZERO_MEMORY, m.pnBytesToAllocate)
Endfunc

********************************************************************************
*!* Frees a block of memory allocated with ctlMemAlloc
********************************************************************************
Function ctlMemFree(m.pnMem As Integer)
	Return apiHeapFree(apiGetProcessHeap(), 0, m.pnMem)
Endfunc

********************************************************************************
*!* Reads from a memory handle exactly m.pnBytes
********************************************************************************
Function ctlMemRead(m.pnMem As Integer, m.pnBytesToRead As Integer)
	If Vartype(m.pnMem) <> T_NUMERIC Or m.pnMem <= 0 Then
		Return ""
	Endif
	If Vartype(m.pnBytesToRead) <> T_NUMERIC Or m.pnBytesToRead <= 0 Then
		m.pnBytesToRead = apiHeapSize(apiGetProcessHeap(), 0, m.pnMem)
	Endif
	Return Sys(2600, m.pnMem, m.pnBytesToRead)
Endfunc


********************************************************************************
*!* Returns the size of a block of memory allocated with ctlMemAlloc
*!* Returns -1 on failure
********************************************************************************
Function ctlMemSize(m.pnMem As Integer)
	Return apiHeapSize(apiGetProcessHeap(), 0, m.pnMem)
Endfunc

********************************************************************************
*!* Writes to a memory heap handle, m.pnBytes of m.pcData
*!* pads with NULAs if len(m.pcData) < m.pnBytes
********************************************************************************
Function ctlMemWrite(m.pnMem As Integer, m.pcData As String, m.pnBytesToWrite As Integer)
	If Vartype(m.pcData) = T_NUMERIC Then
		m.pcData = BinToC(m.pcData, "4rs")
	Endif
	If Vartype(m.pnBytesToWrite) = T_NUMERIC And m.pnBytesToWrite > Len(m.pcData) Then
		m.pcData = m.pcData + Replicate(NULCHAR, m.pnBytesToWrite - Len(m.pcData))
	Else
		m.pnBytesToWrite = Len(m.pcData)
	Endif
	If m.pnMem = 0 Then
		m.pnMem = ctlMemAlloc(m.pnBytesToWrite)
	Endif
	m.pcData = Sys(2600, m.pnMem, m.pnBytesToWrite, m.pcData)
	Return m.pnMem
Endfunc

********************************************************************************
*!* converts an integer to an unsigned integer
********************************************************************************
Function ctlIntegerToUnsigned(m.pnValue As Integer)
	Local lnRetVal

	If m.pnValue < 0 Then
		m.lnRetVal = m.pnValue + 4294967296
	Else
		m.lnRetVal = m.pnValue
	Endif

	Return m.lnRetVal
Endfunc

********************************************************************************
*!* pcValueToReturn can be: T, B, L, R for Top, Bottom, Left, Right
*!* This replaces OBJTOCLIENT that has bugs with pageframes
********************************************************************************
Function ctlObjToClient(m.poControl As Control, m.pcValueToReturn As String)

	Local m.lnPosition As Integer

	m.pcValueToReturn = Upper(m.pcValueToReturn)
	m.lnPosition = 0

	Do Case

		Case m.pcValueToReturn $ "TB"
			*!* 20070711 Modified to account for toolbars
			Do While Inlist(Upper(m.poControl.BaseClass), "FORM", "TOOLBAR") = FALSE
				If Pemstatus(m.poControl, "Top", CON_PEMSTAT_DEFINED) Then
					m.lnPosition = m.lnPosition + m.poControl.Top
				Endif
				If Upper(m.poControl.BaseClass) == "PAGE" Then
					If m.poControl.Parent.TabOrientation = CON_TABOR_TOP Then	&& Top
						m.lnPosition = m.lnPosition + ;
							m.poControl.Parent.Height - ;
							m.poControl.Parent.PageHeight - ;
							m.poControl.Parent.BorderWidth * 2
					Else
						m.lnPosition = m.lnPosition + 1
					Endif
				Endif
				m.poControl = m.poControl.Parent
			Enddo

			If m.pcValueToReturn == "B" Then
				m.lnPosition = m.lnPosition + This.Height
			Endif

		Case m.pcValueToReturn $ "LR"
			*!* 20070711 Modified to account for toolbars
			Do While Inlist(Upper(m.poControl.BaseClass), "FORM", "TOOLBAR") = FALSE
				If Pemstatus(m.poControl, "Left", CON_PEMSTAT_DEFINED) Then
					m.lnPosition = m.lnPosition + m.poControl.Left
				Endif
				If Upper(m.poControl.BaseClass) == "PAGE"
					If m.poControl.Parent.TabOrientation = CON_TABOR_LEFT Then	&& Left
						m.lnPosition = m.lnPosition + ;
							m.poControl.Parent.Width - ;
							m.poControl.Parent.PageWidth - ;
							m.poControl.Parent.BorderWidth * 2
					Else
						m.lnPosition = m.lnPosition + 1
					Endif
				Endif
				m.poControl = m.poControl.Parent
			Enddo

			If m.pcValueToReturn == "R" Then
				m.lnPosition = m.lnPosition + This.Width
			Endif

	Endcase

	Return m.lnPosition
Endfunc

*!* * Inverse of VFP's DTOS() function.
Function ctlSTOD(m.pcDate As String)
	Local m.ldDate As Date
	m.ldDate = Date(Val(Substr(m.pcDate,1,4)), Val(Substr(m.pcDate,5,2)), Val(Substr(m.pcDate,7,2)))
	Return m.ldDate
Endfunc

********************************************************************************
*!* Converts a numeric value into a string that represents the number expressed
*!* as a size value in bytes, kilobytes, megabytes, or gigabytes, depending on the size.
*!* API StrFormatByteSize only work for files up to 4GB
*!*	Local ;
*!*		m.lcBuffer As String
*!*	m.lcBuffer = Space(254)
*!*	StrFormatByteSize(m.pnSizeInBytes, @m.lcBuffer, Len(m.lcBuffer))
*!*	* Remove NUL CHAR
*!*	m.lcBuffer = Left(m.lcBuffer, At(NULA, m.lcBuffer) - 1)
*!*	Return m.lcBuffer
********************************************************************************
Function ctlStrFormatByteSize(m.pnSizeInBytes As Number)
	Local ;
		m.lnSize As Integer, ;
		m.lcUnit As String

	Do Case
		Case m.pnSizeInBytes < 999					&& Bytes
			m.lnSize = m.pnSizeInBytes
			m.lcUnit = " Bytes"
		Case m.pnSizeInBytes < 1024^1 * 999			&& KiloBytes
			m.lnSize = m.pnSizeInBytes / 1024^1
			m.lcUnit = " KB"
		Case m.pnSizeInBytes < 1024^2 * 999			&& MegaBytes
			m.lnSize = m.pnSizeInBytes / 1024^2
			m.lcUnit = " MB"
		Case m.pnSizeInBytes < 1024^3 * 999			&& GigaBytes
			m.lnSize = m.pnSizeInBytes / 1024^3
			m.lcUnit = " GB"
		Otherwise
			m.lnSize = m.pnSizeInBytes / 1024^4		&& TeraBytes
			m.lcUnit = " TB"
	Endcase

	Do Case
		Case m.lnSize > 100
			m.lnSize = Round(m.lnSize , 0)
		Case m.lnSize > 10
			m.lnSize = Round(m.lnSize , 1)
		Otherwise
			m.lnSize = Round(m.lnSize , 2)
	Endcase

	Return Transform(m.lnSize) + m.lcUnit
Endfunc

********************************************************************************
Function ctlStrFormatSeconds(pnSeconds)

	m.pnSeconds = Round(m.pnSeconds, 0)

	Local ;
		m.lcHours As String, ;
		m.lcMinutes As String, ;
		m.lcSeconds As String

	If Int(m.pnSeconds / 3600) > 0 Then
		m.lcHours 	= Padl(Alltrim(Str(Int(m.pnSeconds / 3600))), 2, "0") + ":"
	Else
		m.lcHours   = ""
	Endif

	m.lcMinutes = Padl(Alltrim(Str(Int((m.pnSeconds % 3600) / 60))), 2, "0") + ":"
	m.lcSeconds = Padl(Alltrim(Str((m.pnSeconds % 3600) % 60)), 2, "0")

	Return m.lcHours +  m.lcMinutes +  m.lcSeconds
Endfunc

********************************************************************************
*!* Converts an unsigned integer to an integer.
********************************************************************************
Function ctlUnsignedToInteger(m.pnValue As Integer)

	Local m.lnRetVal As Integer

	If m.pnValue <= 2147483647 Then
		m.lnRetVal = m.pnValue
	Else
		m.lnRetVal= m.pnValue - 4294967296
	Endif

	Return m.lnRetVal
Endfunc

********************************************************************************
Function ctlFClose(pnFileHandle As Integer)

	Local ;
		lnApiRetVal As Integer, ;
		llRetVal As Boolean

	m.lnApiRetVal = apiCloseHandle(m.pnFileHandle)

	If m.lnApiRetVal = 0 Then
		m.llRetVal = FALSE
	Else
		m.llRetVal = TRUE
	Endif

	Return m.llRetVal
Endfunc

********************************************************************************
*!* ctlFgets(nFileHandle [, nBytes])
********************************************************************************
*!* Returns a series of bytes from a file or a communication port opened with a
*!* low-level file function until it encounters a carriage return.
********************************************************************************
Function ctlFGets(pnFileHandle As Integer, pnBytesToRead As Integer)

	Local ;
		lcByteString As String, ;
		lnBytesRead As Integer, ;
		lnApiRetVal As Integer, ;
		lnOverlapped As Integer, ;
		lnCrLfPos As Integer, ;
		lnOffset As Integer

	If Vartype(m.pnBytesToRead) # T_NUMERIC Then
		m.pnBytesToRead = 254
	Endif

	m.lnBytesRead = 0
	m.lcByteString = Space(m.pnBytesToRead)
	m.lnOverlapped = 0

	m.lnApiRetVal = apiReadFile(m.pnFileHandle, ;
		@m.lcByteString, ;
		m.pnBytesToRead , ;
		@m.lnBytesRead , ;
		m.lnOverlapped)

	If m.lnApiRetVal = 0 Then
		m.lcByteString = ""
	Else
		m.lcByteString = Left(m.lcByteString, m.lnBytesRead)
	Endif

	*!* Now search for CRLF in the string:
	m.lnCrLfPos = At(CRLF, m.lcByteString)

	*!* if we find a CRLF in the string
	If m.lnCrLfPos <> 0 Then

		*!* Set file pointer for next read to after CRLF
		m.lnOffset = (m.lnBytesRead - m.lnCrLfPos - 1) * (-1)
		ctlFSeek(m.pnFileHandle, m.lnOffset , 1)

		*!* Remove trailing characters after CRLF
		m.lcByteString = Left(m.lcByteString, m.lnCrLfPos - 1)
	Endif

	Return m.lcByteString
Endfunc

********************************************************************************
Function ctlFileTimeToDateTime(poFileTime As _FILETIME)

	Local ;
		loSystemTime As _SYSTEMTIME, ;
		ltFileDateTime As Datetime

	m.loSystemTime = Createobject("_SYSTEMTIME")

	If apiFileTimeToSystemTime(m.poFileTime.Address, m.loSystemTime.Address) = 1 Then
		With m.loSystemTime
			m.ltFileDateTime = Datetime(.wYear, .wMonth, .wDay, .wHour, .wMinute, .wSecond)
		Endwith
	Else
		m.ltFileDateTime = Ctot("")
	Endif

	m.loSystemTime = .Null.

	Return m.ltFileDateTime
Endfunc

********************************************************************************
Function ctlFontHeightToPoints(pnHeight As Integer)

	Local ;
		lnDc As Integer, ;
		lnLogPixelsY As Integer

	m.lnDc = apiGetDC(HWND_DESKTOP)
	m.lnLogPixelsY = apiGetDeviceCaps(m.lnDc, LOGPIXELSY)
	apiReleaseDC(HWND_DESKTOP, m.lnDc)
	Return Round(72 * m.pnHeight / m.lnLogPixelsY * (-1), 0)
Endfunc

********************************************************************************
Function ctlFontPointsToHeight(pnPoints As Integer)

	Local ;
		lnDc As Integer, ;
		lnLogPixelsY As Integer

	m.lnDc = apiGetDC(HWND_DESKTOP)
	m.lnLogPixelsY = apiGetDeviceCaps(m.lnDc, LOGPIXELSY)
	apiReleaseDC(HWND_DESKTOP, m.lnDc)
	Return apiMulDiv(m.pnPoints, m.lnLogPixelsY, 72) * (-1)
Endfunc

********************************************************************************
*!* ctlFopen(cFilename [, nAttribute])
********************************************************************************
*!*  0 READ-ONLY	BUFFERED
*!*  1 WRITE-ONLY	BUFFERED
*!*  2 READ-WRITE	BUFFERED
*!* 10 READ-ONLY	UNBUFFERED
*!* 11 WRITE-ONLY	UNBUFFERED
*!* 12 READ-WRITE	UNBUFFERED
********************************************************************************
Function ctlFOpen(pcFileName As String, pnAttribute As Integer)

	Local ;
		lcFilename As String, ;
		lnDesiredAccess As Integer, ;
		lnShareMode As Integer, ;
		lnSecurityAttributes As Integer, ;
		lnCreationDisposition As Integer, ;
		lnFlagsAndAttributes As Integer, ;
		lnTemplateFile As Integer, ;
		lnBufferFlag As Integer, ;
		lnFileHandle As Integer

	m.lcFilename = Alltrim(m.pcFileName)

	If Vartype(m.pnAttribute) # T_NUMERIC Then
		m.pnAttribute = 0
	Endif

	Do Case
		Case m.pnAttribute = 0
			m.lnDesiredAccess = GENERIC_READ
			m.lnBufferFlag = 0
		Case m.pnAttribute = 1
			m.lnDesiredAccess = GENERIC_WRITE
			m.lnBufferFlag = 0
		Case m.pnAttribute = 2
			m.lnDesiredAccess = Bitor(GENERIC_READ, GENERIC_WRITE)
			m.lnBufferFlag = 0
		Case m.pnAttribute = 10
			m.lnDesiredAccess = GENERIC_READ
			m.lnBufferFlag = FILE_FLAG_WRITE_THROUGH
		Case m.pnAttribute = 11
			m.lnDesiredAccess = GENERIC_WRITE
			m.lnBufferFlag = FILE_FLAG_WRITE_THROUGH
		Case m.pnAttribute = 12
			m.lnDesiredAccess = Bitor(GENERIC_READ, GENERIC_WRITE)
			m.lnBufferFlag = FILE_FLAG_WRITE_THROUGH
		Otherwise
			m.lnDesiredAccess = GENERIC_READ
			m.lnBufferFlag = 0
	Endcase

	m.lnShareMode = 0
	m.lnSecurityAttributes = 0
	m.lnCreationDisposition = OPEN_EXISTING
	m.lnFlagsAndAttributes = Bitor(FILE_ATTRIBUTE_NORMAL, m.lnBufferFlag)
	m.lnTemplateFile = 0

	m.lnFileHandle = apiCreateFile( ;
		m.lcFilename, ;
		m.lnDesiredAccess, ;
		m.lnShareMode, ;
		m.lnSecurityAttributes, ;
		m.lnCreationDisposition, ;
		m.lnFlagsAndAttributes, ;
		m.lnTemplateFile)

	Return m.lnFileHandle
Endfunc

********************************************************************************
Function ctlFRead(pnFileHandle As Integer, pnBytesToRead As Integer)

	Local ;
		lcByteString As String, ;
		lnBytesRead As Integer, ;
		lnApiRetVal As Integer, ;
		lnOverlapped As Integer

	m.lnBytesRead = 0
	m.lcByteString = Space(m.pnBytesToRead)
	m.lnOverlapped = 0

	m.lnApiRetVal = apiReadFile(m.pnFileHandle, ;
		@m.lcByteString, ;
		m.pnBytesToRead , ;
		@m.lnBytesRead , ;
		m.lnOverlapped)

	If m.lnApiRetVal = 0 Then
		m.lcByteString = ""
	Else
		m.lcByteString = Left(m.lcByteString, m.lnBytesRead)
	Endif

	Return m.lcByteString
Endfunc

********************************************************************************
*!* _Fseek(nFileHandle, nBytesMoved ", nRelativePosition")
*!*	#DEFINE FILE_BEGIN								0
*!*	#DEFINE FILE_CURRENT							1
*!*	#DEFINE FILE_END								2
*!*	#DEFINE INVALID_SET_FILE_POINTER				-1
********************************************************************************
Function ctlFSeek(pnFileHandle As Integer, pnBytesMoved As Integer , pnRelativePosition As Integer)

	Local ;
		lnLow As Integer, ;
		lnHigh As Integer, ;
		lcNewFilePointer As String, ;
		lnNewFilePointer As Integer, ;
		lnApiRetVal As Integer

	If Vartype(m.pnRelativePosition) # T_NUMERIC Then
		m.pnRelativePosition = 0
	Endif

	*!* Split large integer into low unsigned and high signed

	m.lnLow = 0
	m.lnHigh = 0
	ctlLargeIntegerToLowHigh(m.pnBytesMoved, @m.lnLow, @m.lnHigh)

	m.lcNewFilePointer = Replicate(NULCHAR, 8)

	m.lnApiRetVal = ;
		apiSetFilePointerEx( ;
		m.pnFileHandle , ;
		m.lnLow , ;
		m.lnHigh, ;
		@m.lcNewFilePointer, ;
		m.pnRelativePosition )

	If m.lnApiRetVal = 0 Then
		m.lnNewFilePointer = -1
	Else
		m.lnNewFilePointer = ctlCToLargeInteger(m.lcNewFilePointer)
	Endif

	Return m.lnNewFilePointer
Endfunc

********************************************************************************
*!* ctlFSize(cFilename|nFileHandle)
********************************************************************************
Function ctlFSize(puFnameOrFhandle As variant)

	Local ;
		m.lnFileSize As Integer, ;
		m.llCloseFile As Boolean, ;
		m.lnFileHandle As Integer, ;
		m.lcLargeInt As String, ;
		m.lnApiRetVal As Integer

	m.lnFileSize = -1
	m.lnFileHandle = HFILE_ERROR
	m.llCloseFile = FALSE

	Do Case
		Case Vartype(m.puFnameOrFhandle) = T_NUMERIC
			m.lnFileHandle = m.puFnameOrFhandle

		Case Vartype(m.puFnameOrFhandle) = T_CHARACTER
			m.llCloseFile = TRUE
			m.lnFileHandle = ctlFOpen(m.puFnameOrFhandle, 0)

		Otherwise
			Return m.lnFileSize
	Endcase

	If m.lnFileHandle <> HFILE_ERROR

		m.lcLargeInt = Replicate(NULCHAR, 8)
		m.lnApiRetVal = apiGetFileSizeEx(m.lnFileHandle, @m.lcLargeInt)

		If m.lnApiRetVal <> 0 Then
			m.lnFileSize = ctlCToLargeInteger(m.lcLargeInt)
		Endif
	Endif

	*!* Close file
	If m.llCloseFile = TRUE
		ctlFClose(m.lnFileHandle)
	Endif

	Return m.lnFileSize
Endfunc

********************************************************************************
*!* ctlFwrite(nFileHandle, cExpression [, nCharactersWritten])
********************************************************************************
Function ctlFWrite(m.pnFileHandle As Integer, m.pcExpression As String, m.pnCharactersWritten As Integer)

	Local ;
		m.lnBytesWritten As Integer, ;
		m.lnOverlapped As Integer, ;
		m.lnApiRetVal As Integer

	m.lnBytesWritten = 0
	m.lnOverlapped = 0

	If Vartype(m.pnCharactersWritten) <> T_NUMERIC Then
		m.pnCharactersWritten = Len(m.pcExpression)
	Endif

	m.lnApiRetVal = apiWriteFile(m.pnFileHandle, ;
		m.pcExpression, ;
		m.pnCharactersWritten , ;
		@m.lnBytesWritten, ;
		m.lnOverlapped)

	Return m.lnBytesWritten
Endfunc

********************************************************************************
Function ctlLargeIntegerToC(m.pnLargeInt As Integer)

	Local ;
		m.lnLow As Integer, ;
		m.lnHigh As Integer, ;
		m.lcLargeInt As String

	m.lnLow  = 0
	m.lnHigh = 0

	ctlLargeIntegerToLowHigh(m.pnLargeInt, @m.lnLow, @m.lnHigh)
	m.lcLargeInt = BinToC(m.lnLow, "4rs") + BinToC(m.lnHigh, "4rs")
	Return m.lcLargeInt
Endfunc

********************************************************************************
*!* ctlLargeIntegerToLowHigh(nLargeInt, @nLow, @nHigh)
********************************************************************************
Function ctlLargeIntegerToLowHigh(m.pnLargeInt, m.lnLow, m.lnHigh)

	m.lnLow  = m.pnLargeInt % 2^32
	m.lnHigh = Int((m.pnLargeInt - m.lnLow) / 2^32)

	If m.lnLow < 0 Then
		m.lnLow = m.lnLow + 2^32
	Endif

	Return
Endfunc

********************************************************************************
Function ctlLowHighToLargeInteger(pnLow As Integer, pnHigh As Integer)

	Local lnLargeInt As Integer

	If m.pnLow < 0 Then
		m.pnLow = m.pnLow + 2^32
	Endif

	m.lnLargeInt = m.pnLow + m.pnHigh * 2^32

	Return m.lnLargeInt
Endfunc

********************************************************************************
*!* ctlGetLangId
********************************************************************************
*!* pnLocale could be LOCALE_USER_DEFAULT, LOCALE_SYSTEM_DEFAULT
*!* /http://msdn.microsoft.com/library/default.asp?url=/library/en-us/intl/nls_34rz.asp
*!* /http://msdn.microsoft.com/library/default.asp?url=/library/en-us/intl/nls_8xo3.asp
*!* /http://msdn.microsoft.com/library/default.asp?url=/library/en-us/intl/nls_61df.asp
*!* Sets the value of strings that are language dependant.
********************************************************************************
Function ctlGetLangId(m.pnLocale As Integer, m.pnWhatToReturn As Integer)

	Local ;
		m.lnLocale As Integer, ;
		m.lcLocaleInfo As String, ;
		m.lnCharsRet As Integer, ;
		m.lnLangID As Integer, ;
		m.lnPrimaryLangID As Integer, ;
		m.lnSubLangID As Integer, ;
		m.lnRetVal As Integer

	If Pcount() > 0 .And. Vartype(m.pnLocale) = T_NUMERIC Then
		m.lnLocale = m.pnLocale
	Else
		m.lnLocale = LOCALE_SYSTEM_DEFAULT
	Endif

	m.lcLocaleInfo = Replicate(NULCHAR, 5)
	m.lnCharsRet = apiGetLocaleInfo(m.pnLocale , LOCALE_ILANGUAGE, @m.lcLocaleInfo, Len(m.lcLocaleInfo))
	*!* remove nul chars
	m.lcLocaleInfo = Strtran(m.lcLocaleInfo, NULCHAR, "")
	*!* m.lcLocaleInfo is now a character representation of a hex number
	m.lnLangID = Evaluate("0x" + m.lcLocaleInfo)
	*!*	m.lnPrimaryLangID = Bitand(m.lnLangID, 0x3FF)
	*!*	m.lnSubLangID = Bitrshift(m.lnLangID, 10)

	Do Case
		Case Pcount() < 2 Or m.pnWhatToReturn = 1
			m.lnRetVal =  m.lnLangID
		Case m.pnWhatToReturn = 2
			m.lnRetVal =  Bitand(m.lnLangID, 0x3FF)
		Case m.pnWhatToReturn = 3
			m.lnRetVal =  Bitrshift(m.lnLangID, 10)
		Otherwise
			m.lnRetVal =  m.lnLangID
	Endcase

	Return m.lnRetVal
Endfunc

********************************************************************************
*!* pnLocale could be LOCALE_USER_DEFAULT, LOCALE_SYSTEM_DEFAULT
********************************************************************************
Function ctlGetPrimaryLangID(m.pnLocale As Integer)
	Return ctlGetLangId(m.pnLocale, 2)
Endfunc

********************************************************************************
*!* Returns the height of a certain string in the font selected into a hwnd
********************************************************************************
Function ctlGetStringHeightFromHwnd(m.pcString, m.pnHWnd)

	Local ;
		m.lnDc As Integer, ;
		m.lnHeight As Integer, ;
		m.lnWidth As Integer, ;
		m.lcSize As String, ;
		m.lnFont As Integer, ;
		m.lnPrevFont As Integer

	*!* Get font
	m.lnFont = apiSendMessageInteger(m.pnHWnd, WM_GETFONT, 0, 0)
	*!* Get DC
	m.lnDc = apiGetDC(m.pnHWnd)
	*!* Apply font to DC, we get previous font as result
	m.lnPrevFont = apiSelectObject(m.lnDc, m.lnFont)

	m.lcSize = Space(8)

	apiGetTextExtentPoint32(m.lnDc, m.pcString, Len(m.pcString), @ m.lcSize)

	m.lnWidth = CToBin(Substr(m.lcSize, 1, 4), "4RS")	&& Width
	m.lnHeight = CToBin(Substr(m.lcSize, 5, 4), "4RS")	&& Height

	*!* Restore previous font
	apiSelectObject(m.lnDc, m.lnPrevFont )

	*!* Release DC
	apiReleaseDC(m.pnHWnd, m.lnDc)

	Return m.lnWidth
Endfunc

Function ctlGetStringWidthFromHwnd(m.lcString, m.lnHwnd)
Endfunc

********************************************************************************
*!* pnLocale could be LOCALE_USER_DEFAULT, LOCALE_SYSTEM_DEFAULT
********************************************************************************
Function ctlGetSubLangID(m.pnLocale As Integer)
	Return ctlGetLangId(m.pnLocale, 3)
Endfunc

********************************************************************************
Function ctlGetPrimaryLangIDFromLangID(m.pnLangID As Integer)
	Return Bitand(m.pnLangID, 0x3FF)
Endfunc

********************************************************************************
Function ctlGetSubLangIDFromLangID(m.pnLangID As Integer)
	Return Bitrshift(m.pnLangID, 10)
Endfunc

********************************************************************************
*!* ctlGetHostHWnd(Object)
********************************************************************************
*!* Returns the HWnd of the form that contains an object, if any
*!* If the object has no parent, returns _VFP.HWnd
*!* If the form is a top level form or has scrollbars,
*!* returns the HWnd of the inner window.
*!* Parameter can be a form, toolbar or control
********************************************************************************
Function ctlGetHostHWnd(m.poObject As Object)

	Local m.nhWnd As Integer

	*!* traverse the object hierarchy until we find the form:
	*!* Modified 20070603 to check for toolbars
	*!*		Do While Inlist(Upper(m.poObject.BaseClass), "FORM", "TOOLBAR") = FALSE
	*!*			m.poObject = m.poObject.Parent
	*!*		Enddo

	*!* 20080405 modified to check for HWnd property of parent
	*!* and to check if parent is an object

	*!* Check if we already have a form or toolbar:
	If Inlist(Upper(m.poObject.BaseClass), "FORM", "TOOLBAR") Then
		m.nhWnd = m.poObject.HWnd
	Else
		*!* Check if object is contained in another object:
		If Type("m.poObject.Parent") = T_UNDEFINED Then
			m.nhWnd = _vfp.HWnd
		Else
			*!* Get first parent:
			m.poObject = m.poObject.Parent

			*!* Traverse object hierarchy upwards until we find an object with a HWnd:
			Do While Pemstatus(m.poObject, "HWnd", 5) = FALSE
				If Type("m.poObject.Parent") = T_UNDEFINED Then
					m.nhWnd = _vfp.HWnd
					Exit
				Else
					m.poObject = m.poObject.Parent
				Endif
			Enddo
			m.nhWnd = m.poObject.HWnd
		Endif
	Endif

	*!* If we have a form, and the form is a top level form, or it has scrollbars,
	*!* get hWnd of inner window:
	If Upper(m.poObject.BaseClass) = "FORM" Then
		If m.poObject.ShowWindow = 2 Or m.poObject.ScrollBars > 0 Then
			*!* Get hWnd of client window of Top Level Form //Craig Boyd//
			If Version(CON_VER_NUM) >= 900
				m.nhWnd = Sys(2327, Sys(2325, Sys(2326, m.poObject.HWnd)))
			Else
				m.nhWnd = apiGetWindow(m.poObject.HWnd, GW_CHILD)
			Endif
		Endif
	Endif

	m.poObject = .Null.
	Release m.poObject

	Return m.nhWnd
Endfunc

********************************************************************************
*!* ctlGetHostHWnd()
*!* Returns the HWnd of a form, or the HWnd of the inner window in case of
*!* top level forms or forms with scrollbars
*!* Parameter can be a form, toolbar or control
********************************************************************************
Function ctlGetHostHWnd(m.poObject As Object)

	Local ;
		m.loForm As Form, ;
		m.nhWnd As Integer

	*!* traverse the object hierarchy until we find the form:
	*!* Modified 20070603 to check for toolbars
	Do While Inlist(Upper(m.poObject.BaseClass), "FORM", "TOOLBAR") = FALSE
		m.poObject = m.poObject.Parent
	Enddo

	m.loForm = m.poObject
	m.poObject = Null
	m.nhWnd = m.loForm.HWnd

	*!* If the form is a top level form, or it has scrollbars, get hWnd of inner window:
	If Upper(m.loForm.BaseClass) = "FORM" Then
		If m.loForm.ShowWindow = 2 Or m.loForm.ScrollBars > 0 Then
			*!* Get hWnd of client window of Top Level Form //Craig Boyd//
			If Version(CON_VER_NUM) >= 900
				m.nhWnd = Sys(2327, Sys(2325, Sys(2326, m.loForm.HWnd)))
			Else
				m.nhWnd = apiGetWindow(m.loForm.HWnd, GW_CHILD)
			Endif
		Endif
	Endif

	m.loForm = Null

	Return m.nhWnd
Endfunc

********************************************************************************
*!*	int GET_X_LPARAM(
*!*	    LPARAM lParam
*!*	);
*!*	Parameters
*!*	lParam
*!*	Specifies the value to be converted.
*!*	Return Value
*!*	The return value is the low-order int of the specified value.
********************************************************************************
Function ctlGet_X_lParam(m.pnlParam As Integer)
	Return Bitand(m.pnlParam, 0xFFFF)
Endfunc

********************************************************************************
Function ctlGetXFromLparam(m.pnlParam As Integer)
	Return Bitand(m.pnlParam, 0xFFFF)
Endfunc

********************************************************************************
*!*	int GET_Y_LPARAM(
*!*	    LPARAM lParam
*!*	);
*!*	Parameters
*!*	lParam
*!*	Specifies the value to be converted.
*!*	Return Value
*!*	The return value is the high-order int of the specified value.
********************************************************************************
Function ctlGet_Y_lParam(m.pnlParam As Integer)
	Return Bitrshift(m.pnlParam, 16)		&& Bitand(Int(m.pnlParam / 0x10000), 0xFFFF)
Endfunc

********************************************************************************
Function ctlGetUserName
	Local m.lcBuffer, m.lnBufferLen
	m.lcBufferLen = UNLEN + 1
	m.lcBuffer = Replicate(NULCHAR, m.lcBufferLen)
	apiGetUserName(@m.lcBuffer, @m.lcBufferLen)
	Return Left(m.lcBuffer, m.lcBufferLen - 1)
Endfunc

********************************************************************************
Function ctlGetYFromLparam(m.pnlParam As Integer)
	Return Bitrshift(m.pnlParam, 16)		&& Bitand(Int(m.pnlParam / 0x10000), 0xFFFF)
Endfunc

********************************************************************************
Function ctlGetWindowProcedure(m.pnHWnd As Integer)
	If Empty(m.pnHWnd) Then
		m.pnHWnd = _vfp.HWnd
	Endif
	Return apiGetWindowLong(m.pnHWnd, GWL_WNDPROC)
Endfunc

********************************************************************************
*!*	BYTE HIBYTE(
*!*	Word wValue
*!*	);
*!*	Parameters
*!*	wValue
*!*	Specifies the Value To be converted.
*!*	Return Value
*!*	the Return Value Is the High-Order BYTE Of the specified Value.
********************************************************************************
Function ctlHiByte(m.pnlParam As Integer)
	Return Bitrshift(m.pnlParam, 8)		&& Bitand(Int(m.pnlParam / 0x10000), 0xFFFF)
Endfunc

********************************************************************************
*!*	BYTE LOBYTE(
*!*	Word wValue
*!*	);
*!*	Parameters
*!*	wValue
*!*	Specifies the Value To be converted.
*!*	Return Value
*!*	the Return Value Is the low-Order BYTE Of the specified Value.
********************************************************************************
Function ctlLoByte(m.pnlParam As Integer)
	Return Bitand(m.pnlParam , 0xFF)
Endfunc

********************************************************************************
*!*	Word HIWORD(
*!*	DWORD dwValue
*!*	);
*!*	Parameters
*!*	dwValue
*!*	Specifies the Value To be converted.
*!*	Return Value
*!*	the Return Value Is the High-Order Word Of the specified Value.
********************************************************************************
Function ctlHiWord(m.pnlParam As Integer)
	Return Bitrshift(m.pnlParam, 16)		&& Bitand(Int(m.pnlParam / 0x10000), 0xFFFF)
Endfunc

********************************************************************************
*!*	Word LOWORD(
*!*	DWORD dwValue
*!*	);
*!*	Parameters
*!*	dwValue
*!*	Specifies the Value To be converted.
*!*	Return Value
*!*	the Return Value Is the low-Order Word Of the specified Value.
********************************************************************************
Function ctlLoWord(m.pnlParam As Integer)
	Return Bitand(m.pnlParam, 0xFFFF)
Endfunc


Function ctlGetStringResource(pcResource As String, pnStringId As Integer)
	Local ;
		lnModule As Integer, ;
		llReleaseLibrary As Boolean, ;
		lcString As String

	*!* Get module handle of user32 if it is loaded
	m.lnModule = apiGetModuleHandle(m.pcResource)

	*!* If not loaded, load it
	If m.lnModule = 0 Then
		m.llReleaseLibrary = TRUE
		m.lnModule = apiLoadLibrary(m.pcResource)
	Else
		m.llReleaseLibrary = FALSE
	Endif

	m.lcString = Replicate(NULA, 1024)

	m.lnStringLen = apiLoadString(m.lnModule, m.pnStringId, @m.lcString, Len(m.lcString))

	m.lcString = Left(m.lcString, m.lnStringLen)

	If m.llReleaseLibrary = TRUE Then
		apiFreeLibrary(m.lnModule)
	Endif

	Return m.lcString
Endfunc

********************************************************************************
*!*	DWORD MAKELONG(
*!*	Word wLow,
*!*	Word wHigh
*!*	);
*!*	Parameters
*!*	wLow
*!*	Specifies the low-Order Word Of the new Value.
*!*	wHigh
*!*	Specifies the High-Order Word Of the new Value.
*!*	Return Value
*!*	the Return Value Is a Long Value.
********************************************************************************
Function ctlMakeLong(m.pnLow As Integer, m.pnHigh As Integer)
	Return m.pnLow + m.pnHigh * 0x10000	&& Bitor(m.wLow, BITLSHIFT(m.wHigh, 16)
Endfunc

********************************************************************************
*!*	LPARAM MAKELPARAM(
*!*	    WORD wLow,
*!*	    WORD wHigh
*!*	);
*!*	Parameters
*!*	wLow
*!*	Specifies the low-order word of the new value.
*!*	wHigh
*!*	Specifies the high-order word of the new value.
*!*	Return Value
*!*	The return value is an LPARAM value.
********************************************************************************
Function ctlMakelParam(m.pnLow As Integer, m.pnHigh As Integer)
	Return m.pnLow + m.pnHigh * 0x10000	&& Bitor(m.wLow, BITLSHIFT(m.wHigh, 16)
Endfunc

********************************************************************************
*!*	POINT
*!*	The POINT structure defines the x- and y- coordinates of a point.
*!*	typedef struct tagPOINT {
*!*	  LONG x;
*!*	  LONG y;
*!*	} POINT, *PPOINT;
*!*	Members
*!*	x
*!*	Specifies the x-coordinate of the point.
*!*	y
*!*	Specifies the y-coordinate of the point.
*!* This is not a Windows Macro
********************************************************************************
Function ctlMakePoint(m.pnX As Integer, m.pnY As Integer)
	Return BinToC(m.pnX, "4RS") + BinToC(m.pnY, "4RS")
Endfunc

********************************************************************************
Function ctlMakewParam(m.pnLow As Integer, m.pnHigh As Integer)
	********************************************************************************
	Return ctlMakelParam(m.pnLow, m.pnHigh)
Endfunc

********************************************************************************
*!*	POINT
*!*	The POINT structure defines the x- and y- coordinates of a point.
*!*	typedef struct tagPOINT {
*!*	  LONG x;
*!*	  LONG y;
*!*	} POINT, *PPOINT;
*!*	Members
*!*	x
*!*	Specifies the x-coordinate of the point.
*!*	y
*!*	Specifies the y-coordinate of the point.
*!* This is not a Windows Macro
********************************************************************************
Function ctlGetXFromPoint(m.pcPoint As String)
	Return CToBin(Substr(m.pcPoint, 1, 4), "4RS")
Endfunc

********************************************************************************
*!*	POINT
*!*	The POINT structure defines the x- and y- coordinates of a point.
*!*	typedef struct tagPOINT {
*!*	  LONG x;
*!*	  LONG y;
*!*	} POINT, *PPOINT;
*!*	Members
*!*	x
*!*	Specifies the x-coordinate of the point.
*!*	y
*!*	Specifies the y-coordinate of the point.
*!* This is not a Windows Macro
********************************************************************************
Function ctlGetYFromPoint(m.pcPoint As String)
	Return CToBin(Substr(m.pcPoint, 5, 4), "4RS")
Endfunc

********************************************************************************
*!* This returns an object reference to the parent form
*!* of a non top level form:
*!* the _Screen, or some Top Level Form
*!* accepts as parameter a form reference
********************************************************************************
Function ctlGetParentForm(m.poForm As Form)
	Local ;
		m.lnHwnd As Integer, ;
		m.loForm As Form, ;
		m.lnX As Integer

	m.lnHwnd = apiGetParent(m.poForm.HWnd)

	If _Screen.HWnd = m.lnHwnd Then
		m.loForm = _Screen
	Else
		*!* Parent is a Top Level Form, get HWnd of form, what we have
		*!* now is HWnd of inner window of Top Level Form:
		m.lnHwnd = apiGetParent(m.lnHwnd)

		*!* Find the Top Level Form that has this HWnd:
		For m.lnX = 1 To _Screen.FormCount
			If _Screen.Forms(m.lnX).HWnd = m.lnHwnd Then
				m.loForm = _Screen.Forms(m.lnX)
				Exit
			Endif
		Endfor
	Endif

	Return m.loForm
Endfunc

********************************************************************************
*!* Returns current date formated string
*!* 1 DATE_SHORTDATE
*!* 2 DATE_LONGDATE
********************************************************************************
Function ctlGetDateFormat(pnFlags As Integer)

	Local ;
		lnLocale As Integer, ;
		lcDate As String, ;
		lcFormat As String, ;
		lcDateStr As String, ;
		lnDateStrLen As Integer, ;
		lnFlags As Integer

	If Vartype(m.pnFlags) # T_NUMERIC Then
		m.lnFlags = DATE_LONGDATE
	Else
		m.lnFlags = m.pnFlags
	Endif

	m.lnLocale = LOCALE_USER_DEFAULT

	m.lcDate = .Null.
	m.lcFormat = .Null.

	m.lnDateStrLen = 0xFF
	m.lcDateStr = Space(m.lnDateStrLen)

	m.lnDateStrLen = apiGetDateFormat( ;
		m.lnLocale, ;
		m.lnFlags, ;
		@m.lcDate, ;
		@m.lcFormat, ;
		@m.lcDateStr, ;
		m.lnDateStrLen)
	m.lcDateStr= Left(m.lcDateStr, m.lnDateStrLen - 1)

	Return m.lcDateStr
Endfunc

Function ctlGetDateFormatEx(pdDate, pnLocale, pnFlags)

	Local ;
		lcDate As String, ;
		lcFormat As String, ;
		lcDateStr As String, ;
		lnDateStrLen As Integer, ;
		ldDate As Date, ;
		lnLocale As Integer, ;
		lnFlags As Integer

	If Vartype(m.pdDate) # T_DATE Then
		m.ldDate = Date()
	Else
		m.ldDate = m.pdDate
	Endif

	If Vartype(m.pnLocale) # T_NUMERIC Then
		m.lnLocale = LOCALE_USER_DEFAULT
	Else
		m.lnLocale = m.pnLocale
	Endif

	If Vartype(m.pnFlags) # T_NUMERIC Then
		m.lnFlags = DATE_LONGDATE
	Else
		m.lnFlags = m.pnFlags
	Endif

	*!* .http://msdn.microsoft.com/en-us/library/ms724950(VS.85).aspx
	*!*	typedef struct _SYSTEMTIME {
	*!*	  WORD wYear;
	*!*	  WORD wMonth;
	*!*	  WORD wDayOfWeek;
	*!*	  WORD wDay;
	*!*	  WORD wHour;
	*!*	  WORD wMinute;
	*!*	  WORD wSecond;
	*!*	  WORD wMilliseconds;
	*!*	*!*	} SYSTEMTIME

	m.lcDate = ;
		BinToC(Year(m.ldDate), "2rs") + ;
		BinToC(Month(m.ldDate), "2rs") + ;
		BinToC(Dow(m.ldDate, 1), "2rs") + ;
		BinToC(Day(m.ldDate), "2rs") + ;
		0h0000 + ;
		0h0000 + ;
		0h0000 + ;
		0h0000

	m.lcFormat = .Null.

	m.lnDateStrLen = 0xFF
	m.lcDateStr = Space(m.lnDateStrLen)

	m.lnDateStrLen = apiGetDateFormat( ;
		m.lnLocale, ;
		m.lnFlags, ;
		m.lcDate, ;
		m.lcFormat, ;
		@m.lcDateStr, ;
		m.lnDateStrLen)

	m.lcDateStr= Left(m.lcDateStr, m.lnDateStrLen - 1)

	Return m.lcDateStr
Endfunc

********************************************************************************
*!* Returns the type of container a control is in, or the type of form
*!* accepts as parameter a control or a form reference

*!*	 CON_FORMTYPE_DEFAULT       0
*!*	 CON_FORMTYPE_TOPLEVEL      1
*!*	 CON_FORMTYPE_SCREEN        2

*!* Determine the type of form the control parameter is in,
*!* or the type of form, if the passed parameter is a form

*!* Parameter can be a form, toolbar or control
********************************************************************************
Function ctlGetFormType(m.poObject As Object)

	Local ;
		m.loForm As Form, ;
		m.lnFormType As Integer

	m.loForm = m.poObject

	*!* Go up the object hierarchy until we find a form:
	*!* 20070711 Modified to account for toolbars
	Do While Inlist(Upper(m.loForm.BaseClass), "FORM", "TOOLBAR") = FALSE
		If Type("m.loForm.Parent") = T_OBJECT Then
			m.loForm = m.loForm.Parent
		Else
			m.loForm = _Screen.ActiveForm
			Exit
		Endif
	Enddo

	m.lnFormType = CON_FORMTYPE_DEFAULT

	*!*	If container is a TLF, must have ShowWindow = 2
	If m.loForm.ShowWindow = CON_SHOWWIN_ASTOPLEVELFORM Then
		m.lnFormType = CON_FORMTYPE_TOPLEVEL
	Endif

	*!*	If Form.Name equals the _Screen.Name, then container is _Screen
	If m.loForm.Name == _Screen.Name Then
		m.lnFormType = CON_FORMTYPE_SCREEN
	Endif

	m.loForm = Null

	Return m.lnFormType
Endfunc

********************************************************************************
Function ctlTwipsPerPixelX()

	Local ;
		m.lnDc As Integer, ;
		m.lnLogPixelsX As Integer

	m.lnDc = apiGetDC(HWND_DESKTOP)
	m.lnLogPixelsX = apiGetDeviceCaps(m.lnDc, LOGPIXELSX)
	apiReleaseDC(HWND_DESKTOP, m.lnDc)
	Return Round(1440 / m.lnLogPixelsX, 0)
Endfunc

********************************************************************************
Function ctlTwipsPerPixelY()

	Local ;
		m.lnDc As Integer, ;
		m.lnLogPixelsY As Integer

	m.lnDc = apiGetDC(HWND_DESKTOP)
	m.lnLogPixelsY = apiGetDeviceCaps(m.lnDc, LOGPIXELSY)
	apiReleaseDC(HWND_DESKTOP, m.lnDc)
	Return Round(1440 / m.lnLogPixelsY, 0)
Endfunc

********************************************************************************
*!* GUID FUNCTIONS
********************************************************************************
*!* http://www.ietf.org/rfc/rfc4122.txt
*!* http://en.wikipedia.org/wiki/Globally_Unique_Identifier
*!* http://en.wikipedia.org/wiki/Universally_Unique_Identifier

********************************************************************************
*!* Returns a new binary 16 byte GUID

*!*	In Windows NT 4.0, Windows Me/98, and Windows 95 DCOM release, UuidCreate returns
*!*	RPC_S_UUID_LOCAL_ONLY when the originating computer does not have an ethernet/token ring
*!*	(IEEE 802.x) address. In this case, the generated UUID is a valid identifier, and is guaranteed
*!*	to be unique among all UUIDs generated on the computer. However, the possibility exists that
*!*	another computer without an ethernet/token ring address generated the identical UUID.
*!*	Therefore you should never use this UUID to identify an object that is not strictly local to
*!*	your computer. Computers with ethernet/token ring addresses generate UUIDs that are guaranteed
*!*	to be globally unique.
********************************************************************************
Function ctlNewGuid()

	Local m.lcGuid As String

	m.lcGuid = Replicate(Chr(0xFF), 16)
	apiUuidCreate(@m.lcGuid)

	Return m.lcGuid
Endfunc

********************************************************************************
Function ctlNewGuidNil()

	Local m.lcGuid As String

	m.lcGuid = Replicate(Chr(0xFF), 16)
	apiUuidCreateNil(@m.lcGuid)

	Return m.lcGuid
Endfunc

********************************************************************************
Function ctlNewGuidSequential()

	Local m.lcGuid As String

	m.lcGuid = Replicate(Chr(0xFF), 16)
	apiUuidCreateSequential(@m.lcGuid)

	Return m.lcGuid
Endfunc

********************************************************************************
*!* Returns a new 32 char GUID string
*!* Format "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
********************************************************************************
Function ctlNewGuidString32()
	Return ctlGuidToString32(ctlNewGuid())
Endfunc

********************************************************************************
*!* Returns a new 36 char GUID string
*!* Format "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
********************************************************************************
Function ctlNewGuidString36()
	Return ctlGuidToString36(ctlNewGuid())
Endfunc

********************************************************************************
*!* Returns a new 38 char GUID string
*!* Format "{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}"
********************************************************************************
Function ctlNewGuidString38()
	Return ctlGuidToString38(ctlNewGuid())
Endfunc

********************************************************************************
*!* Converts a binary 16 byte GUID to a 32 char GUID string
*!* format "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
********************************************************************************
Function ctlGuidToString32(pcGuid As String)

	Local m.lcGuidString As String

	m.lcGuidString = ""

	*!* Reorder GUID bytes
	m.lcGuidString = ;
		Substr(m.pcGuid, 4, 1) + ;
		Substr(m.pcGuid, 3, 1) + ;
		Substr(m.pcGuid, 2, 1) + ;
		Substr(m.pcGuid, 1, 1) + ;
		Substr(m.pcGuid, 6, 1) + ;
		Substr(m.pcGuid, 5, 1) + ;
		Substr(m.pcGuid, 8, 1) + ;
		Substr(m.pcGuid, 7, 1) + ;
		Substr(m.pcGuid, 9, 8)

	*!* Convert bytes to encoded HexBinary
	m.lcGuidString = Strconv(m.lcGuidString, 15)

	Return m.lcGuidString
Endfunc

********************************************************************************
*!* Converts a binary 16 byte GUID to a 36 char GUID string
*!* format "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
*!* This is faster that using the StringFromGuid2 API call
********************************************************************************
Function ctlGuidToString36(pcGuid As String)

	Local ;
		m.lcGuidString As String, ;
		m.lcGuid As String

	m.lcGuidString = ""

	*!* Convert bytes to encoded HexBinary
	m.lcGuid = Strconv(m.pcGuid, 15)

	*!* Reorder GUID bytes, Add hyphens
	m.lcGuidString = ;
		Substr(m.lcGuid, 07, 02) + ;
		Substr(m.lcGuid, 05, 02) + ;
		Substr(m.lcGuid, 03, 02) + ;
		Substr(m.lcGuid, 01, 02) + ;
		"-" + ;
		Substr(m.lcGuid, 11, 02) + ;
		Substr(m.lcGuid, 09, 02) + ;
		"-" + ;
		Substr(m.lcGuid, 15, 02) + ;
		Substr(m.lcGuid, 13, 02) + ;
		"-" + ;
		Substr(m.lcGuid, 17, 04) + ;
		"-" + ;
		Substr(m.lcGuid, 21, 12)

	Return m.lcGuidString
Endfunc

********************************************************************************
*!* Converts a binary 16 byte GUID to a 38 char GUID string
*!* format "{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}"
*!* This is faster that using the StringFromGuid2 API call
********************************************************************************
Function ctlGuidToString38(pcGuid As String)

	Local ;
		m.lcGuidString As String, ;
		m.lcGuid As String

	m.lcGuidString = ""

	*!* Convert bytes to encoded HexBinary
	m.lcGuid = Strconv(m.pcGuid, 15)

	*!* Reorder GUID bytes, Add brackets, hyphens
	m.lcGuidString = ;
		"{" + ;
		Substr(m.lcGuid, 07, 02) + ;
		Substr(m.lcGuid, 05, 02) + ;
		Substr(m.lcGuid, 03, 02) + ;
		Substr(m.lcGuid, 01, 02) + ;
		"-" + ;
		Substr(m.lcGuid, 11, 02) + ;
		Substr(m.lcGuid, 09, 02) + ;
		"-" + ;
		Substr(m.lcGuid, 15, 02) + ;
		Substr(m.lcGuid, 13, 02) + ;
		"-" + ;
		Substr(m.lcGuid, 17, 04) + ;
		"-" + ;
		Substr(m.lcGuid, 21, 12) + ;
		"}"

	Return m.lcGuidString
Endfunc

********************************************************************************
*!* Converts char GUID string to a binary 16 byte GUID
*!* format "{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}"
*!* format "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
*!* format "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
********************************************************************************
Function ctlGuidFromString(pcGuidString As String)

	Local ;
		m.lcGuid As String, ;
		m.lcGuidString As String

	m.lcGuid = ""

	*!* Strip brackets and hyphens
	m.lcGuidString = Chrtran(m.pcGuidString, "{-}", "")

	*!* Reorder GUID string chars
	m.lcGuid = ;
		+ Substr(m.lcGuidString, 7, 2) ;
		+ Substr(m.lcGuidString, 5, 2) ;
		+ Substr(m.lcGuidString, 3, 2) ;
		+ Left(m.lcGuidString, 2) ;
		+ Substr(m.lcGuidString, 11, 2) ;
		+ Substr(m.lcGuidString, 9, 2) ;
		+ Substr(m.lcGuidString, 15, 2) ;
		+ Substr(m.lcGuidString, 13, 2) ;
		+ Right(m.lcGuidString, 16)

	*!* Convert bytes to decoded HexBinary
	m.lcGuid = Strconv(m.lcGuid, 16)

	Return m.lcGuid
Endfunc

********************************************************************************
*!* Used just to check the other functions
*!* StringUuid parameter of UuidToString:
*!* Pointer to a pointer to the string into which
*!* the UUID specified in the Uuid parameter will be placed.
*!* UuidToString returns a string in the following format:
*!* "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx" (lowercase)
********************************************************************************
Function ctlGuidToStringApi1(m.pcGuid As String)

	Local m.lnPointer As Integer

	m.lnPointer = 0
	apiUuidToString(m.pcGuid, @m.lnPointer)

	Return Sys(2600, m.lnPointer, 36)
Endfunc

********************************************************************************
*!* Used just to check the other functions
********************************************************************************
Function ctlGuidToStringApi2(m.pcGuid As String)

	Local ;
		m.lcGuidString As String, ;
		m.lcLen As Integer

	*!* Set up buffer: 39 chars * 2 (unicode)
	m.lcGuidString = Space(78)
	m.lcLen = 78

	apiStringFromGUID2(m.pcGuid, @m.lcGuidString, m.lcLen)

	*!* Remove double null and convert from Unicode:
	Return Strconv(Left(m.lcGuidString, 76), 6)

Endfunc

********************************************************************************
*!* Used just to check the other functions
********************************************************************************
Function ctlGuidFromStringApi(m.pcGuidString As String)

	Local ;
		m.lcUuid As String, ;
		m.lcGuidString As String

	*!* Strip brackets and hyphens
	m.lcGuidString = Chrtran(m.pcGuidString, "{-}", "")

	*!* Add hyphens
	m.lcGuidString = ;
		LEFT(m.lcGuidString, 8) ;
		+ "-" ;
		+ Substr(m.lcGuidString, 9, 4) ;
		+ "-" ;
		+ Substr(m.lcGuidString, 13, 4) ;
		+ "-" ;
		+ Substr(m.lcGuidString, 17, 4) ;
		+ "-" ;
		+ Right(m.lcGuidString, 12)

	m.lcUuid = Replicate(Chr(0xFF), 16)
	apiUuidFromString(m.lcGuidString, @m.lcUuid)
	Return m.lcUuid

Endfunc

********************************************************************************
*!* END ctl32_functions
********************************************************************************


Function __BaseX( txVal, tcDom )
	* Converts a number to a string representation of that number
	* tnVal - Number
	* tcDom - The domain of characters to be used
	* typical Domains are:
	* "01" - Binary
	* "0123456789" - Decimal
	* "0123456789abcdef" - Hex
	* "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" - Base62
	* "23456789ABCDEFGHJKLMNPRSTUVWXYZ" - No {01IOQ} - they might confuse a user.

	* If you want the result padded, use PADL()

	Local ;
		lnVal, ;
		lnDomSiz, ;
		lcRet, ;
		lnPosition, ;
		lnPlace

	If Vartype(txVal) = "N"
		If txVal < 0 Then
			txVal = txVal + 1
		Endif
		lnVal = txVal
		lnDomSiz = Len(tcDom)

		* Humans get restless if the value zero is displayed as an empty string (blank).
		* The first char of the domain (generally 0) is normally used as a place holder,
		* but in the case of the value zero, it fills in to keep the peace.
		* This may have lead to the fall of Rome.

		If lnVal = 0
			lcRet = Substr( tcDom, 1, 1 )
		Else
			lcRet = ''
			Do While lnVal <> 0
				lnDig = lnVal % lnDomSiz
				lnVal = Int( lnVal/lnDomSiz )
				If txVal > 0 Then
					lcDig = Substr( tcDom, lnDig+1, 1 )
				Else
					If lnDig = 0 Then
						lnDig = 16
					Endif
					lcDig = Substr( tcDom, lnDig, 1 )
				Endif

				lcRet = lcDig + lcRet
			Enddo
		Endif
		lxRet=lcRet
	Else
		* Convert it back to decimal
		lnVal = 0
		lnPlace = 0
		For lnPosition = Len(txVal) To 1 Step -1
			lnVal = lnVal + (At( Substr(txVal,lnPosition,1), tcDom)-1) * (Len(tcDom)^lnPlace)
			lnPlace=lnPlace+1
		Endfor
		lxRet = lnVal
	Endif

	Return lxRet
Endfunc
