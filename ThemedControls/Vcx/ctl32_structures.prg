********************************************************************************
*!* ctl32_structures.prg
********************************************************************************
*!* This classes are based on the work of Christian Eischeld with vfp2c32
*!* vfp2c32.fll must be loaded with SET LIBRARY
********************************************************************************
#Include ctl32.h

If Not Sys(16) $ Upper(Set("Procedure")) Then
	Set Procedure To Sys(16) Additive
Endif

Return

********************************************************************************
*!* This is the base class for all structure classes below
********************************************************************************
Define Class _STRUCTBASE As Exception

	Address = 0
	InitMembersDone = FALSE
	Protected Embedded
	Embedded = FALSE
	Name = "STRUCTBASE"
	SizeOf = 0
	Value = FALSE

	Protected _MemberData
	_MemberData = '<VFPData>' + ;
		'<memberdata name="address" type="property" display="Address"/>' + ;
		'<memberdata name="initmembersdone" type="method" display="InitMembersDone"/>' + ;
		'<memberdata name="embedded" type="method" display="Embedded"/>' + ;
		'<memberdata name="name" type="property" display="Name"/>' + ;
		'<memberdata name="sizeof" type="property" display="SizeOf"/>' + ;
		'<memberdata name="value" type="property" display="Value"/>' + ;
		'</VFPData>'

	Protected Procedure Init(pnAddress)
		If Vartype(m.pnAddress) # "N" Then
			This.Address = AllocMem(This.SizeOf)
			If This.Address = 0
				Error(43)
				Return FALSE
			Endif
		Else
			This.Address = m.pnAddress
			This.Embedded = TRUE
		Endif
		This.InitMembers()
		This.InitMembersDone = TRUE
	Endproc

	Protected Procedure Destroy()
		This.FreeMembers()
		If This.Embedded = FALSE Then
			FreeMem(This.Address)
		Endif
	Endproc

	Procedure InitMembers()
		*!* Here we set up initial values, like size of structure member
		*!* And also create aditional substructures
	Endproc

	Procedure FreeMembers()
		*!* Here we free aditional substructures
	Endproc

	Hidden Procedure Value_Access()
		*!* This returns the whole structure
		Return Sys(2600, This.Address, This.SizeOf)
	Endproc

	Hidden Procedure Value_Assign(pnNewVal)
		*!* This assigns a string to the structure as a whole
		Sys(2600, This.Address, This.SizeOf, m.pnNewVal)
	Endproc

	*!*		Protected Procedure AllocMem(pnLength)
	*!*			*!* Allocates memory
	*!*			Return apiHeapAlloc(apiGetProcessHeap(), HEAP_ZERO_MEMORY, m.pnLength)
	*!*		Endproc

	*!*		Protected Procedure FreeMem(pnAddress)
	*!*			*!* Frees allocated memory
	*!*			Return apiHeapFree(apiGetProcessHeap(), 0, m.pnAddress)
	*!*		Endproc

	*!*		Protected Procedure ReadCharArray(pnAddress, pnLength)
	*!*			*!* Reads a string array of m.pnLength, stops at first nul char
	*!*			Local m.lcString As String
	*!*			m.lcString = Sys(2600, m.pnAddress, m.pnLength)
	*!*			Return Left(m.lcString , At(NULCHAR, m.lcString) - 1)
	*!*		Endproc

	*!*		Protected Procedure WriteCharArray(pnAddress, pcCharArray, pnLength)
	*!*			*!* Writes a string array of m.pnLength
	*!*			=Sys(2600, m.pnAddress, Min(Len(m.pcCharArray), m.pnLength) , m.pcCharArray)
	*!*			Return m.pnAddress
	*!*		Endproc

	*!*		Protected Procedure FreePMem(pnAddress)
	*!*			This.FreeMem(This.ReadUInt(m.pnAddress))
	*!*		Endproc

	*!*		Protected Procedure ReadPCString(pnAddress)
	*!*			*!* pnAddress is a pointer to a memory pointer
	*!*			Local m.lnAddress, m.lnLength, m.lcString
	*!*			*!* Get address pointer
	*!*			m.lnAddress = This.ReadUInt(m.pnAddress)
	*!*			If m.lnAddress <> 0 Then
	*!*				*!* Get length of memory pointer:
	*!*				m.lnLength = apiHeapSize(apiGetProcessHeap(), 0, m.lnAddress)
	*!*			Else
	*!*				m.lnLength = 0
	*!*			Endif
	*!*			*!* Read value of string pointer, then reads string
	*!*			If m.lnLength > 0 Then
	*!*				m.lcString = Sys(2600, m.lnAddress, m.lnLength)
	*!*				m.lcString = Left(m.lcString , At(NULCHAR, m.lcString) - 1)
	*!*			Else
	*!*				m.lcString = ""
	*!*			Endif
	*!*			?"m.lcString", m.lcString
	*!*			Return m.lcString
	*!*		Endproc


	Protected Procedure ReadPCString(pnAddress, pnLen)
		*!* pnAddress is a pointer to a memory pointer
		Local m.lnAddress, m.lnLength, m.lcString
		*!* Get address pointer
		m.lnAddress = ReadUInt(m.pnAddress)
		If m.lnAddress <> 0 Then
			m.lcString = Sys(2600, m.lnAddress, m.pnLen)
		Else
			m.lcString = ""
		Endif
		Return m.lcString
	Endproc

	*!*		Protected Procedure WritePCString(pnAddress, pcString)
	*!*			Local m.lnAdress As Integer
	*!*			*!* Release memory
	*!*			This.FreePMem(m.pnAddress)
	*!*			*!* Get a new handle for the string:
	*!*			m.lnAddress = This.AllocMem(Len(m.pcString))
	*!*			*!* Save string to handle
	*!*			=Sys(2600, m.lnAddress, Len(m.pcString), m.pcString)
	*!*			*!* Save value of handle in memory pointer
	*!*			This.WriteUInt(m.pnAddress, m.lnAddress)
	*!*		Endproc

	*!*		Protected Procedure ReadUInt(pnAddress)
	*!*			*!* Reads an unsigned integer (4 bytes)
	*!*			Local m.lnUInt As Integer
	*!*			m.lnUInt = CToBin(Sys(2600, m.pnAddress, 4), "4rs")
	*!*			If m.lnUInt < 0 Then
	*!*				m.lnUInt = m.lnUInt + 0x100000000
	*!*			Endif
	*!*			Return m.lnUInt
	*!*		Endproc

	*!*		Protected Procedure WriteUInt(pnAddress, pnUInt)
	*!*			*!* Writes an unsigned integer (4 bytes)
	*!*			=Sys(2600, m.pnAddress, 4, BinToC(m.pnUInt, "4rs"))
	*!*		Endproc

	*!*		Protected Procedure ReadUShort(pnAddress)
	*!*			Local m.lnShort As Short
	*!*			m.lnShort = CToBin(Sys(2600, m.pnAddress, 2), "2rs")
	*!*			If m.lnShort < 0 Then
	*!*				m.lnShort = m.lnShort + 0x10000
	*!*			Endif
	*!*			Return m.lnShort
	*!*		Endproc

	*!*		Protected Procedure WriteUShort(pnAddress, pnShort)
	*!*			*!* Writes an unsigned short (2 bytes)
	*!*			=Sys(2600, m.pnAddress, 2, BinToC(m.pnShort, "2rs"))
	*!*		Endproc

	*!*		Protected Procedure ReadPointer(pnAddress)
	*!*			*!* Reads an integer (4 bytes)
	*!*			Return CToBin(Sys(2600, m.pnAddress, 4), "4rs")
	*!*		Endproc

	*!*		Protected Procedure WritePointer(pnAddress, pnInt)
	*!*			*!* Writes an integer (4 bytes)
	*!*			=Sys(2600, m.pnAddress, 4, BinToC(m.pnInt, "4rs"))
	*!*		Endproc

	*!*		Protected Procedure ReadInt(pnAddress)
	*!*			*!* Reads an integer (4 bytes)
	*!*			Return CToBin(Sys(2600, m.pnAddress, 4), "4rs")
	*!*		Endproc

	*!*		Protected Procedure WriteInt(pnAddress, pnInt)
	*!*			*!* Writes an integer (4 bytes)
	*!*			=Sys(2600, m.pnAddress, 4, BinToC(m.pnInt, "4rs"))
	*!*		Endproc

	Protected Procedure ReadByte(pnAddress)
		*!* Reads an integer (1 bytes)
		Return CToBin(Sys(2600, m.pnAddress, 1), "1rs")
	Endproc

	Protected Procedure WriteByte(pnAddress, pnInt)
		*!* Writes an integer (1 bytes)
		=Sys(2600, m.pnAddress, 1, BinToC(m.pnInt, "1rs"))
	Endproc

	*!*		Protected Procedure ReadPointer(pnAddress)
	*!*			*!* Reads an integer (4 bytes)
	*!*			Return This.ReadUInt(m.pnAddress)
	*!*		Endproc

	*!*		Protected Procedure WritePointer(pnAddress, pnInt)
	*!*			*!* Writes an integer (4 bytes)
	*!*			Return This.WriteUInt(m.pnAddress, m.pnInt)
	*!*		Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagBITMAPFILEHEADER {
*!*	  WORD    bfType;
*!*	  DWORD   bfSize;
*!*	  WORD    bfReserved1;
*!*	  WORD    bfReserved2;
*!*	  DWORD   bfOffBits;
*!*	} BITMAPFILEHEADER, *PBITMAPFILEHEADER;
********************************************************************************
Define Class _BITMAPFILEHEADER As _STRUCTBASE

	SizeOf = 14
	Name = "BITMAPFILEHEADER"
	&& structure fields
	bfType = FALSE
	bfSize = FALSE
	bfReserved1 = FALSE
	bfReserved2 = FALSE
	bfOffBits = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="bftype" type="property" display="bfType"/>' + ;
		'<memberdata name="bfsize" type="property" display="bfSize"/>' + ;
		'<memberdata name="bfreserved1" type="property" display="bfReserved1"/>' + ;
		'<memberdata name="bfreserved2" type="property" display="bfReserved2"/>' + ;
		'<memberdata name="bfoffbits" type="property" display="bfOffBits"/>' + ;
		'</VFPData>'

	Procedure bfType_Access()
		Return ReadUShort(This.Address)
	Endproc

	Procedure bfType_Assign(pnNewVal)
		WriteUShort(This.Address, m.pnNewVal)
	Endproc

	Procedure bfSize_Access()
		Return ReadUInt(This.Address + 2)
	Endproc

	Procedure bfSize_Assign(pnNewVal)
		WriteUInt(This.Address + 2, m.pnNewVal)
	Endproc

	Procedure bfReserved1_Access()
		Return ReadUShort(This.Address + 6)
	Endproc

	Procedure bfReserved1_Assign(pnNewVal)
		WriteUShort(This.Address + 6, m.pnNewVal)
	Endproc

	Procedure bfReserved2_Access()
		Return ReadUShort(This.Address + 8)
	Endproc

	Procedure bfReserved2_Assign(pnNewVal)
		WriteUShort(This.Address + 8, m.pnNewVal)
	Endproc

	Procedure bfOffBits_Access()
		Return ReadUInt(This.Address + 10)
	Endproc

	Procedure bfOffBits_Assign(pnNewVal)
		WriteUInt(This.Address+10, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagBITMAPINFOHEADER{
*!*	  DWORD  biSize;
*!*	  LONG   biWidth;
*!*	  LONG   biHeight;
*!*	  WORD   biPlanes;
*!*	  WORD   biBitCount;
*!*	  DWORD  biCompression;
*!*	  DWORD  biSizeImage;
*!*	  LONG   biXPelsPerMeter;
*!*	  LONG   biYPelsPerMeter;
*!*	  DWORD  biClrUsed;
*!*	  DWORD  biClrImportant;
*!*	} BITMAPINFOHEADER, *PBITMAPINFOHEADER;
********************************************************************************
Define Class _BITMAPINFOHEADER As _STRUCTBASE

	SizeOf = 40
	Name = "BITMAPINFOHEADER"
	&& structure fields
	biSize = FALSE
	biWidth = FALSE
	biHeight = FALSE
	biPlanes = FALSE
	biBitCount = FALSE
	biCompression = FALSE
	biSizeImage = FALSE
	biXPelsPerMeter = FALSE
	biYPelsPerMeter = FALSE
	biClrUsed = FALSE
	biClrImportant = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="bisize" type="property" display="biSize"/>' + ;
		'<memberdata name="biwidth" type="property" display="biWidth"/>' + ;
		'<memberdata name="biheight" type="property" display="biHeight"/>' + ;
		'<memberdata name="biplanes" type="property" display="biPlanes"/>' + ;
		'<memberdata name="bibitcount" type="property" display="biBitCount"/>' + ;
		'<memberdata name="bicompression" type="property" display="biCompression"/>' + ;
		'<memberdata name="bisizeimage" type="property" display="biSizeImage"/>' + ;
		'<memberdata name="bixpelspermeter" type="property" display="biXPelsPerMeter"/>' + ;
		'<memberdata name="biypelspermeter" type="property" display="biYPelsPerMeter"/>' + ;
		'<memberdata name="biclrused" type="property" display="biClrUsed"/>' + ;
		'<memberdata name="biclrimportant" type="property" display="biClrImportant"/>' + ;
		'</VFPData>'

	Procedure biSize_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure biSize_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure biWidth_Access()
		Return ReadInt(This.Address + 4)
	Endproc

	Procedure biWidth_Assign(pnNewVal)
		WriteInt(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure biHeight_Access()
		Return ReadInt(This.Address + 8)
	Endproc

	Procedure biHeight_Assign(pnNewVal)
		WriteInt(This.Address + 8, m.pnNewVal)
	Endproc

	Procedure biPlanes_Access()
		Return ReadUShort(This.Address + 12)
	Endproc

	Procedure biPlanes_Assign(pnNewVal)
		WriteUShort(This.Address + 12, m.pnNewVal)
	Endproc

	Procedure biBitCount_Access()
		Return ReadUShort(This.Address + 14)
	Endproc

	Procedure biBitCount_Assign(pnNewVal)
		WriteUShort(This.Address + 14, m.pnNewVal)
	Endproc

	Procedure biCompression_Access()
		Return ReadUInt(This.Address + 16)
	Endproc

	Procedure biCompression_Assign(pnNewVal)
		WriteUInt(This.Address + 16, m.pnNewVal)
	Endproc

	Procedure biSizeImage_Access()
		Return ReadUInt(This.Address + 20)
	Endproc

	Procedure biSizeImage_Assign(pnNewVal)
		WriteUInt(This.Address + 20, m.pnNewVal)
	Endproc

	Procedure biXPelsPerMeter_Access()
		Return ReadInt(This.Address + 24)
	Endproc

	Procedure biXPelsPerMeter_Assign(pnNewVal)
		WriteInt(This.Address + 24, m.pnNewVal)
	Endproc

	Procedure biYPelsPerMeter_Access()
		Return ReadInt(This.Address + 28)
	Endproc

	Procedure biYPelsPerMeter_Assign(pnNewVal)
		WriteInt(This.Address + 28, m.pnNewVal)
	Endproc

	Procedure biClrUsed_Access()
		Return ReadUInt(This.Address + 32)
	Endproc

	Procedure biClrUsed_Assign(pnNewVal)
		WriteUInt(This.Address + 32, m.pnNewVal)
	Endproc

	Procedure biClrImportant_Access()
		Return ReadUInt(This.Address + 36)
	Endproc

	Procedure biClrImportant_Assign(pnNewVal)
		WriteUInt(This.Address + 36, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct _browseinfo {
*!*	    HWND hwndOwner;
*!*	    UINT pidlRoot;
*!*	    LPTSTR pszDisplayName;
*!*	    LPCTSTR lpszTitle;
*!*	    UINT ulFlags;
*!*	    UINT lpfn;
*!*	    LPARAM lParam;
*!*	    int iImage;
*!*	} BROWSEINFO, *PBROWSEINFO, *LPBROWSEINFO;
********************************************************************************
Define Class _BROWSEINFO As _STRUCTBASE

	Address = 0
	SizeOf = 32
	Name = "BROWSEINFO"
	&& structure fields
	hwndOwner = .F.
	pidlRoot = .F.
	pszDisplayName = .F.
	lpszTitle = .F.
	ulFlags = .F.
	lpfn = .F.
	Lparam = .F.
	iImage = .F.

	_MemberData = '<VFPData>' + ;
		'<memberdata name="hwndowner" type="property" display="hwndOwner"/>' + ;
		'<memberdata name="pidlroot" type="property" display="pidlRoot"/>' + ;
		'<memberdata name="pszdisplayname" type="property" display="pszDisplayName"/>' + ;
		'<memberdata name="lpsztitle" type="property" display="lpszTitle"/>' + ;
		'<memberdata name="ulflags" type="property" display="ulFlags"/>' + ;
		'<memberdata name="lpfn" type="property" display="lpfn"/>' + ;
		'<memberdata name="lparam" type="property" display="lParam"/>' + ;
		'<memberdata name="iimage" type="property" display="iImage"/>' + ;
		'</VFPData>'

	Procedure FreeMembers()
		FreePMem(This.Address + 8)
		FreePMem(This.Address + 12)
	Endproc

	Procedure hwndOwner_Access()
		Return ReadInt(This.Address)
	Endproc

	Procedure hwndOwner_Assign(lnNewVal)
		WriteInt(This.Address, m.lnNewVal)
	Endproc

	Procedure pidlRoot_Access()
		Return ReadUInt(This.Address + 4)
	Endproc

	Procedure pidlRoot_Assign(lnNewVal)
		WriteUInt(This.Address + 4, m.lnNewVal)
	Endproc

	Procedure pszDisplayName_Access()
		Return ReadPCString(This.Address + 8)
	Endproc

	Procedure pszDisplayName_Assign(lnNewVal)
		WritePCString(This.Address + 8, m.lnNewVal)
	Endproc

	Procedure lpszTitle_Access()
		Return ReadPCString(This.Address + 12)
	Endproc

	Procedure lpszTitle_Assign(lnNewVal)
		WritePCString(This.Address + 12, m.lnNewVal)
	Endproc

	Procedure ulFlags_Access()
		Return ReadUInt(This.Address + 16)
	Endproc

	Procedure ulFlags_Assign(lnNewVal)
		WriteUInt(This.Address + 16, m.lnNewVal)
	Endproc

	Procedure lpfn_Access()
		Return ReadUInt(This.Address + 20)
	Endproc

	Procedure lpfn_Assign(lnNewVal)
		WriteUInt(This.Address + 20, m.lnNewVal)
	Endproc

	Procedure lParam_Access()
		Return ReadInt(This.Address + 24)
	Endproc

	Procedure lParam_Assign(lnNewVal)
		WriteInt(This.Address + 24, m.lnNewVal)
	Endproc

	Procedure iImage_Access()
		Return ReadInt(This.Address + 28)
	Endproc

	Procedure iImage_Assign(lnNewVal)
		WriteInt(This.Address + 28, m.lnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct _DOC_INFO_1 {
*!*	  LPTSTR pDocName;
*!*	  LPTSTR pOutputFile;
*!*	  LPTSTR pDatatype;
*!*	} DOC_INFO_1;
********************************************************************************
Define Class _DOC_INFO_1 As _STRUCTBASE

	Address = 0
	SizeOf = 12
	Name = "DOC_INFO_1"
	&& structure fields
	pDocName = FALSE
	pOutputFile = FALSE
	pDatatype = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="pdocname" type="property" display="pDocName"/>' + ;
		'<memberdata name="poutputfile" type="property" display="pOutputFile"/>' + ;
		'<memberdata name="pdatatype" type="property" display="pDatatype"/>' + ;
		'</VFPData>'

	Procedure FreeMembers()
		FreePMem(This.Address)
		FreePMem(This.Address + 4)
		FreePMem(This.Address + 8)
	Endproc

	Procedure pDocName_Access()
		Return ReadPCString(This.Address)
	Endproc

	Procedure pDocName_Assign(pnNewVal)
		WritePCString(This.Address, m.pnNewVal)
	Endproc

	Procedure pOutputFile_Access()
		Return ReadPCString(This.Address + 4)
	Endproc

	Procedure pOutputFile_Assign(pnNewVal)
		WritePCString(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure pDatatype_Access()
		Return ReadPCString(This.Address + 8)
	Endproc

	Procedure pDatatype_Assign(pnNewVal)
		WritePCString(This.Address + 8, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagDRAWITEMSTRUCT {
*!*	  UINT CtlType;
*!*	  UINT CtlID;
*!*	  UINT itemID;
*!*	  UINT itemAction;
*!*	  UINT itemState;
*!*	  HWND hwndItem;
*!*	  HDC hDC;
*!*	  RECT rcItem;
*!*	  ULONG_PTR itemData;
*!*	} DRAWITEMSTRUCT;
********************************************************************************
Define Class _DRAWITEMSTRUCT As _STRUCTBASE

	SizeOf = 48
	Name = "DRAWITEMSTRUCT"
	&& structure fields
	CtlType = FALSE
	CtlID = FALSE
	ItemID = FALSE
	itemAction = FALSE
	itemState = FALSE
	hwndItem = FALSE
	hDC = FALSE
	rcItem = .Null.
	ItemData = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="ctltype" type="property" display="CtlType"/>' + ;
		'<memberdata name="ctlid" type="property" display="CtlID"/>' + ;
		'<memberdata name="itemid" type="property" display="itemID"/>' + ;
		'<memberdata name="itemaction" type="property" display="itemAction"/>' + ;
		'<memberdata name="itemstate" type="property" display="itemState"/>' + ;
		'<memberdata name="hwnditem" type="property" display="hwndItem"/>' + ;
		'<memberdata name="hdc" type="property" display="hDC"/>' + ;
		'<memberdata name="rcitem" type="property" display="rcItem"/>' + ;
		'<memberdata name="itemdata" type="property" display="itemData"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		This.rcItem = Createobject("_RECT",This.Address + 28)
	Endproc

	Procedure FreeMembers()
		This.rcItem = .Null.
	Endproc

	Procedure Address_Assign(lnAddress)
		This.Address = m.lnAddress
		If This.InitMembersDone = TRUE Then
			This.rcItem.Address = m.lnAddress + 28
		Endif
	Endproc

	Procedure CtlType_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure CtlType_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure CtlID_Access()
		Return ReadUInt(This.Address + 4)
	Endproc

	Procedure CtlID_Assign(pnNewVal)
		WriteUInt(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure itemID_Access()
		Return ReadUInt(This.Address + 8)
	Endproc

	Procedure itemID_Assign(pnNewVal)
		WriteUInt(This.Address + 8, m.pnNewVal)
	Endproc

	Procedure itemAction_Access()
		Return ReadUInt(This.Address + 12)
	Endproc

	Procedure itemAction_Assign(pnNewVal)
		WriteUInt(This.Address + 12, m.pnNewVal)
	Endproc

	Procedure itemState_Access()
		Return ReadUInt(This.Address + 16)
	Endproc

	Procedure itemState_Assign(pnNewVal)
		WriteUInt(This.Address + 16, m.pnNewVal)
	Endproc

	Procedure hwndItem_Access()
		Return ReadUInt(This.Address + 20)
	Endproc

	Procedure hwndItem_Assign(pnNewVal)
		WriteUInt(This.Address + 20, m.pnNewVal)
	Endproc

	Procedure hDC_Access()
		Return ReadPointer(This.Address + 24)
	Endproc

	Procedure hDC_Assign(pnNewVal)
		WritePointer(This.Address + 24, m.pnNewVal)
	Endproc

	Procedure itemData_Access()
		Return ReadUInt(This.Address + 44)
	Endproc

	Procedure itemData_Assign(pnNewVal)
		WriteUInt(This.Address + 44, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct _FILETIME {
*!*	 DWORD dwLowDateTime;
*!*	 DWORD dwHighDateTime;
*!*	} FILETIME,
*!*	 *PFILETIME;
********************************************************************************
Define Class _FILETIME As _STRUCTBASE

	SizeOf = 8
	Name = "FILETIME"
	&& structure fields
	dwLowDateTime = FALSE
	dwHighDateTime = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="dwlowdatetime" type="property" display="dwLowDateTime"/>' + ;
		'<memberdata name="dwhighdatetime" type="property" display="dwHighDateTime"/>' + ;
		'</VFPData>'

	Procedure dwLowDateTime_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure dwLowDateTime_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure dwHighDateTime_Access()
		Return ReadUInt(This.Address + 4)
	Endproc

	Procedure dwHighDateTime_Assign(pnNewVal)
		WriteUInt(This.Address + 4, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct
*!*	{
*!*	    BYTE        bWidth;          // Width, in pixels, of the image
*!*	    BYTE        bHeight;         // Height, in pixels, of the image
*!*	    BYTE        bColorCount;     // Number of colors in image (0 if >=8bpp)
*!*	    BYTE        bReserved;       // Reserved ( must be 0)
*!*	    WORD        wPlanes;         // Color Planes
*!*	    WORD        wBitCount;       // Bits per pixel
*!*	    DWORD       dwBytesInRes;    // How many bytes in this resource?
*!*	    DWORD       dwImageOffset;   // Where in the file is this image?
*!*	} ICONDIRENTRY, *LPICONDIRENTRY;
********************************************************************************
Define Class _ICONDIRENTRY As _STRUCTBASE

	SizeOf = 16
	Name = "ICONDIRENTRY"
	&& structure fields
	bWidth = FALSE
	bHeight = FALSE
	bColorCount = FALSE
	bReserved = FALSE
	wPlanes = FALSE
	wBitCount = FALSE
	dwBytesInRes = FALSE
	dwImageOffset = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="bwidth" type="property" display="bWidth"/>' + ;
		'<memberdata name="bheight" type="property" display="bHeight"/>' + ;
		'<memberdata name="bcolorcount" type="property" display="bColorCount"/>' + ;
		'<memberdata name="breserved" type="property" display="bReserved"/>' + ;
		'<memberdata name="wplanes" type="property" display="wPlanes"/>' + ;
		'<memberdata name="wbitcount" type="property" display="wBitCount"/>' + ;
		'<memberdata name="dwbytesinres" type="property" display="dwBytesInRes"/>' + ;
		'<memberdata name="dwimageoffset" type="property" display="dwImageOffset"/>' + ;
		'</VFPData>'

	Procedure bWidth_Access()
		Local m.lnWidth
		m.lnWidth = This.ReadByte(This.Address)
		If m.lnWidth < 0 Then
			m.lnWidth = m.lnWidth + 0x100
		Endif
		If m.lnWidth = 0 Then
			m.lnWidth = 256
		Endif
		Return m.lnWidth
	Endproc

	Procedure bWidth_Assign(pnNewVal)
		If m.pnNewVal = 256 Then
			m.pnNewVal = 0
		Endif
		If m.pnNewVal < 0 Then
			m.pnNewVal = m.pnNewVal + 0x100
		Endif
		This.WriteByte(This.Address, m.pnNewVal)
	Endproc

	Procedure bHeight_Access()
		Local m.lnHeight
		m.lnHeight = This.ReadByte(This.Address + 1)
		If m.lnHeight < 0 Then
			m.lnHeight = m.lnHeight + 0x100
		Endif
		If m.lnHeight = 0 Then
			m.lnHeight = 256
		Endif
		Return m.lnHeight
	Endproc

	Procedure bHeight_Assign(pnNewVal)
		If m.pnNewVal = 256 Then
			m.pnNewVal = 0
		Endif
		If m.pnNewVal < 0 Then
			m.pnNewVal = m.pnNewVal + 0x100
		Endif
		This.WriteByte(This.Address + 1, m.pnNewVal)
	Endproc

	Procedure bColorCount_Access()
		Return This.ReadByte(This.Address + 2)
	Endproc

	Procedure bColorCount_Assign(pnNewVal)
		This.WriteByte(This.Address + 2, m.pnNewVal)
	Endproc

	Procedure bReserved_Access()
		Return This.ReadByte(This.Address + 3)
	Endproc

	Procedure bReserved_Assign(pnNewVal)
		This.WriteByte(This.Address + 3, m.pnNewVal)
	Endproc

	Procedure wPlanes_Access()
		Return ReadUShort(This.Address + 4)
	Endproc

	Procedure wPlanes_Assign(pnNewVal)
		WriteUShort(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure wBitCount_Access()
		Return ReadUShort(This.Address + 6)
	Endproc

	Procedure wBitCount_Assign(pnNewVal)
		WriteUShort(This.Address + 6, m.pnNewVal)
	Endproc

	Procedure dwBytesInRes_Access()
		Return ReadUInt(This.Address + 8)
	Endproc

	Procedure dwBytesInRes_Assign(pnNewVal)
		WriteUInt(This.Address + 8, m.pnNewVal)
	Endproc

	Procedure dwImageOffset_Access()
		Return ReadUInt(This.Address + 12)
	Endproc

	Procedure dwImageOffset_Assign(pnNewVal)
		WriteUInt(This.Address + 12, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagLOGFONT {
*!*	  LONG lfHeight;
*!*	  LONG lfWidth;
*!*	  LONG lfEscapement;
*!*	  LONG lfOrientation;
*!*	  LONG lfWeight;
*!*	  BYTE lfItalic;
*!*	  BYTE lfUnderline;
*!*	  BYTE lfStrikeOut;
*!*	  BYTE lfCharSet;
*!*	  BYTE lfOutPrecision;
*!*	  BYTE lfClipPrecision;
*!*	  BYTE lfQuality;
*!*	  BYTE lfPitchAndFamily;
*!*	  TCHAR lfFaceName[LF_FACESIZE];
*!*	} LOGFONT, *PLOGFONT;
********************************************************************************
Define Class _LOGFONT As _STRUCTBASE
	SizeOf = 60
	Name = "LOGFONT"
	&& structure fields
	lfHeight = FALSE
	lfWidth = FALSE
	lfEscapement = FALSE
	lfOrientation = FALSE
	lfWeight = FALSE
	lfItalic = FALSE
	lfUnderline = FALSE
	lfStrikeOut = FALSE
	lfCharSet = FALSE
	lfOutPrecision = FALSE
	lfClipPrecision = FALSE
	lfQuality = FALSE
	lfPitchAndFamily = FALSE
	lfFaceName = FALSE
	&& extra properties
	FontBold = FALSE
	FontCharSet = 1
	FontItalic = FALSE
	FontName = ""
	FontSize = 0
	FontStrikethru = FALSE
	FontUnderline = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="lfheight" type="property" display="lfHeight"/>' + ;
		'<memberdata name="lfwidth" type="property" display="lfWidth"/>' + ;
		'<memberdata name="lfescapement" type="property" display="lfEscapement"/>' + ;
		'<memberdata name="lforientation" type="property" display="lfOrientation"/>' + ;
		'<memberdata name="lfweight" type="property" display="lfWeight"/>' + ;
		'<memberdata name="lfitalic" type="property" display="lfItalic"/>' + ;
		'<memberdata name="lfunderline" type="property" display="lfUnderline"/>' + ;
		'<memberdata name="lfstrikeout" type="property" display="lfStrikeOut"/>' + ;
		'<memberdata name="lfcharset" type="property" display="lfCharSet"/>' + ;
		'<memberdata name="lfoutprecision" type="property" display="lfOutPrecision"/>' + ;
		'<memberdata name="lfclipprecision" type="property" display="lfClipPrecision"/>' + ;
		'<memberdata name="lfquality" type="property" display="lfQuality"/>' + ;
		'<memberdata name="lfpitchandfamily" type="property" display="lfPitchAndFamily"/>' + ;
		'<memberdata name="lffacename" type="property" display="lfFaceName"/>' + ;
		'<memberdata name="fontbold" type="property" display="FontBold"/>' + ;
		'<memberdata name="fontcharset" type="property" display="FontCharSet"/>' + ;
		'<memberdata name="fontitalic" type="property" display="FontItalic"/>' + ;
		'<memberdata name="fontname" type="property" display="FontName"/>' + ;
		'<memberdata name="fontsize" type="property" display="FontSize"/>' + ;
		'<memberdata name="fontstrikethru" type="property" display="FontStrikethru"/>' + ;
		'<memberdata name="fontunderline" type="property" display="FontUnderline"/>' + ;
		'</VFPData>'

	Procedure FontBold_Access()
		Return Iif(This.lfWeight >= FW_BOLD, TRUE, FALSE)
	Endproc

	Procedure FontBold_Assign(vNewVal)
		If Vartype(m.vNewVal) = T_NUMERIC Then
			If m.vNewVal < FW_BOLD Then
				m.vNewVal = FALSE
			Else
				m.vNewVal = TRUE
			Endif
		Endif
		If m.vNewVal = TRUE Then
			This.lfWeight = FW_BOLD
		Else
			This.lfWeight = FW_NORMAL
		Endif
	Endproc

	Procedure FontCharset_Access()
		Return This.lfCharSet
	Endproc

	Procedure FontCharset_Assign(vNewVal)
		This.lfCharSet = m.vNewVal
	Endproc

	Procedure FontItalic_Access()
		Return Iif(This.lfItalic <> 0, TRUE, FALSE)
	Endproc

	Procedure FontItalic_Assign(vNewVal)
		If Vartype(m.vNewVal) = T_NUMERIC Then
			If m.vNewVal = 0 Then
				m.vNewVal = FALSE
			Else
				m.vNewVal = TRUE
			Endif
		Endif
		If m.vNewVal = TRUE Then
			This.lfItalic = 1
		Else
			This.lfItalic = 0
		Endif
	Endproc

	Procedure FontName_Access()
		Return This.lfFaceName
	Endproc

	Procedure FontName_Assign(vNewVal)
		If Right(m.vNewVal, 1) <> NULCHAR Then
			m.vNewVal = m.vNewVal + NULCHAR
		Endif
		This.lfFaceName = m.vNewVal
	Endproc

	Procedure FontSize_Access()
		Return ctlFontHeightToPoints(This.lfHeight)
	Endproc

	Procedure FontSize_Assign(vNewVal)
		This.lfHeight = ctlFontPointsToHeight(m.vNewVal)
	Endproc

	Procedure FontStrikethru_Access()
		Return Iif(This.lfStrikeOut <> 0, TRUE, FALSE)
	Endproc

	Procedure FontStrikethru_Assign(vNewVal)
		If Vartype(m.vNewVal) = T_NUMERIC Then
			If m.vNewVal = 0 Then
				m.vNewVal = FALSE
			Else
				m.vNewVal = TRUE
			Endif
		Endif
		If m.vNewVal = TRUE Then
			This.lfStrikeOut = 1
		Else
			This.lfStrikeOut = 0
		Endif
	Endproc

	Procedure FontUnderline_Access()
		Return Iif(This.lfUnderline <> 0, TRUE, FALSE)
	Endproc

	Procedure FontUnderline_Assign(vNewVal)
		If Vartype(m.vNewVal) = T_NUMERIC Then
			If m.vNewVal = 0 Then
				m.vNewVal = FALSE
			Else
				m.vNewVal = TRUE
			Endif
		Endif
		If m.vNewVal = TRUE Then
			This.lfUnderline = 1
		Else
			This.lfUnderline = 0
		Endif
	Endproc

	Procedure lfHeight_Access()
		Return ReadInt(This.Address)
	Endproc

	Procedure lfHeight_Assign(pnNewVal)
		WriteInt(This.Address, m.pnNewVal)
	Endproc

	Procedure lfWidth_Access()
		Return ReadInt(This.Address + 4)
	Endproc

	Procedure lfWidth_Assign(pnNewVal)
		WriteInt(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure lfEscapement_Access()
		Return ReadInt(This.Address + 8)
	Endproc

	Procedure lfEscapement_Assign(pnNewVal)
		WriteInt(This.Address + 8, m.pnNewVal)
	Endproc

	Procedure lfOrientation_Access()
		Return ReadInt(This.Address + 12)
	Endproc

	Procedure lfOrientation_Assign(pnNewVal)
		WriteInt(This.Address + 12, m.pnNewVal)
	Endproc

	Procedure lfWeight_Access()
		Return ReadInt(This.Address + 16)
	Endproc

	Procedure lfWeight_Assign(pnNewVal)
		WriteInt(This.Address + 16, m.pnNewVal)
	Endproc

	Procedure lfItalic_Access()
		Return This.ReadByte(This.Address + 20)
	Endproc

	Procedure lfItalic_Assign(pnNewVal)
		This.WriteByte(This.Address + 20, m.pnNewVal)
	Endproc

	Procedure lfUnderline_Access()
		Return This.ReadByte(This.Address + 21)
	Endproc

	Procedure lfUnderline_Assign(pnNewVal)
		This.WriteByte(This.Address + 21, m.pnNewVal)
	Endproc

	Procedure lfStrikeOut_Access()
		Return This.ReadByte(This.Address + 22)
	Endproc

	Procedure lfStrikeOut_Assign(pnNewVal)
		This.WriteByte(This.Address + 22, m.pnNewVal)
	Endproc

	Procedure lfCharSet_Access()
		Return This.ReadByte(This.Address + 23)
	Endproc

	Procedure lfCharSet_Assign(pnNewVal)
		This.WriteByte(This.Address + 23, m.pnNewVal)
	Endproc

	Procedure lfOutPrecision_Access()
		Return This.ReadByte(This.Address + 24)
	Endproc

	Procedure lfOutPrecision_Assign(pnNewVal)
		This.WriteByte(This.Address + 24, m.pnNewVal)
	Endproc

	Procedure lfClipPrecision_Access()
		Return This.ReadByte(This.Address + 25)
	Endproc

	Procedure lfClipPrecision_Assign(pnNewVal)
		This.WriteByte(This.Address + 25, m.pnNewVal)
	Endproc

	Procedure lfQuality_Access()
		Return This.ReadByte(This.Address + 26)
	Endproc

	Procedure lfQuality_Assign(pnNewVal)
		This.WriteByte(This.Address + 26, m.pnNewVal)
	Endproc

	Procedure lfPitchAndFamily_Access()
		Return This.ReadByte(This.Address + 27)
	Endproc

	Procedure lfPitchAndFamily_Assign(pnNewVal)
		This.WriteByte(This.Address + 27, m.pnNewVal)
	Endproc

	Procedure lfFaceName_Access()
		Return ReadCharArray(This.Address + 28, 32)
	Endproc

	Procedure lfFaceName_Assign(pnNewVal)
		WriteCharArray(This.Address + 28, m.pnNewVal, 32)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct {
*!*	        UINT cbSize;
*!*	        POINT pt;

*!*	        UINT uHit;   // out param
*!*	        SYSTEMTIME st;
*!*	#if (NTDDI_VERSION >= NTDDI_LONGHORN)
*!*	        RECT rc;
*!*	        int iOffset;
*!*	        int iRow;
*!*	        int iCol;
*!*	#endif
*!*	} MCHITTESTINFO, *PMCHITTESTINFO;
********************************************************************************
Define Class _MCHITTESTINFO As _STRUCTBASE

	SizeOf = 32
	Name = "MCHITTESTINFO"
	&& structure fields
	cbSize = FALSE
	pt = .Null.
	uHit = FALSE
	st = .Null.

	_MemberData = '<VFPData>' + ;
		'<memberdata name="cbsize" type="property" display="cbSize"/>' + ;
		'<memberdata name="pt" type="property" display="pt"/>' + ;
		'<memberdata name="uhit" type="property" display="uHit"/>' + ;
		'<memberdata name="st" type="property" display="st"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		This.cbSize = This.SizeOf
		This.pt = Createobject("_POINT", This.Address + 4)
		This.st = Createobject("_SYSTEMTIME", This.Address + 16)
	Endproc

	Procedure FreeMembers()
		This.pt = .Null.
		This.st = .Null.
	Endproc

	Procedure Address_Assign(lnAddress)
		This.Address = m.lnAddress
		If This.InitMembersDone = TRUE Then
			This.pt.Address = m.lnAddress + 4
			This.st.Address = m.lnAddress + 16
		Endif
	Endproc

	Procedure cbSize_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure cbSize_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure uHit_Access()
		Return ReadUInt(This.Address + 12)
	Endproc

	Procedure uHit_Assign(pnNewVal)
		WriteUInt(This.Address + 12, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagMEASUREITEMSTRUCT {
*!*	  UINT CtlType;
*!*	  UINT CtlID;
*!*	  UINT itemID;
*!*	  UINT itemWidth;
*!*   UINT itemHeight;
*!*   DWORD itemData
*!*	} MEASUREITEMSTRUCT;
********************************************************************************
Define Class _MEASUREITEMSTRUCT As _STRUCTBASE

	SizeOf = 24
	Name = "MEASUREITEMSTRUCT"
	&& structure fields
	CtlType = FALSE
	CtlID = FALSE
	ItemID = FALSE
	itemWidth = FALSE
	itemHeight = FALSE
	ItemData = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="ctltype" type="property" display="CtlType"/>' + ;
		'<memberdata name="ctlid" type="property" display="CtlID"/>' + ;
		'<memberdata name="itemid" type="property" display="itemID"/>' + ;
		'<memberdata name="itemwidth" type="property" display="itemWidth"/>' + ;
		'<memberdata name="itemheight" type="property" display="itemHeight"/>' + ;
		'<memberdata name="itemdata" type="property" display="itemData"/>' + ;
		'</VFPData>'

	Procedure CtlType_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure CtlType_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure CtlID_Access()
		Return ReadUInt(This.Address + 4)
	Endproc

	Procedure CtlID_Assign(pnNewVal)
		WriteUInt(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure itemID_Access()
		Return ReadUInt(This.Address + 8)
	Endproc

	Procedure itemID_Assign(pnNewVal)
		WriteUInt(This.Address + 8, m.pnNewVal)
	Endproc

	Procedure itemWidth_Access()
		Return ReadUInt(This.Address + 12)
	Endproc

	Procedure itemWidth_Assign(pnNewVal)
		WriteUInt(This.Address + 12, m.pnNewVal)
	Endproc

	Procedure itemHeight_Access()
		Return ReadUInt(This.Address + 16)
	Endproc

	Procedure itemHeight_Assign(pnNewVal)
		WriteUInt(This.Address + 16, m.pnNewVal)
	Endproc

	Procedure itemData_Access()
		Return ReadUInt(This.Address + 20)
	Endproc

	Procedure itemData_Assign(pnNewVal)
		WriteUInt(This.Address + 20, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagMENUINFO {
*!*	  DWORD   cbSize;
*!*	  DWORD   fMask;
*!*	  DWORD   dwStyle;
*!*	  UINT    cyMax;
*!*	  HBRUSH  hbrBack;
*!*	  DWORD   dwContextHelpID;
*!*	  ULONG_PTR  dwMenuData;
*!*	} MENUINFO, FAR *LPMENUINFO;
*!*	typedef MENUINFO CONST FAR *LPCMENUINFO;
********************************************************************************
Define Class _MENUINFO As _STRUCTBASE

	SizeOf = 28
	Name = "MENUINFO"
	*!* structure fields
	cbSize = FALSE
	fMask = FALSE
	dwStyle = FALSE
	cyMax = FALSE
	hbrBack = FALSE
	dwContextHelpID = FALSE
	dwMenuData = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="cbsize" type="property" display="cbSize"/>' + ;
		'<memberdata name="fmask" type="property" display="fMask"/>' + ;
		'<memberdata name="dwstyle" type="property" display="dwStyle"/>' + ;
		'<memberdata name="cymax" type="property" display="cyMax"/>' + ;
		'<memberdata name="hbrback" type="property" display="hbrBack"/>' + ;
		'<memberdata name="dwcontexthelpid" type="property" display="dwContextHelpID"/>' + ;
		'<memberdata name="dwmenudata" type="property" display="dwMenuData"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		*!* Important! init cbSize to size of structure
		This.cbSize = This.SizeOf
	Endproc

	Procedure cbSize_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure cbSize_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure fMask_Access()
		Return ReadUInt(This.Address + 4)
	Endproc

	Procedure fMask_Assign(pnNewVal)
		WriteUInt(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure dwStyle_Access()
		Return ReadUInt(This.Address + 8)
	Endproc

	Procedure dwStyle_Assign(pnNewVal)
		WriteUInt(This.Address + 8, m.pnNewVal)
	Endproc

	Procedure cyMax_Access()
		Return ReadUInt(This.Address + 12)
	Endproc

	Procedure cyMax_Assign(pnNewVal)
		WriteUInt(This.Address + 12, m.pnNewVal)
	Endproc

	Procedure hbrBack_Access()
		Return ReadPointer(This.Address + 16)
	Endproc

	Procedure hbrBack_Assign(pnNewVal)
		WritePointer(This.Address + 16, m.pnNewVal)
	Endproc

	Procedure dwContextHelpID_Access()
		Return ReadUInt(This.Address + 20)
	Endproc

	Procedure dwContextHelpID_Assign(pnNewVal)
		WriteUInt(This.Address + 20, m.pnNewVal)
	Endproc

	Procedure dwMenuData_Access()
		Return ReadUInt(This.Address + 24)
	Endproc

	Procedure dwMenuData_Assign(pnNewVal)
		WriteUInt(This.Address + 24, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagMENUITEMINFO {
*!*	  UINT    cbSize;
*!*	  UINT    fMask;
*!*	  UINT    fType;
*!*	  UINT    fState;
*!*	  UINT    wID;
*!*	  HMENU   hSubMenu;
*!*	  HBITMAP hbmpChecked;
*!*	  HBITMAP hbmpUnchecked;
*!*	  ULONG_PTR dwItemData;
*!*	  LPTSTR  dwTypeData;
*!*	  UINT    cch;
*!*	  HBITMAP hbmpItem;
*!*	} MENUITEMINFO, *LPMENUITEMINFO;
********************************************************************************
Define Class _MENUITEMINFO As _STRUCTBASE

	SizeOf = 48
	Name = "MENUITEMINFO"
	*!* structure fields
	cbSize = FALSE
	fMask = FALSE
	fType = FALSE
	fState = FALSE
	wID = FALSE
	hSubMenu = FALSE
	hbmpChecked = FALSE
	hbmpUnchecked = FALSE
	dwItemData = FALSE
	dwTypeData = FALSE
	cch = FALSE
	hbmpItem = FALSE

	Protected _MemberData
	_MemberData = '<VFPData>' + ;
		'<memberdata name="cbsize" type="property" display="cbSize"/>' + ;
		'<memberdata name="fmask" type="property" display="fMask"/>' + ;
		'<memberdata name="ftype" type="property" display="fType"/>' + ;
		'<memberdata name="fstate" type="property" display="fState"/>' + ;
		'<memberdata name="wid" type="property" display="wID"/>' + ;
		'<memberdata name="hsubmenu" type="property" display="hSubMenu"/>' + ;
		'<memberdata name="hbmpchecked" type="property" display="hbmpChecked"/>' + ;
		'<memberdata name="hbmpunchecked" type="property" display="hbmpUnchecked"/>' + ;
		'<memberdata name="dwitemdata" type="property" display="dwItemData"/>' + ;
		'<memberdata name="dwtypedata" type="property" display="dwTypeData"/>' + ;
		'<memberdata name="cch" type="property" display="cch"/>' + ;
		'<memberdata name="hbmpitem" type="property" display="hbmpItem"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		*!* Important! init cbSize to size of structure
		This.cbSize = This.SizeOf
	Endproc

	Procedure FreeMembers()
		FreePMem(This.Address + 36)
	Endproc

	Hidden Procedure cbSize_Access()
		Return ReadUInt(This.Address)
	Endproc

	Hidden Procedure cbSize_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Hidden Procedure fMask_Access()
		Return ReadUInt(This.Address + 4)
	Endproc

	Hidden Procedure fMask_Assign(pnNewVal)
		WriteUInt(This.Address + 4, m.pnNewVal)
	Endproc

	Hidden Procedure fType_Access()
		Return ReadUInt(This.Address + 8)
	Endproc

	Hidden Procedure fType_Assign(pnNewVal)
		WriteUInt(This.Address + 8, m.pnNewVal)
	Endproc

	Hidden Procedure fState_Access()
		Return ReadUInt(This.Address + 12)
	Endproc

	Hidden Procedure fState_Assign(pnNewVal)
		WriteUInt(This.Address + 12, m.pnNewVal)
	Endproc

	Hidden Procedure wID_Access()
		Return ReadUInt(This.Address + 16)
	Endproc

	Hidden Procedure wID_Assign(pnNewVal)
		WriteUInt(This.Address + 16, m.pnNewVal)
	Endproc

	Hidden Procedure hSubMenu_Access()
		Return ReadUInt(This.Address + 20)
	Endproc

	Hidden Procedure hSubMenu_Assign(pnNewVal)
		WriteUInt(This.Address + 20, m.pnNewVal)
	Endproc

	Hidden Procedure hbmpChecked_Access()
		Return ReadUInt(This.Address + 24)
	Endproc

	Hidden Procedure hbmpChecked_Assign(pnNewVal)
		WriteUInt(This.Address + 24, m.pnNewVal)
	Endproc

	Hidden Procedure hbmpUnchecked_Access()
		Return ReadUInt(This.Address + 28)
	Endproc

	Hidden Procedure hbmpUnchecked_Assign(pnNewVal)
		WriteUInt(This.Address + 28, m.pnNewVal)
	Endproc

	Hidden Procedure dwItemData_Access()
		Return ReadUInt(This.Address + 32)
	Endproc

	Hidden Procedure dwItemData_Assign(pnNewVal)
		WriteUInt(This.Address + 32, m.pnNewVal)
	Endproc

	Hidden Procedure dwTypeData_Access()
		Return ReadPCString(This.Address + 36)
	Endproc

	Hidden Procedure dwTypeData_Assign(pnNewVal)
		WritePCString(This.Address + 36, m.pnNewVal)
	Endproc

	Hidden Procedure cch_Access()
		Return ReadUInt(This.Address + 40)
	Endproc

	Hidden Procedure cch_Assign(pnNewVal)
		WriteUInt(This.Address + 40, m.pnNewVal)
	Endproc

	Hidden Procedure hbmpItem_Access()
		Return ReadUInt(This.Address + 44)
	Endproc

	Hidden Procedure hbmpItem_Assign(pnNewVal)
		WriteUInt(This.Address + 44, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagMONITORINFOEX {
*!*	  DWORD  cbSize;
*!*	  RECT   rcMonitor;
*!*	  RECT   rcWork;
*!*	  DWORD  dwFlags;
*!*	  TCHAR  szDevice[CCHDEVICENAME];
*!*	} MONITORINFOEX, *LPMONITORINFOEX;
********************************************************************************
Define Class _MONITORINFOEX As _STRUCTBASE

	SizeOf = 72
	Name = "MONITORINFOEX"
	&& structure fields
	cbSize = FALSE
	rcMonitor = .Null.
	rcWork = .Null.
	dwFlags = FALSE
	szDevice = FALSE

	Protected _MemberData
	_MemberData = '<VFPData>' + ;
		'<memberdata name="cbsize" type="property" display="cbSize"/>' + ;
		'<memberdata name="rcmonitor" type="property" display="rcMonitor"/>' + ;
		'<memberdata name="rcwork" type="property" display="rcWork"/>' + ;
		'<memberdata name="dwflags" type="property" display="dwFlags"/>' + ;
		'<memberdata name="szdevice" type="property" display="szDevice"/>' + ;
		'</VFPData>'

	Procedure InitMembers
		This.cbSize = This.SizeOf
		This.rcMonitor = Createobject("_RECT", This.Address + 4)
		This.rcWork = Createobject("_RECT", This.Address + 20)
	Endproc

	Procedure FreeMembers()
		This.rcMonitor = .Null.
		This.rcWork = .Null.
	Endproc

	Procedure Address_Assign(lnAddress)
		This.Address = m.lnAddress
		If This.InitMembersDone = TRUE Then
			This.rcMonitor.Address = m.lnAddress + 4
			This.rcWork.Address = m.lnAddress + 20
		Endif
	Endproc

	Procedure cbSize_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure cbSize_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure dwFlags_Access()
		Return ReadUInt(This.Address + 36)
	Endproc

	Procedure dwFlags_Assign(pnNewVal)
		WriteUInt(This.Address + 36, m.pnNewVal)
	Endproc

	Procedure szDevice_Access()
		Return ReadCharArray(This.Address + 40, 32)
	Endproc

	Procedure szDevice_Assign(pnNewVal)
		WriteCharArray(This.Address + 40, m.pnNewVal, 32)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagNMCUSTOMDRAWINFO {
*!*	    NMHDR hdr;
*!*	    DWORD dwDrawStage;
*!*	    HDC hdc;
*!*	    RECT rc;
*!*	    DWORD_PTR dwItemSpec;
*!*	    UINT uItemState;
*!*	    LPARAM lItemlParam;
*!*	} NMCUSTOMDRAW, *LPNMCUSTOMDRAW;
********************************************************************************
Define Class _NMCUSTOMDRAW As _STRUCTBASE

	SizeOf = 48
	Name = "NMCUSTOMDRAW"
	&& structure fields
	hdr = .Null.
	dwDrawStage = FALSE
	hDC = FALSE
	rc = .Null.
	dwItemSpec = FALSE
	uItemState = FALSE
	lItemlParam = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="hdr" type="property" display="hdr"/>' + ;
		'<memberdata name="dwdrawstage" type="property" display="dwDrawStage"/>' + ;
		'<memberdata name="hdc" type="property" display="hdc"/>' + ;
		'<memberdata name="rc" type="property" display="rc"/>' + ;
		'<memberdata name="dwitemspec" type="property" display="dwItemSpec"/>' + ;
		'<memberdata name="uitemstate" type="property" display="uItemState"/>' + ;
		'<memberdata name="litemlparam" type="property" display="lItemlParam"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		This.hdr = Createobject("_NMHDR", This.Address)
		This.rc = Createobject("_RECT", This.Address + 20)
	Endproc

	Procedure FreeMembers()
		This.hdr = .Null.
		This.rc = .Null.
	Endproc

	Procedure Address_Assign(lnAddress)
		This.Address = m.lnAddress
		If This.InitMembersDone = TRUE Then
			This.hdr.Address = m.lnAddress
			This.rc.Address = m.lnAddress + 20
		Endif
	Endproc

	Procedure dwDrawStage_Access()
		Return ReadUInt(This.Address + 12)
	Endproc

	Procedure dwDrawStage_Assign(pnNewVal)
		WriteUInt(This.Address + 12, m.pnNewVal)
	Endproc

	Procedure hDC_Access()
		Return ReadPointer(This.Address + 16)
	Endproc

	Procedure hDC_Assign(pnNewVal)
		WritePointer(This.Address + 16, m.pnNewVal)
	Endproc

	Procedure dwItemSpec_Access()
		Return ReadUInt(This.Address + 36)
	Endproc

	Procedure dwItemSpec_Assign(pnNewVal)
		WriteUInt(This.Address + 36, m.pnNewVal)
	Endproc

	Procedure uItemState_Access()
		Return ReadUInt(This.Address + 40)
	Endproc

	Procedure uItemState_Assign(pnNewVal)
		WriteUInt(This.Address + 40, m.pnNewVal)
	Endproc

	Procedure lItemlParam_Access()
		Return ReadInt(This.Address + 44)
	Endproc

	Procedure lItemlParam_Assign(pnNewVal)
		WriteInt(This.Address + 44, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct _RECT {
*!*	  LONG Left;
*!*	  LONG Top;
*!*	  LONG Right;
*!*	  LONG Bottom;
*!*	} RECT, *PRECT;
********************************************************************************
Define Class _RECT As _STRUCTBASE

	SizeOf = 16
	Name = "RECT"
	*!*  structure fields
	Left = FALSE
	Top = FALSE
	Right = FALSE
	Bottom = FALSE
	&& Extra properties
	Height = FALSE
	Width = FALSE

	Protected _MemberData
	_MemberData = '<VFPData>' + ;
		'<memberdata name="left" type="property" display="Left"/>' + ;
		'<memberdata name="top" type="property" display="Top"/>' + ;
		'<memberdata name="right" type="property" display="Right"/>' + ;
		'<memberdata name="bottom" type="property" display="Bottom"/>' + ;
		'<memberdata name="height" type="property" display="Height"/>' + ;
		'<memberdata name="width" type="property" display="Width"/>' + ;
		'</VFPData>'

	Hidden Procedure Left_Access()
		Return ReadInt(This.Address)
	Endproc

	Hidden Procedure Left_Assign(pnNewVal)
		WriteInt(This.Address, m.pnNewVal)
	Endproc

	Hidden Procedure Top_Access()
		Return ReadInt(This.Address + 4)
	Endproc

	Hidden Procedure Top_Assign(pnNewVal)
		WriteInt(This.Address + 4, m.pnNewVal)
	Endproc

	Hidden Procedure Right_Access()
		Return ReadInt(This.Address + 8)
	Endproc

	Hidden Procedure Right_Assign(pnNewVal)
		WriteInt(This.Address + 8, m.pnNewVal)
	Endproc

	Hidden Procedure Bottom_Access()
		Return ReadInt(This.Address + 12)
	Endproc

	Hidden Procedure Bottom_Assign(pnNewVal)
		WriteInt(This.Address + 12, m.pnNewVal)
	Endproc

	Hidden Procedure Height_Access()
		Return This.Bottom - This.Top
	Endproc

	Hidden Procedure Height_Assign(pnNewVal)
		This.Height = m.pnNewVal
		This.Bottom = This.Top + m.pnNewVal
	Endproc

	Hidden Procedure Width_Access()
		Return This.Right - This.Left
	Endproc

	Hidden Procedure Width_Assign(pnNewVal)
		This.Width = m.pnNewVal
		This.Right = This.Left + m.pnNewVal
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagPOINT {
*!*	  LONG x;
*!*	  LONG y;
*!*	} POINT, *PPOINT;
********************************************************************************
Define Class _POINT As _STRUCTBASE

	SizeOf = 8
	Name = "POINT"
	&& structure fields
	x = FALSE
	Y = FALSE

	Protected _MemberData
	_MemberData = '<VFPData>' + ;
		'<memberdata name="x" type="property" display="X"/>' + ;
		'<memberdata name="y" type="property" display="Y"/>' + ;
		'</VFPData>'

	Procedure x_Access()
		Return ReadInt(This.Address)
	Endproc

	Procedure x_Assign(pnNewVal)
		WriteInt(This.Address, m.pnNewVal)
	Endproc

	Procedure y_Access()
		Return ReadInt(This.Address + 4)
	Endproc

	Procedure y_Assign(pnNewVal)
		WriteInt(This.Address + 4, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct _WINDOWPLACEMENT {
*!*	  UINT length;
*!*	  UINT flags;
*!*	  UINT showCmd;
*!*	  POINT ptMinPosition;
*!*	  POINT ptMaxPosition;
*!*	  RECT rcNormalPosition;
*!*	} WINDOWPLACEMENT;
********************************************************************************
Define Class _WINDOWPLACEMENT As _STRUCTBASE

	SizeOf = 44
	Name = "WINDOWPLACEMENT"
	&& structure fields
	Length = FALSE
	Flags = FALSE
	ShowCmd = FALSE
	ptMinPosition = .Null.
	ptMaxPosition = .Null.
	rcNormalPosition = .Null.

	Protected _MemberData
	_MemberData = '<VFPData>' + ;
		'<memberdata name="length" type="property" display="length"/>' + ;
		'<memberdata name="flags" type="property" display="flags"/>' + ;
		'<memberdata name="showcmd" type="property" display="showCmd"/>' + ;
		'<memberdata name="ptminposition" type="property" display="ptMinPosition"/>' + ;
		'<memberdata name="ptmaxposition" type="property" display="ptMaxPosition"/>' + ;
		'<memberdata name="rcnormalposition" type="property" display="rcNormalPosition"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		This.Length = This.SizeOf
		This.ptMinPosition = Createobject("_POINT", This.Address + 12)
		This.ptMaxPosition = Createobject("_POINT", This.Address + 20)
		This.rcNormalPosition = Createobject("_RECT", This.Address + 28)
	Endproc

	Procedure FreeMembers()
		This.ptMinPosition = .Null.
		This.ptMaxPosition = .Null.
		This.rcNormalPosition = .Null.
	Endproc

	Procedure Address_Assign(lnAddress)
		This.Address = m.lnAddress
		If This.InitMembersDone = TRUE Then
			This.ptMinPosition.Address = m.lnAddress + 12
			This.ptMaxPosition.Address = m.lnAddress + 20
			This.rcNormalPosition.Address = m.lnAddress + 28
		Endif
	Endproc

	Procedure length_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure length_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure flags_Access()
		Return ReadUInt(This.Address + 4)
	Endproc

	Procedure flags_Assign(pnNewVal)
		WriteUInt(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure showCmd_Access()
		Return ReadUInt(This.Address + 8)
	Endproc

	Procedure showCmd_Assign(pnNewVal)
		WriteUInt(This.Address + 8, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagSCROLLINFO {
*!*	    UINT cbSize;
*!*	    UINT fMask;
*!*	    int  nMin;
*!*	    int  nMax;
*!*	    UINT nPage;
*!*	    int  nPos;
*!*	    int  nTrackPos;
*!*	}   SCROLLINFO, *LPSCROLLINFO;
*!*	typedef SCROLLINFO CONST *LPCSCROLLINFO;
********************************************************************************
Define Class _SCROLLINFO As _STRUCTBASE

	SizeOf = 28
	Name = "SCROLLINFO"
	&& structure fields
	cbSize = FALSE
	fMask = FALSE
	nMin = FALSE
	nMax = FALSE
	nPage = FALSE
	nPos = FALSE
	nTrackPos = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="cbsize" type="property" display="cbSize"/>' + ;
		'<memberdata name="fmask" type="property" display="fMask"/>' + ;
		'<memberdata name="nmin" type="property" display="nMin"/>' + ;
		'<memberdata name="nmax" type="property" display="nMax"/>' + ;
		'<memberdata name="npage" type="property" display="nPage"/>' + ;
		'<memberdata name="npos" type="property" display="nPos"/>' + ;
		'<memberdata name="ntrackpos" type="property" display="nTrackPos"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		*!* Important! init cbSize to size of structure
		This.cbSize = This.SizeOf
	Endproc

	Procedure cbSize_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure cbSize_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure fMask_Access()
		Return ReadUInt(This.Address + 4)
	Endproc

	Procedure fMask_Assign(pnNewVal)
		WriteUInt(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure nMin_Access()
		Return ReadInt(This.Address + 8)
	Endproc

	Procedure nMin_Assign(pnNewVal)
		WriteInt(This.Address + 8, m.pnNewVal)
	Endproc

	Procedure nMax_Access()
		Return ReadInt(This.Address + 12)
	Endproc

	Procedure nMax_Assign(pnNewVal)
		WriteInt(This.Address + 12, m.pnNewVal)
	Endproc

	Procedure nPage_Access()
		Return ReadUInt(This.Address + 16)
	Endproc

	Procedure nPage_Assign(pnNewVal)
		WriteUInt(This.Address + 16, m.pnNewVal)
	Endproc

	Procedure nPos_Access()
		Return ReadInt(This.Address + 20)
	Endproc

	Procedure nPos_Assign(pnNewVal)
		WriteInt(This.Address + 20, m.pnNewVal)
	Endproc

	Procedure nTrackPos_Access()
		Return ReadInt(This.Address + 24)
	Endproc

	Procedure nTrackPos_Assign(pnNewVal)
		WriteInt(This.Address + 24, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagNMHDR {
*!*	  HWND hwndFrom;
*!*	  UINT_PTR idFrom;
*!*	  UINT code;
*!*	} NMHDR;
********************************************************************************
Define Class _NMHDR As _STRUCTBASE

	SizeOf = 12
	Name = "NMHDR"
	&& structure fields
	hwndFrom = FALSE
	idFrom = FALSE
	Code = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="hwndfrom" type="property" display="hwndFrom"/>' + ;
		'<memberdata name="idfrom" type="property" display="idFrom"/>' + ;
		'<memberdata name="code" type="property" display="Code"/>' + ;
		'</VFPData>'

	Procedure hwndFrom_Access()
		Return ReadInt(This.Address)
	Endproc

	Procedure hwndFrom_Assign(pnNewVal)
		WriteInt(This.Address, m.pnNewVal)
	Endproc

	Procedure idFrom_Access()
		Return ReadUInt(This.Address + 4)
	Endproc

	Procedure idFrom_Assign(pnNewVal)
		WriteUInt(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure Code_Access()
		*!* Code is a UINT but it should be an INT
		Return ReadInt(This.Address + 8)
	Endproc

	Procedure Code_Assign(pnNewVal)
		WriteInt(This.Address + 8, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagNMMOUSE {
*!*	    NMHDR hdr;
*!*	    DWORD_PTR dwItemSpec;
*!*	    DWORD_PTR dwItemData;
*!*	    POINT pt;
*!*	    LPARAM dwHitInfo;
*!*	} NMMOUSE, *LPNMMOUSE;
********************************************************************************
Define Class _NMMOUSE As _STRUCTBASE

	SizeOf = 32
	Name = "NMMOUSE"
	&& structure fields
	hdr = .Null.
	dwItemSpec = FALSE
	dwItemData = FALSE
	pt = .Null.
	dwHitInfo = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="hdr" type="property" display="hdr"/>' + ;
		'<memberdata name="dwitemspec" type="property" display="dwItemSpec"/>' + ;
		'<memberdata name="dwitemdata" type="property" display="dwItemData"/>' + ;
		'<memberdata name="pt" type="property" display="pt"/>' + ;
		'<memberdata name="dwhitinfo" type="property" display="dwHitInfo"/>' + ;
		'</VFPData>'

	Procedure InitMembers
		This.hdr = Createobject("_NMHDR",This.Address + 0)
		This.pt = Createobject("_POINT",This.Address + 20)
	Endproc

	Procedure FreeMembers()
		This.hdr = .Null.
		This.pt = .Null.
	Endproc

	Procedure Address_Assign(lnAddress)
		This.Address = m.lnAddress
		If This.InitMembersDone = TRUE Then
			This.hdr.Address = m.lnAddress + 0
			This.pt.Address = m.lnAddress + 20
		Endif
	Endproc

	Procedure dwItemSpec_Access()
		Return ReadUInt(This.Address + 12)
	Endproc

	Procedure dwItemSpec_Assign(pnNewVal)
		WriteUInt(This.Address + 12, m.pnNewVal)
	Endproc

	Procedure dwItemData_Access()
		Return ReadUInt(This.Address + 16)
	Endproc

	Procedure dwItemData_Assign(pnNewVal)
		WriteUInt(This.Address + 16, m.pnNewVal)
	Endproc

	Procedure dwHitInfo_Access()
		Return ReadInt(This.Address + 28)
	Endproc

	Procedure dwHitInfo_Assign(pnNewVal)
		WriteInt(This.Address + 28, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct {
*!*	  DWORD dwStructSize;
*!*	  LPTSTR lpszScheme;
*!*	  DWORD dwSchemeLength;
*!*	  INTERNET_SCHEME nScheme;
*!*	  LPTSTR lpszHostName;
*!*	  DWORD dwHostNameLength;
*!*	  INTERNET_PORT nPort;
*!*	  LPTSTR lpszUserName;
*!*	  DWORD dwUserNameLength;
*!*	  LPTSTR lpszPassword;
*!*	  DWORD dwPasswordLength;
*!*	  LPTSTR lpszUrlPath;
*!*	  DWORD dwUrlPathLength;
*!*	  LPTSTR lpszExtraInfo;
*!*	  DWORD dwExtraInfoLength;
*!*	} URL_COMPONENTS,
*!*	*LPURL_COMPONENTS;
********************************************************************************
Define Class _URL_COMPONENTS As _STRUCTBASE

	SizeOf = 60
	Name = "URL_COMPONENTS"
	&& structure fields
	dwStructSize = FALSE
	lpszScheme = FALSE
	dwSchemeLength = FALSE
	nScheme = FALSE
	lpszHostName = FALSE
	dwHostNameLength = FALSE
	nPort = FALSE
	lpszUserName = FALSE
	dwUserNameLength = FALSE
	lpszPassword = FALSE
	dwPasswordLength = FALSE
	lpszUrlPath = FALSE
	dwUrlPathLength = FALSE
	lpszExtraInfo = FALSE
	dwExtraInfoLength = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="dwstructsize" type="property" display="dwStructSize"/>' + ;
		'<memberdata name="lpszscheme" type="property" display="lpszScheme"/>' + ;
		'<memberdata name="dwschemelength" type="property" display="dwSchemeLength"/>' + ;
		'<memberdata name="nscheme" type="property" display="nScheme"/>' + ;
		'<memberdata name="lpszhostname" type="property" display="lpszHostName"/>' + ;
		'<memberdata name="dwhostnamelength" type="property" display="dwHostNameLength"/>' + ;
		'<memberdata name="nport" type="property" display="nPort"/>' + ;
		'<memberdata name="lpszusername" type="property" display="lpszUserName"/>' + ;
		'<memberdata name="dwusernamelength" type="property" display="dwUserNameLength"/>' + ;
		'<memberdata name="lpszpassword" type="property" display="lpszPassword"/>' + ;
		'<memberdata name="dwpasswordlength" type="property" display="dwPasswordLength"/>' + ;
		'<memberdata name="lpszurlpath" type="property" display="lpszUrlPath"/>' + ;
		'<memberdata name="dwurlpathlength" type="property" display="dwUrlPathLength"/>' + ;
		'<memberdata name="lpszextrainfo" type="property" display="lpszExtraInfo"/>' + ;
		'<memberdata name="dwextrainfolength" type="property" display="dwExtraInfoLength"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		This.dwStructSize = 60
	Endproc

	Procedure FreeMembers()
		FreePMem(This.Address + 4)
		FreePMem(This.Address + 16)
		FreePMem(This.Address + 28)
		FreePMem(This.Address + 36)
		FreePMem(This.Address + 44)
		FreePMem(This.Address + 52)
	Endproc

	Procedure dwStructSize_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure dwStructSize_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure lpszScheme_Access()
		Return ReadPCString(This.Address + 4)
	Endproc

	Procedure lpszScheme_Assign(pnNewVal)
		WritePCString(This.Address + 4, m.pnNewVal)
		This.dwSchemeLength = Len(pnNewVal)
	Endproc

	Procedure dwSchemeLength_Access()
		Return ReadUInt(This.Address + 8)
	Endproc

	Procedure dwSchemeLength_Assign(pnNewVal)
		WriteUInt(This.Address + 8, m.pnNewVal)
	Endproc

	Procedure nScheme_Access()
		Return ReadUInt(This.Address + 12)
	Endproc

	Procedure nScheme_Assign(pnNewVal)
		WriteUInt(This.Address + 12, m.pnNewVal)
	Endproc

	Procedure lpszHostName_Access()
		Return ReadPCString(This.Address + 16)
	Endproc

	Procedure lpszHostName_Assign(pnNewVal)
		WritePCString(This.Address + 16, m.pnNewVal)
		This.dwHostNameLength = Len(pnNewVal)
	Endproc

	Procedure dwHostNameLength_Access()
		Return ReadUInt(This.Address + 20)
	Endproc

	Procedure dwHostNameLength_Assign(pnNewVal)
		WriteUInt(This.Address + 20, m.pnNewVal)
	Endproc

	Procedure nPort_Access()
		Return ReadUInt(This.Address + 24)
	Endproc

	Procedure nPort_Assign(pnNewVal)
		WriteUInt(This.Address + 24, m.pnNewVal)
	Endproc

	Procedure lpszUserName_Access()
		Return ReadPCString(This.Address + 28)
	Endproc

	Procedure lpszUserName_Assign(pnNewVal)
		WritePCString(This.Address + 28, m.pnNewVal)
		This.dwUserNameLength = Len(pnNewVal)
	Endproc

	Procedure dwUserNameLength_Access()
		Return ReadUInt(This.Address + 32)
	Endproc

	Procedure dwUserNameLength_Assign(pnNewVal)
		WriteUInt(This.Address + 32, m.pnNewVal)
	Endproc

	Procedure lpszPassword_Access()
		Return ReadPCString(This.Address + 36)
	Endproc

	Procedure lpszPassword_Assign(pnNewVal)
		WritePCString(This.Address + 36, m.pnNewVal)
		This.dwPasswordLength = Len(pnNewVal)
	Endproc

	Procedure dwPasswordLength_Access()
		Return ReadUInt(This.Address + 40)
	Endproc

	Procedure dwPasswordLength_Assign(pnNewVal)
		WriteUInt(This.Address + 40, m.pnNewVal)
	Endproc

	Procedure lpszUrlPath_Access()
		Return ReadPCString(This.Address + 44)
	Endproc

	Procedure lpszUrlPath_Assign(pnNewVal)
		WritePCString(This.Address + 44, m.pnNewVal)
		This.dwUrlPathLength = Len(pnNewVal)
	Endproc

	Procedure dwUrlPathLength_Access()
		Return ReadUInt(This.Address + 48)
	Endproc

	Procedure dwUrlPathLength_Assign(pnNewVal)
		WriteUInt(This.Address + 48, m.pnNewVal)
	Endproc

	Procedure lpszExtraInfo_Access()
		Return ReadPCString(This.Address + 52)
	Endproc

	Procedure lpszExtraInfo_Assign(pnNewVal)
		WritePCString(This.Address + 52, m.pnNewVal)
		This.dwExtraInfoLength = Len(pnNewVal)
	Endproc

	Procedure dwExtraInfoLength_Access()
		Return ReadUInt(This.Address + 56)
	Endproc

	Procedure dwExtraInfoLength_Assign(pnNewVal)
		WriteUInt(This.Address + 56, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct _WIN32_FIND_DATA {
*!*	  DWORD dwFileAttributes;
*!*	  FILETIME ftCreationTime;
*!*	  FILETIME ftLastAccessTime;
*!*	  FILETIME ftLastWriteTime;
*!*	  DWORD nFileSizeHigh;
*!*	  DWORD nFileSizeLow;
*!*	  DWORD dwReserved0;
*!*	  DWORD dwReserved1;
*!*	  TCHAR cFileName[MAX_PATH];
*!*	  TCHAR cAlternateFileName[14];
*!*	} WIN32_FIND_DATA,
*!*	  *PWIN32_FIND_DATA,
*!*	  *LPWIN32_FIND_DATA;
********************************************************************************
Define Class _WIN32_FIND_DATA As _STRUCTBASE

	SizeOf = 320
	Name = "WIN32_FIND_DATA"
	&& structure fields
	dwFileAttributes = FALSE
	ftCreationTime = .Null.
	ftLastAccessTime = .Null.
	ftLastWriteTime = .Null.
	nFileSizeHigh = FALSE
	nFileSizeLow = FALSE
	dwReserved0 = FALSE
	dwReserved1 = FALSE
	cFileName = FALSE
	cAlternateFileName = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="dwfileattributes" type="property" display="dwFileAttributes"/>' + ;
		'<memberdata name="ftcreationtime" type="property" display="ftCreationTime"/>' + ;
		'<memberdata name="ftlastaccesstime" type="property" display="ftLastAccessTime"/>' + ;
		'<memberdata name="ftlastwritetime" type="property" display="ftLastWriteTime"/>' + ;
		'<memberdata name="nfilesizehigh" type="property" display="nFileSizeHigh"/>' + ;
		'<memberdata name="nfilesizelow" type="property" display="nFileSizeLow"/>' + ;
		'<memberdata name="dwreserved0" type="property" display="dwReserved0"/>' + ;
		'<memberdata name="dwreserved1" type="property" display="dwReserved1"/>' + ;
		'<memberdata name="cfilename" type="property" display="cFileName"/>' + ;
		'<memberdata name="calternatefilename" type="property" display="cAlternateFileName"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		This.ftCreationTime   = Createobject("_FILETIME", This.Address +  4)
		This.ftLastAccessTime = Createobject("_FILETIME", This.Address + 12)
		This.ftLastWriteTime  = Createobject("_FILETIME", This.Address + 20)
	Endproc

	Procedure FreeMembers()
		This.ftCreationTime   = .Null.
		This.ftLastAccessTime = .Null.
		This.ftLastWriteTime  = .Null.
	Endproc

	Procedure Address_Assign(lnAddress)
		This.Address = m.lnAddress
		If This.InitMembersDone = TRUE Then
			This.ftCreationTime.Address   = m.lnAddress + 4
			This.ftLastAccessTime.Address = m.lnAddress + 12
			This.ftLastWriteTime.Address  = m.lnAddress + 20
		Endif
	Endproc

	Procedure dwFileAttributes_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure dwFileAttributes_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure nFileSizeHigh_Access()
		Return ReadUInt(This.Address + 28)
	Endproc

	Procedure nFileSizeHigh_Assign(pnNewVal)
		WriteUInt(This.Address + 28, m.pnNewVal)
	Endproc

	Procedure nFileSizeLow_Access()
		Return ReadUInt(This.Address + 32)
	Endproc

	Procedure nFileSizeLow_Assign(pnNewVal)
		WriteUInt(This.Address + 32, m.pnNewVal)
	Endproc

	Procedure dwReserved0_Access()
		Return ReadUInt(This.Address + 36)
	Endproc

	Procedure dwReserved0_Assign(pnNewVal)
		WriteUInt(This.Address + 36, m.pnNewVal)
	Endproc

	Procedure dwReserved1_Access()
		Return ReadUInt(This.Address + 40)
	Endproc

	Procedure dwReserved1_Assign(pnNewVal)
		WriteUInt(This.Address + 40, m.pnNewVal)
	Endproc

	Procedure cFileName_Access()
		Return ReadCharArray(This.Address + 44, MAX_PATH)
	Endproc

	Procedure cFileName_Assign(pnNewVal)
		WriteCharArray(This.Address + 44, Padr(m.pnNewVal, MAX_PATH, NULCHAR), MAX_PATH)
	Endproc

	Procedure cAlternateFileName_Access()
		Return ReadCharArray(This.Address + 44 + MAX_PATH, 14)
	Endproc

	Procedure cAlternateFileName_Assign(pnNewVal)
		WriteCharArray(This.Address + 44 + MAX_PATH, Padr(m.pnNewVal, 14, NULCHAR), 14)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct _SYSTEMTIME {
*!*	  WORD wYear;
*!*	  WORD wMonth;
*!*	  WORD wDayOfWeek;
*!*	  WORD wDay;
*!*	  WORD wHour;
*!*	  WORD wMinute;
*!*	  WORD wSecond;
*!*	  WORD wMilliseconds;
*!*	} SYSTEMTIME,  *PSYSTEMTIME;
********************************************************************************
Define Class _SYSTEMTIME As _STRUCTBASE

	SizeOf = 16
	Name = "SYSTEMTIME"
	&& structure fields
	wYear = FALSE
	wMonth = FALSE
	wDayOfWeek = FALSE
	wDay = FALSE
	wHour = FALSE
	wMinute = FALSE
	wSecond = FALSE
	wMilliseconds = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="wyear" type="property" display="wYear"/>' + ;
		'<memberdata name="wmonth" type="property" display="wMonth"/>' + ;
		'<memberdata name="wdayofweek" type="property" display="wDayOfWeek"/>' + ;
		'<memberdata name="wday" type="property" display="wDay"/>' + ;
		'<memberdata name="whour" type="property" display="wHour"/>' + ;
		'<memberdata name="wminute" type="property" display="wMinute"/>' + ;
		'<memberdata name="wsecond" type="property" display="wSecond"/>' + ;
		'<memberdata name="wmilliseconds" type="property" display="wMilliseconds"/>' + ;
		'</VFPData>'

	Procedure wYear_Access()
		Return ReadUShort(This.Address)
	Endproc

	Procedure wYear_Assign(pnNewVal)
		WriteUShort(This.Address, m.pnNewVal)
	Endproc

	Procedure wMonth_Access()
		Return ReadUShort(This.Address + 2)
	Endproc

	Procedure wMonth_Assign(pnNewVal)
		WriteUShort(This.Address + 2, m.pnNewVal)
	Endproc

	Procedure wDayOfWeek_Access()
		Return ReadUShort(This.Address + 4)
	Endproc

	Procedure wDayOfWeek_Assign(pnNewVal)
		WriteUShort(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure wDay_Access()
		Return ReadUShort(This.Address + 6)
	Endproc

	Procedure wDay_Assign(pnNewVal)
		WriteUShort(This.Address + 6, m.pnNewVal)
	Endproc

	Procedure wHour_Access()
		Return ReadUShort(This.Address + 8)
	Endproc

	Procedure wHour_Assign(pnNewVal)
		WriteUShort(This.Address + 8, m.pnNewVal)
	Endproc

	Procedure wMinute_Access()
		Return ReadUShort(This.Address + 10)
	Endproc

	Procedure wMinute_Assign(pnNewVal)
		WriteUShort(This.Address + 10, m.pnNewVal)
	Endproc

	Procedure wSecond_Access()
		Return ReadUShort(This.Address + 12)
	Endproc

	Procedure wSecond_Assign(pnNewVal)
		WriteUShort(This.Address + 12, m.pnNewVal)
	Endproc

	Procedure wMilliseconds_Access()
		Return ReadUShort(This.Address + 14)
	Endproc

	Procedure wMilliseconds_Assign(pnNewVal)
		WriteUShort(This.Address + 14, m.pnNewVal)
	Endproc

Enddefine


********************************************************************************
Define Class _SYSTEMTIMEARRAY As _STRUCTBASE

	SizeOf = 32
	Name = "SYSTEMTIMEARRAY"
	&& structure fields
	Min = .Null.
	Max = .Null.

	_MemberData = '<VFPData>' + ;
		'<memberdata name="min" type="property" display="Min"/>' + ;
		'<memberdata name="max" type="property" display="Max"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		This.Min = Createobject('_SYSTEMTIME',This.Address)
		This.Max = Createobject('_SYSTEMTIME',This.Address + 16)
	Endproc

	Procedure FreeMembers()
		This.Min = .Null.
		This.Max = .Null.
	Endproc

	Procedure Address_Assign(lnAddress)
		This.Address = m.lnAddress
		If This.InitMembersDone = TRUE Then
			This.Min.Address = m.lnAddress
			This.Max.Address = m.lnAddress + 16
		Endif
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagSIZE {
*!*	  LONG cx;
*!*	  LONG cy;
*!*	} SIZE, *PSIZE;
********************************************************************************
Define Class _SIZE As _STRUCTBASE
	SizeOf = 8
	Name = "SIZE"
	&& structure fields
	cx = FALSE
	cy = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="cx" type="property" display="cx"/>' + ;
		'<memberdata name="cy" type="property" display="cy"/>' + ;
		'</VFPData>'

	Procedure cx_Access()
		Return ReadInt(This.Address)
	Endproc

	Procedure cx_Assign(pnNewVal)
		WriteInt(This.Address, m.pnNewVal)
	Endproc

	Procedure cy_Access()
		Return ReadInt(This.Address + 4)
	Endproc

	Procedure cy_Assign(pnNewVal)
		WriteInt(This.Address + 4, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagTOOLINFO{
*!*	    UINT      cbSize;
*!*	    UINT      uFlags;
*!*	    HWND      hwnd;
*!*	    UINT_PTR  uId;
*!*	    RECT      rect;
*!*	    HINSTANCE hinst;
*!*	    LPTSTR    lpszText;
*!*	#if (_WIN32_IE >= 0x0300)
*!*	    LPARAM lParam;
*!*	#endif
*!*	#if (_WIN32_WINNT >= 0x0501)
*!*	    void *lpReserved;
*!*	#endif
*!*	} TOOLINFO, NEAR *PTOOLINFO, *LPTOOLINFO;
********************************************************************************
Define Class _TOOLINFO As _STRUCTBASE
	SizeOf = 48
	Name = "TOOLINFO"
	&& structure fields
	cbSize = FALSE
	uFlags = FALSE
	HWnd = FALSE
	uId = FALSE
	Rect = .Null.
	hinst = FALSE
	lpszText = FALSE
	Lparam = FALSE
	*!* if ctlGetOsVersion >= 5010000
	lpReserved = FALSE
	*!* Endif

	_MemberData = '<VFPData>' + ;
		'<memberdata name="cbsize" type="property" display="cbSize"/>' + ;
		'<memberdata name="uflags" type="property" display="uFlags"/>' + ;
		'<memberdata name="hwnd" type="property" display="hwnd"/>' + ;
		'<memberdata name="uid" type="property" display="uId"/>' + ;
		'<memberdata name="rect" type="property" display="rect"/>' + ;
		'<memberdata name="hinst" type="property" display="hinst"/>' + ;
		'<memberdata name="lpsztext" type="property" display="lpszText"/>' + ;
		'<memberdata name="lparam" type="property" display="lParam"/>' + ;
		'<memberdata name="*lpreserved" type="property" display="*lpReserved"/>' + ;
		'</VFPData>'

	Procedure InitMembers()

		*!* 20080818
		*!*			If ctlGetOsVersion() < NTDDI_WINXP Then
		*!*				This.SizeOf = 44
		*!*			Else
		*!*				This.SizeOf = 48
		*!*			Endif
		*!*			This.cbSize = This.SizeOf

		If ctlGetOsVersion() < NTDDI_WINXP Then
			This.cbSize = 44
		Else
			This.cbSize = 48
		Endif

		This.Rect = Createobject("_RECT", This.Address + 16)
	Endproc

	Procedure FreeMembers()
		This.Rect = .Null.
		FreePMem(This.Address + 36)
	Endproc

	Procedure Address_Assign(lnAddress)
		This.Address = m.lnAddress
		If This.InitMembersDone = TRUE Then
			This.Rect.Address = m.lnAddress + 16
		Endif
	Endproc

	Procedure cbSize_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure cbSize_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure uFlags_Access()
		Return ReadUInt(This.Address + 4)
	Endproc

	Procedure uFlags_Assign(pnNewVal)
		WriteUInt(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure hwnd_Access()
		Return ReadInt(This.Address + 8)
	Endproc

	Procedure hwnd_Assign(pnNewVal)
		WriteInt(This.Address + 8, m.pnNewVal)
	Endproc

	Procedure uId_Access()
		Return ReadUInt(This.Address + 12)
	Endproc

	Procedure uId_Assign(pnNewVal)
		WriteUInt(This.Address + 12, m.pnNewVal)
	Endproc

	Procedure hinst_Access()
		Return ReadPointer(This.Address + 32)
	Endproc

	Procedure hinst_Assign(pnNewVal)
		WritePointer(This.Address + 32, m.pnNewVal)
	Endproc

	Procedure lpszText_Access()
		Return ReadPCString(This.Address + 36)
	Endproc

	Procedure lpszText_Assign(pnNewVal)
		WritePCString(This.Address + 36, m.pnNewVal)
	Endproc

	Procedure lParam_Access()
		Return ReadInt(This.Address + 40)
	Endproc

	Procedure lParam_Assign(pnNewVal)
		WriteInt(This.Address + 40, m.pnNewVal)
	Endproc

	Procedure lpReserved_Access()
		Return ReadPointer(This.Address  +  44)
	Endproc

	Procedure lpReserved_Assign(pnNewVal)
		WritePointer(This.Address + 44, m.pnNewVal)
Enddefine


********************************************************************************
*!*	typedef struct tagNMSELCHANGE {
*!*	    NMHDR nmhdr;
*!*	    SYSTEMTIME stSelStart;
*!*	    SYSTEMTIME stSelEnd;
*!*	} NMSELCHANGE, *LPNMSELCHANGE;
********************************************************************************
Define Class _NMSELCHANGE As _STRUCTBASE

	SizeOf = 44
	Name = "NMSELCHANGE"
	&& structure fields
	nmhdr = .Null.
	stSelStart = .Null.
	stSelEnd = .Null.

	_MemberData = '<VFPData>' + ;
		'<memberdata name="nmhdr" type="property" display="nmhdr"/>' + ;
		'<memberdata name="stselstart" type="property" display="stSelStart"/>' + ;
		'<memberdata name="stselend" type="property" display="stSelEnd"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		This.nmhdr = Createobject("_NMHDR", This.Address)
		This.stSelStart = Createobject("_SYSTEMTIME", This.Address + 12)
		This.stSelEnd = Createobject("_SYSTEMTIME", This.Address + 28)
	Endproc

	Procedure FreeMembers()
		This.nmhdr = .Null.
		This.stSelStart = .Null.
		This.stSelEnd = .Null.
	Endproc

	Procedure Address_Assign(lnAddress)
		This.Address = m.lnAddress
		If This.InitMembersDone = TRUE Then
			This.Address = m.lnAddress
			This.nmhdr.Address = m.lnAddress
			This.stSelStart.Address = m.lnAddress + 12
			This.stSelEnd.Address = m.lnAddress + 28
		Endif
	Endproc

Enddefine


********************************************************************************
*!*	typedef struct tagNMTTDISPINFO {
*!*	    NMHDR      hdr;
*!*	    LPTSTR     lpszText;
*!*	    TCHAR       szText[80];
*!*	    HINSTANCE  hinst;
*!*	    UINT       uFlags;
*!*	#if (_WIN32_IE >= 0x0300)
*!*	    LPARAM     lParam;
*!*	#endif
*!*	#if (_WIN32_WINNT >= 0x0600)
*!*	    HBITMAP hbmp;
*!*	#endif
*!*	} NMTTDISPINFO, *LPNMTTDISPINFO;
********************************************************************************

Define Class _NMTTDISPINFO As _STRUCTBASE

	SizeOf = 108
	Name = "NMTTDISPINFO"
	&& structure fields
	hdr = .Null.
	lpszText = .F.
	szText = .F.
	hinst = .F.
	uFlags = .F.
	Lparam = .F.

	Procedure InitMembers(lnAddress)
		This.hdr = Createobject('_NMHDR', This.Address)
	Endproc

	Procedure FreeMembers()
		This.hdr = .Null.
	Endproc

	Procedure lpszText_Access()
		Return ReadPCString(This.Address + 12)
	Endproc

	Procedure lpszText_Assign(lnNewVal)
		WritePCString(This.Address + 12, m.lnNewVal)
	Endproc

	Procedure szText_Access()
		Return ReadCharArray(This.Address + 16,80)
	Endproc

	Procedure szText_Assign(lnNewVal)
		WriteCharArray(This.Address + 16, m.lnNewVal,80)
	Endproc

	Procedure hinst_Access()
		Return ReadPointer(This.Address + 96)
	Endproc

	Procedure hinst_Assign(lnNewVal)
		WritePointer(This.Address + 96, m.lnNewVal)
	Endproc

	Procedure uFlags_Access()
		Return ReadUInt(This.Address + 100)
	Endproc

	Procedure uFlags_Assign(lnNewVal)
		WriteUInt(This.Address + 100, m.lnNewVal)
	Endproc

	Procedure lParam_Access()
		Return ReadInt(This.Address + 104)
	Endproc

	Procedure lParam_Assign(lnNewVal)
		WriteInt(This.Address + 104, m.lnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagNMDAYSTATE {
*!*	    NMHDR nmhdr;
*!*	    SYSTEMTIME stStart;
*!*	    int cDayState;
*!*	    LPMONTHDAYSTATE prgDayState;
*!*	} NMDAYSTATE, *LPNMDAYSTATE;
********************************************************************************
Define Class _NMDAYSTATE As _STRUCTBASE

	SizeOf = 36
	Name = "NMDAYSTATE"
	&& structure fields
	nmhdr = .Null.
	stStart = .Null.
	cDayState = FALSE
	prgDayState = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="nmhdr" type="property" display="nmhdr"/>' + ;
		'<memberdata name="ststart" type="property" display="stStart"/>' + ;
		'<memberdata name="cdaystate" type="property" display="cDayState"/>' + ;
		'<memberdata name="prgdaystate" type="property" display="prgDayState"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		This.nmhdr = Createobject("_NMHDR", This.Address)
		This.stStart = Createobject("_SYSTEMTIME", This.Address + 12)
	Endproc

	Procedure FreeMembers()
		This.nmhdr = .Null.
		This.stStart = .Null.
	Endproc

	Procedure cDayState_Access()
		Return ReadInt(This.Address + 28)
	Endproc

	Procedure cDayState_Assign(pnNewVal)
		WriteInt(This.Address + 28, m.pnNewVal)
	Endproc

	Procedure prgDayState_Access()
		Return ReadInt(This.Address + 32)
	Endproc

	Procedure prgDayState_Assign(pnNewVal)
		WriteInt(This.Address + 32, m.pnNewVal)
	Endproc

Enddefine

********************************************************************************
*!*	typedef struct tagOFN {
*!*	  DWORD         lStructSize;
*!*	  HWND          hwndOwner;
*!*	  HINSTANCE     hInstance;
*!*	  LPCTSTR       lpstrFilter;
*!*	  LPTSTR        lpstrCustomFilter;
*!*	  DWORD         nMaxCustFilter;
*!*	  DWORD         nFilterIndex;
*!*	  LPTSTR        lpstrFile;
*!*	  DWORD         nMaxFile;
*!*	  LPTSTR        lpstrFileTitle;
*!*	  DWORD         nMaxFileTitle;
*!*	  LPCTSTR       lpstrInitialDir;
*!*	  LPCTSTR       lpstrTitle;
*!*	  DWORD         Flags;
*!*	  WORD          nFileOffset;
*!*	  WORD          nFileExtension;
*!*	  LPCTSTR       lpstrDefExt;
*!*	  LPARAM        lCustData;
*!*	  LPOFNHOOKPROC lpfnHook;
*!*	  LPCTSTR       lpTemplateName;
*!*	#if (_WIN32_WINNT >= 0x0500)
*!*	  void *        pvReserved;
*!*	  DWORD         dwReserved;
*!*	  DWORD         FlagsEx;
*!*	#endif // (_WIN32_WINNT >= 0x0500)
*!*	} OPENFILENAME, *LPOPENFILENAME;
********************************************************************************
Define Class _OPENFILENAME As  _STRUCTBASE

	SizeOf = 88
	Name = "OPENFILENAME"
	&& structure fields
	lStructSize = FALSE
	hwndOwner = FALSE
	hInstance = FALSE
	lpstrFilter = FALSE
	lpstrCustomFilter = FALSE
	nMaxCustFilter = FALSE
	nFilterIndex = FALSE
	lpstrFile = FALSE
	nMaxFile = FALSE
	lpstrFileTitle = FALSE
	nMaxFileTitle = FALSE
	lpstrInitialDir = FALSE
	lpstrTitle = FALSE
	Flags = FALSE
	nFileOffset = FALSE
	nFileExtension = FALSE
	lpstrDefExt = FALSE
	lCustData = FALSE
	lpfnHook = FALSE
	lpTemplateName = FALSE
	pvReserved = FALSE
	dwReserved = FALSE
	FlagsEx = FALSE

	_MemberData = '<VFPData>' + ;
		'<memberdata name="lstructsize" type="property" display="lStructSize"/>' + ;
		'<memberdata name="hwndowner" type="property" display="hwndOwner"/>' + ;
		'<memberdata name="hinstance" type="property" display="hInstance"/>' + ;
		'<memberdata name="lpstrfilter" type="property" display="lpstrFilter"/>' + ;
		'<memberdata name="lpstrcustomfilter" type="property" display="lpstrCustomFilter"/>' + ;
		'<memberdata name="nmaxcustfilter" type="property" display="nMaxCustFilter"/>' + ;
		'<memberdata name="nfilterindex" type="property" display="nFilterIndex"/>' + ;
		'<memberdata name="lpstrfile" type="property" display="lpstrFile"/>' + ;
		'<memberdata name="nmaxfile" type="property" display="nMaxFile"/>' + ;
		'<memberdata name="lpstrfiletitle" type="property" display="lpstrFileTitle"/>' + ;
		'<memberdata name="nmaxfiletitle" type="property" display="nMaxFileTitle"/>' + ;
		'<memberdata name="lpstrinitialdir" type="property" display="lpstrInitialDir"/>' + ;
		'<memberdata name="lpstrtitle" type="property" display="lpstrTitle"/>' + ;
		'<memberdata name="flags" type="property" display="Flags"/>' + ;
		'<memberdata name="nfileoffset" type="property" display="nFileOffset"/>' + ;
		'<memberdata name="nfileextension" type="property" display="nFileExtension"/>' + ;
		'<memberdata name="lpstrdefext" type="property" display="lpstrDefExt"/>' + ;
		'<memberdata name="lcustdata" type="property" display="lCustData"/>' + ;
		'<memberdata name="lpfnhook" type="property" display="lpfnHook"/>' + ;
		'<memberdata name="lptemplatename" type="property" display="lpTemplateName"/>' + ;
		'<memberdata name="pvreserved" type="property" display="pvReserved"/>' + ;
		'<memberdata name="dwreserved" type="property" display="dwReserved"/>' + ;
		'<memberdata name="flagsex" type="property" display="FlagsEx"/>' + ;
		'</VFPData>'

	Procedure InitMembers()
		If ctlGetOsVersion() < NTDDI_WIN2K Then
			This.lStructSize = 76
		Else
			This.lStructSize = 88
		Endif

	Endproc

	Procedure FreeMembers()
		FreePMem(This.Address + 12)
		FreePMem(This.Address + 16)
		FreePMem(This.Address + 28)
		FreePMem(This.Address + 36)
		FreePMem(This.Address + 44)
		FreePMem(This.Address + 48)
		FreePMem(This.Address + 60)
		FreePMem(This.Address + 72)
	Endproc

	Procedure lStructSize_Access()
		Return ReadUInt(This.Address)
	Endproc

	Procedure lStructSize_Assign(pnNewVal)
		WriteUInt(This.Address, m.pnNewVal)
	Endproc

	Procedure hwndOwner_Access()
		Return ReadInt(This.Address + 4)
	Endproc

	Procedure hwndOwner_Assign(pnNewVal)
		WriteInt(This.Address + 4, m.pnNewVal)
	Endproc

	Procedure hInstance_Access()
		Return ReadPointer(This.Address + 8)
	Endproc

	Procedure hInstance_Assign(pnNewVal)
		WritePointer(This.Address + 8, m.pnNewVal)
	Endproc

	Procedure lpstrFilter_Access()
		Return ReadPCString(This.Address + 12)
	Endproc

	Procedure lpstrFilter_Assign(pnNewVal)
		WritePCString(This.Address + 12, m.pnNewVal)
	Endproc

	Procedure lpstrCustomFilter_Access()
		Return ReadPCString(This.Address + 16)
	Endproc

	Procedure lpstrCustomFilter_Assign(pnNewVal)
		WritePCString(This.Address + 16, m.pnNewVal)
	Endproc

	Procedure nMaxCustFilter_Access()
		Return ReadUInt(This.Address + 20)
	Endproc

	Procedure nMaxCustFilter_Assign(pnNewVal)
		WriteUInt(This.Address + 20, m.pnNewVal)
	Endproc

	Procedure nFilterIndex_Access()
		Return ReadUInt(This.Address + 24)
	Endproc

	Procedure nFilterIndex_Assign(pnNewVal)
		WriteUInt(This.Address + 24, m.pnNewVal)
	Endproc

	Procedure GetlpstrFile()
		Return This.ReadPCString(This.Address + 28, This.nMaxFile)
	Endproc

	Procedure lpstrFile_Access()
		*!* may have embedded nulls
		Return ReadPCString(This.Address + 28)
	Endproc

	Procedure lpstrFile_Assign(pnNewVal)
		WritePCString(This.Address + 28, m.pnNewVal)
		This.nMaxFile = Len(m.pnNewVal)
	Endproc

	Procedure nMaxFile_Access()
		Return ReadUInt(This.Address + 32)
	Endproc

	Procedure nMaxFile_Assign(pnNewVal)
		WriteUInt(This.Address + 32, m.pnNewVal)
	Endproc

	Procedure lpstrFileTitle_Access()
		Return ReadPCString(This.Address + 36)
	Endproc

	Procedure lpstrFileTitle_Assign(pnNewVal)
		WritePCString(This.Address + 36, m.pnNewVal)
		This.nMaxFileTitle = Len(m.pnNewVal)
	Endproc

	Procedure nMaxFileTitle_Access()
		Return ReadUInt(This.Address + 40)
	Endproc

	Procedure nMaxFileTitle_Assign(pnNewVal)
		WriteUInt(This.Address + 40, m.pnNewVal)
	Endproc

	Procedure lpstrInitialDir_Access()
		Return ReadPCString(This.Address + 44)
	Endproc

	Procedure lpstrInitialDir_Assign(pnNewVal)
		WritePCString(This.Address + 44, m.pnNewVal)
	Endproc

	Procedure lpstrTitle_Access()
		Return ReadPCString(This.Address + 48)
	Endproc

	Procedure lpstrTitle_Assign(pnNewVal)
		WritePCString(This.Address + 48, m.pnNewVal)
	Endproc

	Procedure flags_Access()
		Return ReadUInt(This.Address + 52)
	Endproc

	Procedure flags_Assign(pnNewVal)
		WriteUInt(This.Address + 52, m.pnNewVal)
	Endproc

	Procedure nFileOffset_Access()
		Return ReadUShort(This.Address + 56)
	Endproc

	Procedure nFileOffset_Assign(pnNewVal)
		WriteUShort(This.Address + 56, m.pnNewVal)
	Endproc

	Procedure nFileExtension_Access()
		Return ReadUShort(This.Address + 58)
	Endproc

	Procedure nFileExtension_Assign(pnNewVal)
		WriteUShort(This.Address + 58, m.pnNewVal)
	Endproc

	Procedure lpstrDefExt_Access()
		Return ReadPCString(This.Address + 60)
	Endproc

	Procedure lpstrDefExt_Assign(pnNewVal)
		WritePCString(This.Address + 60, m.pnNewVal)
	Endproc

	Procedure lCustData_Access()
		Return ReadInt(This.Address + 64)
	Endproc

	Procedure lCustData_Assign(pnNewVal)
		WriteInt(This.Address + 64, m.pnNewVal)
	Endproc

	Procedure lpfnHook_Access()
		Return ReadUInt(This.Address + 68)
	Endproc

	Procedure lpfnHook_Assign(pnNewVal)
		WriteUInt(This.Address + 68, m.pnNewVal)
	Endproc

	Procedure lpTemplateName_Access()
		Return ReadPCString(This.Address + 72)
	Endproc

	Procedure lpTemplateName_Assign(pnNewVal)
		WritePCString(This.Address + 72, m.pnNewVal)
	Endproc

	Procedure pvReserved_Access()
		Return ReadPointer(This.Address + 76)
	Endproc

	Procedure pvReserved_Assign(pnNewVal)
		WritePointer(This.Address + 76, m.pnNewVal)
	Endproc

	Procedure dwReserved_Access()
		Return ReadUInt(This.Address + 80)
	Endproc

	Procedure dwReserved_Assign(pnNewVal)
		WriteUInt(This.Address + 80, m.pnNewVal)
	Endproc

	Procedure FlagsEx_Access()
		Return ReadUInt(This.Address + 84)
	Endproc

	Procedure FlagsEx_Assign(pnNewVal)
		WriteUInt(This.Address + 84, m.pnNewVal)
	Endproc

Enddefine

