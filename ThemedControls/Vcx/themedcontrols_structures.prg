Define Class VFP_BLENDFUNCTION As Struct
   *!* Original Structure definition:
   *!*	typedef struct _BLENDFUNCTION {
   *!*	  BYTE BlendOp;
   *!*	  BYTE BlendFlags;
   *!*	  BYTE SourceConstantAlpha;
   *!*	  BYTE AlphaFormat;
   *!*	} BLENDFUNCTION, *PBLENDFUNCTION, *LPBLEN
   Procedure Init
      This.AddField('BlendOp', 'BYTE', 0)
      This.AddField('BlendFlags', 'BYTE', 0)
      This.AddField('SourceConstantAlpha', 'BYTE', 0)
      This.AddField('AlphaFormat', 'BYTE', 0)
   Endproc
Enddefine

Define Class VFP_POINT As Struct
   *!* Original Structure definition:
   *!*	typedef struct tagPOINT {
   *!*	   LONG x;
   *!*	   LONG y;
   *!*	} POINT
   Procedure Init
      This.AddField('x', 'LONG', 0)
      This.AddField('y', 'LONG', 0)
   Endproc
Enddefine

Define Class VFP_SIZE As Struct
   *!* Original Structure definition:
   *!*	typedef struct tagSIZE {
   *!*	  LONG cx;
   *!*	  LONG cy;
   *!*	} SIZE, *PSIZE
   Procedure Init
      This.AddField('cx', 'LONG', 0)
      This.AddField('cy', 'LONG', 0)
   Endproc
Enddefine

Define Class Struct As Session
   *  Author: William GC Steinford
   * Purpose: This class simplifies creating structures to pass to Api routines,
   *           and retrieving values out of structures changed by Api routines.
   *   Usage: Just subclass this class, and override the Init event, calling
   *           AddField( 'fieldname', 'type', starting_value )
   *           once for each field in the structure.
   *   Notes: PCHAR fields are automatically allocated, destroyed, and de-referenced
   *            whenever needed.
   *          Sub-Structures can be handled by defining them as an "@STRING",
   *            creating a second class/object for the substructure,
   *            then assigning the sub-structure's ".Structure" property
   *            to the parent structure's @STRING field
   *
   Dimension arrFields[1,5]
   Dimension Fld[1]
   && Name, Type, Pos, Len, Data
   FieldCount  = 0
   Structure   = ''
   DataSession = 1 && Default DataSession
   BypassStructureProtection = .F.

   Function AddField( pcField, pcType, pvValue )
      Local lcEnc
      This.FieldCount = This.FieldCount + 1
      Dimension This.arrFields[THIS.FieldCount,5]
      This.arrFields[THIS.FieldCount,1] = Upper(pcField)
      This.arrFields[THIS.FieldCount,2] = pcType
      This.arrFields[THIS.FieldCount,3] = Len(This.Structure)+1
      This.arrFields[THIS.FieldCount,4] = This.TypeLen(pcType,pvValue)
      This.arrFields[THIS.FieldCount,5] = Iif( pcType='STRUCT', pvValue, .Null. )
      lcEnc = This.ValToType(pvValue,pcType,This.arrFields[THIS.FieldCount,4])
      If Vartype(lcEnc)='C'
         This.AddToStructure( lcEnc )
      Else
         Return .F.
      Endif
   Endfunc
   Function TypeLen( pcType, pvVal )
      Do Case
         Case Inlist(Upper(pcType),'BYTE')
            Return 1

            *v11.01..'INTEGER' was in this list, but is not clear...
            *v11.01..'SHORT' was in this list, but had been taken out. Now it's appropriately back.
         Case Inlist(Upper(pcType),'WORD','HANDLE','SHORT','PASCAL_INTEGER')
            Return 2
         Case Inlist(Upper(pcType),'LONG','DWORD')
            Return 4
         Case Inlist(Upper(pcType),'@STRING')
            Return 4
         Case Inlist(Upper(pcType),'STRING')
            Return Len(pvVal)
         Case Inlist(Upper(pcType),'PASCAL_STRING')
            Return Len(pvVal)+1
         Case Inlist(Upper(pcType),'PASCAL_BOolEAN')
            Return 1
         Case Inlist(Upper(pcType),'LOGICAL','BOolEAN','BOol')
            Return 1
         Case Inlist(Upper(pcType),'DOUBLE','FLOAT64') && Apr 20, 2006
            Return 6
         Case Inlist(Upper(pcType),'PASCAL_REAL','FLOAT48')
            Return 6
         Case Inlist(Upper(pcType),'FLOAT','FLOAT32','SINGLE')
            Return 4
         Case Inlist(Upper(pcType),'STRUCT')
            Return Len(pvVal.Structure)
         Case Inlist(Upper(pcType),'STRUCT')
            Assert Type('pvVal')='O' And Type('pvVal.Structure')='C' Message "Incorrect Type"
            Return Len(pvVal.Structure)
      Endcase
   Endfunc

   Function ValToType( pvVal, pcType, pnLen )
      * Convert a value of the given type to the Struct Encoding
      Local lnRet
      Do Case
         Case Inlist(Upper(pcType),'BYTE')
            Assert Type('pvVal')='N' Message "Incorrect Type"
            Return Chr(Mod(pvVal,256))

            *v11.01..'INTEGER' was in this list, but is not clear...
            *v11.01..'SHORT' was in this list, but had been taken out. Now it's appropriately back.
         Case Inlist(Upper(pcType),'WORD','HANDLE','SHORT','PASCAL_INTEGER')
            Assert Type('pvVal')='N' Message "Incorrect Type"
            Return Chr(Mod(pvVal,256)) + Chr(Int(pvVal/256))
         Case Inlist(Upper(pcType),'LONG','DWORD')
            Assert Type('pvVal')='N' Message "Incorrect Type"
            #Define m0_8        256
            #Define m1_16     65536
            #Define m2_24  16777216
            Local b0, b1, b2, b3
            b3 = Int(pvVal/m2_24)
            b2 = Int((pvVal - b3*m2_24)/m1_16)
            b1 = Int((pvVal - b3*m2_24 - b2*m1_16)/m0_8)
            b0 = Mod(pvVal, m0_8)
            Return Chr(b0)+Chr(b1)+Chr(b2)+Chr(b3)
         Case Upper(pcType)='STRING'
            Assert Type('pvVal')='C' Message "Incorrect Type"
            Return Padr(pvVal,pnLen,Chr(0))
         Case Upper(pcType)='PASCAL_STRING'
            * First character is length byte.  Pad to var size with zeros.
            Assert Type('pvVal')='C' Message "Incorrect Type"
            Return Padr( Chr(Len(pvVal))+pvVal, pnLen,Chr(0))
         Case Upper(pcType)='@STRING'
            Assert Inlist(Type('pvVal'),'C','N') Message "Incorrect Type"
            * Nov 20, 2003: Allow user to pass in a Numeric pointer
            If Type('pvVal')='N' && Passed in a pointer reference.. probably NulL=0
               Return This.ValToType(pvVal,'LONG')
            Endif
            *!*            * If the string is just CHR(0), then it's a NulL pointer
            *!*            if len(pvVal)=1 and asc(pvVal)=0 && NulL pointer
            *!*              RETURN THIS.ValToType(0,'LONG')
            *!*            endif

            * If it's an empty string, then it's a NulL pointer
            If Len(pvVal)=0 && NulL pointer
               Return This.ValToType(0,'LONG')
            Endif
            Declare Long GlobalAlloc In "kernel32" Long wFlags, Long dwBytes
            lnRet = GlobalAlloc(0,Len(pvVal))
            Declare Long RtlMoveMemory In "kernel32" ;
               LONG ptrIntoHere, String @ cFromHere, Long cb
            RtlMoveMemory(lnRet,@pvVal,Len(pvVal))
            Return This.ValToType(lnRet,'LONG')
         Case Inlist(Upper(pcType),'LOGICAL','BOolEAN','BOol')
            Assert Type('pvVal')='L' Message "Incorrect Type"
            Return Iif( pvVal, Chr(0), Chr(1) ) && fixed pcType->pvVal 10/14/2003
         Case Inlist(Upper(pcType),'PASCAL_BOolEAN')
            Assert Type('pvVal')='L' Message "Incorrect Type"
            Return Iif( pvVal, Chr(1), Chr(0) ) && fixed pcType->pvVal 10/14/2003
         Case Inlist(Upper(pcType),'PASCAL_REAL','FLOAT48')
            Assert Type('pvVal')='N' Message "Incorrect Type"
            Return Space(6) && TODO: How to convert a number into a binary 'real'
         Case Inlist(Upper(pcType),'DOUBLE','FLOAT64') && Apr 20, 2006 wgcs
            *FUNCTION NumToFloat64
            *LPARAMETERS NUMB AS NUMBER
            Local Float64 As String, ;
               SIGN As Integer, ;
               Bias As Integer, ;
               Exponent As Integer, ;
               I As Integer, ;
               Y As Integer, ;
               x As String, ;
               Mantissa As Number, ;
               oldFixed As String, ;
               m.byte,m.bit, ;
               fraction As Number

            Numb = pvVal
            oldFixed=Set("Fixed")
            Set Fixed Off
            Mantissa=0
            Sign=0
            Bias=1023
            Exponent=0

            Float64=Replicate(Chr(0),8)

            *set sing
            Float64=Stuff(Float64,1,1,Iif(Numb<0,Chr(128),Chr(0)))
            Numb=Abs(Numb)
            I=-1023
            Do While I<=1023
               If Numb<2^I
                  Exit
               Endif
               I=I+1
            Enddo
            Exponent=1023+I-1
            For I=0 To 11
               If Bittest(Exponent,I)
                  m.byte=Int(((12-I)-1)/8)+1
                  m.bit=7-Mod(((12-I)-1),8)
                  Float64=Stuff(Float64,m.byte,1,Chr(Bitset(Asc(Substr(Float64,m.byte,1)),m.bit)))
               Endif
            Next
            Mantissa=Numb/(2^(Exponent-1023))-1
            For I=1 To 52
               If Mantissa>=1/(2^I)
                  m.byte=Int(((I+12)-1)/8)+1
                  m.bit=7-Mod(((I+12)-1),8)
                  Float64=Stuff(Float64,m.byte,1,Chr(Bitset(Asc(Substr(Float64,m.byte,1)),m.bit)))
                  Mantissa=Mantissa-1/(2^I)
               Endif
               If Mantissa=0
                  Exit
               Endif
            Next

            Set Fixed &oldFixed
            Return Float64
         Case Inlist(Upper(pcType),'FLOAT','FLOAT32','SINGLE')
            Assert Type('pvVal')='N' Message "Incorrect Type"
            * Thanks to Anatoliy Mogylevets at http://fox.wikis.com/wc.dll?Wiki~VFPFloatingPointDataType~VFP
            #Define REAL_BIAS 127
            #Define REAL_MANTISSA_SIZE 23
            #Define REAL_NEGATIVE 0x80000000
            #Define EXPONENT_MASK 0x7F800000
            #Define MANTISSA_MASK 0x007FFFFF

            Local num, sgn, Exponent, Mantissa, lcHex, lcBin
            num = pvVal

            Do Case
               Case num < 0
                  sgn = REAL_NEGATIVE
                  num = -num
               Case num > 0
                  sgn = 0
               Otherwise
                  Return 0
            Endcase

            Exponent = Floor(Log(num)/Log(2))
            Mantissa = (num - 2^Exponent)* 2^(REAL_MANTISSA_SIZE-Exponent)
            Exponent = Bitlshift(Exponent+REAL_BIAS, REAL_MANTISSA_SIZE)

            num = Bitor(sgn, Exponent, Mantissa)
            lcHex = Transform(num,'@0')

            * 1234567890
            * 0x47F12000 = 123456
            lcBin =  This.ValToType(Substr(lcHex,3,2),'HEX') ;
               +This.ValToType(Substr(lcHex,5,2),'HEX') ;
               +This.ValToType(Substr(lcHex,7,2),'HEX') ;
               +This.ValToType(Substr(lcHex,9,2),'HEX')
            Return lcBin
         Case Inlist(Upper(pcType),'HEX')
            Assert Type('pvVal')='C' Message "Incorrect Type"
            Local lnI, lcChr, lnVal
            lnVal = 0
            For lnI = 1 To Len( pvVal )
               lcChr = Substr( pvVal, Len(pvVal)-lnI+1, 1 )
               Do Case
                  Case Inlist( lcChr, '0','1','2','3','4','5','6','7','8','9' )
                     lnVal = lnVal + Val(lcChr) * 2^((lnI-1)*4)
                  Case Inlist( lcChr, 'A','B','C','D','E','F' )
                     lnVal = lnVal + (Asc(lcChr)-Asc('A')+10) * 2^((lnI-1)*4)
               Endcase
            Endfor
            Return Chr( lnVal%256 )
         Case Inlist(Upper(pcType),'STRUCT')
            Assert Type('pvVal')='O' Message "Incorrect Type"
            Return pvVal.Structure
      Endcase
   Endfunc
   Function TypeToVal( pcVal, pcType, pnFld )
      * Convert a struct encoded Type back to it's original value
      * pnFld is the index of this field in the structure:
      *   this is useful for getting any attached data
      *   (primarily the Struct Object for a sub-structure)
      Local lnPtr, lcRet
      Do Case
         Case Inlist(Upper(pcType),'BYTE')
            Return Asc(Substr(pcVal, 1,1))

            *v11.01..'INTEGER' was in this list, but is not clear... there are different size integers.
            *v11.01..'SHORT' was in this list, but had been taken out. Now it's appropriately back.
         Case Inlist(Upper(pcType),'SHORT','WORD','HANDLE','PASCAL_INTEGER')
            Return Asc(Substr(pcVal, 1,1)) + ;
               Asc(Substr(pcVal, 2,1)) * 256
         Case Inlist(Upper(pcType),'LONG','DWORD') && Apr 20, 2006..removed inappropriate "DOUBLE"
            Return Asc(Substr(pcVal, 1,1)) + ;
               Asc(Substr(pcVal, 2,1)) * 256 +;
               Asc(Substr(pcVal, 3,1)) * 65536 +;
               Asc(Substr(pcVal, 4,1)) * 16777216
         Case Upper(pcType)='STRING'
            Return pcVal
         Case Upper(pcType)='PASCAL_STRING'
            * First character is length byte.  Trim string to actual size.
            Return Substr(pcVal,2,Asc(pcVal))
         Case Upper(pcType)='@STRING'
            lnPtr = This.TypeToVal( pcVal, 'LONG' )
            Declare Long GlobalSize In "Kernel32" Long HGLOBAL_hMem
            lnLen = GlobalSize(lnPtr)
            Assert lnLen>0 Message "Could not determine length of string."
            lcRet = Space(lnLen)
            Declare Long RtlMoveMemory In "kernel32" ;
               STRING @ cIntoHere, Long ptrFromHere, Long cb
            RtlMoveMemory(@lcRet,lnPtr,lnLen)
            Return lcRet
         Case Inlist(Upper(pcType),'LOGICAL','BOolEAN','BOol')
            Return Asc( Substr(pcVal,1) ) = 0
         Case Inlist(Upper(pcType),'PASCAL_BOolEAN')
            Return Asc( Substr(pcVal,1) ) <> 0
         Case Inlist(Upper(pcType),'DOUBLE','FLOAT64') && Apr 20, 2006..added section
            * From: http://www.tek-tips.com/faqs.cfm?fid=1932
            *FUNCTION  Float64ToNum
            *LPARAMETERS Float64 AS STRING

            *!*        S XXXXXXX XXXX MMMM MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM
            *!*        0 0000000 0000 0000 00000000 00000000 00000000 00000000 00000000 00000000
            *!*        1 2345678 9012 3456 78901234
            *!*            1         2         3
            Local Sign As Integer, ;
               Bias As Integer, ;
               Exponent As Integer, ;
               I As Integer, ;
               x As String, ;
               Mantissa As Number, ;
               OldDecimals As Integer, ;
               oldFixed As String

            Float64 = pcVal
            If Len(Float64)<8
               Return 0
            Endif

            *OldDecimals=SET("Decimals")
            *SET DECIMALS TO 20
            oldFixed=Set("Fixed")
            Set Fixed Off
            Mantissa=1
            Sign=0
            Bias=1023
            Exponent=0
            Float64  =Left(Float64,8)
            Sign=Iif(Bittest(Asc(Left(Float64,1)),7),-1,1)
            For I=12 To 2 Step -1
               Exponent = Exponent + Iif(Bittest(Asc(Substr(Float64,Int((I-1)/8)+1,1)),;
                  7-Mod((I-1),8)),1,0)*(2^(12-I))
            Next
            Exponent = Exponent-1023
            For I=13 To 64
               AA=Int((I-1)/8)+1
               BB=7-Mod((I-1),8)
               B=Iif(Bittest(Asc(Substr(Float64,Int((I-1)/8)+1,1)),7-Mod((I-1),8)),1,0)
               Mantissa = Mantissa + Iif(Bittest(Asc(Substr(Float64,Int((I-1)/8)+1,1)),;
                  7-Mod((I-1),8)),1,0)*(1/(2^(I-12)))
            Next
            Set Fixed &oldFixed
            Return Sign*(Mantissa)*(2^Exponent)

         Case Inlist(Upper(pcType),'PASCAL_REAL','FLOAT48')

            * info from: http://docs.sun.com/db/doc/801-5055/6hvhckkeh?a=view
            *            http://info.borland.com/techpubs/delphi/delphi5/oplg/memory.html
            *            http://www.tek-tips.com/faqs.cfm?spid=184&sfid=1932
            *            http://www.tek-tips.com/faqs.cfm?fid=1932
            *              faq184-1932
            * A 6-byte (48-bit) Real48 number is divided into three fields:
            *   1 bit: Sign
            *  39 bits: f (mantissa)
            *   8 bits: e (exponent)
            *  If 0 < e <= 255, the value v of the number is given by
            *     v = (-1)^s * 2^(e-129) * (1.f )
            *  If e = 0, then v = 0.

            * Pascal Real:
            ***  S MMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM EEEEEEEE
            *    1 2345678 90123456 78901234 56789012 34567890 12345678
            *               1          2          3          4

            * 64 bit float:
            *!*        S XXXXXXX XXXX MMMM MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM MMMMMMMM
            *!*        0 0000000 0000 0000 00000000 00000000 00000000 00000000 00000000 00000000
            *!*        1 2345678 9012 3456 78901234
            *!*                   1           2         3

            Local Float48, Sign, Bias, Exponent, I, x, Mantissa, oldFixed
            Float48 = pcVal

            If Len(Float48) < 6
               Return 0
            Endif
            oldFixed=Set("Fixed")
            Set Fixed Off
            Mantissa = 1
            Sign     = 0
            Bias     = 129 && 64bit bias: 1023
            Exponent = 0
            Float48  = Left(Float48,6)

            Sign=Iif( Bittest(Asc(Float48),7), -1, 1)

            For I=48 To 41 Step -1
               *FOR I=12 TO 2 STEP -1
               AA = Int((I-1)/8)+1  && Find the appropriate Byte to look in
               BB = 7-Mod((I-1),8)  && Find the appropriate bit in that byte
               B = Bittest(Asc(Substr(Float48,AA,1)),BB)      && Find out if that bit is set

               Exponent = Exponent + Iif( B, 2^(48-I), 0)

               *  Exponent = Exponent + IIF(BITTEST(ASC(SUBSTR(Float64,INT((I-1)/8)+1,1)),;
               *                                  7-MOD((I-1),8)),1,0)*(2^(12-I))
            Next
            Exponent = Exponent-Bias

            For I=2 To 40
               *FOR I=13 TO 64
               AA = Int((I-1)/8)+1  && Find the appropriate Byte to look in
               BB = 7-Mod((I-1),8)  && Find the appropriate bit in that byte
               B = Bittest(Asc(Substr(Float48,AA,1)),BB)      && Find out if that bit is set
               Mantissa = Mantissa + Iif( B, 1/(2^(I-1)), 0 ) && If set, add to the total Mantissa

               *  Mantissa = Mantissa + IIF(BITTEST(ASC(SUBSTR(Float64,INT((I-1)/8)+1,1)),;
               *                                  7-MOD((I-1),8)),1,0)*(1/(2^(I-12)))
            Next
            Set Fixed &oldFixed
            Return Sign*(Mantissa)*(2^Exponent)
         Case Inlist(Upper(pcType),'FLOAT','FLOAT32','SINGLE')
            * Thanks to AnatoliyMogylevets at http://fox.wikis.com/wc.dll?Wiki~VFPFloatingPointDataType~VFP
            Local num, lcHex, sgn, Exponent, Mantissa
            lcHex = Right(Transform(Asc(Substr(pcVal,1,1)),'@0'),2) ;
               + Right(Transform(Asc(Substr(pcVal,2,1)),'@0'),2) ;
               + Right(Transform(Asc(Substr(pcVal,3,1)),'@0'),2) ;
               + Right(Transform(Asc(Substr(pcVal,4,1)),'@0'),2)
            num = Evaluate('0x'+lcHex)
            sgn = Iif(Bittest(num,31), -1,1)
            Exponent = Bitrshift(Bitand(num, EXPONENT_MASK), REAL_MANTISSA_SIZE) - REAL_BIAS
            Mantissa = Bitand(num, MANTISSA_MASK) / 2^(REAL_MANTISSA_SIZE-m.Exponent)
            Return (2^m.Exponent + m.Mantissa) * m.sgn
         Case Inlist(Upper(pcType),'STRUCT')
            * return the associated structure object
            Assert Vartype(This.arrFields[pnFld,5])='O' Message "STRUCT Object Data Item Not Found"
            This.arrFields[pnFld,5].Structure = pcVal
            Return This.arrFields[pnFld,5]
      Endcase
   Endfunc

   Function Fld_Access( pncIdx )
      Local lnIdx, lcVal, lvRes, lnOEx, lcIdx, lcSubFld
      lcSubFld = ''
      Do Case
         Case Type('pncIdx')='N'
            lnIdx = pncIdx
         Case Type('pncIdx')='C'
            Assert Type('pncIdx')='C' Message "Must provide numeric or character Index!"
            lnOEx = Set('EXACT')
            lcIdx = pncIdx
            Set Exact On
            If '.' $ lcIdx && this is a sub-structure field reference
               lcSubFld = Substr(lcIdx,At('.',lcIdx)+1)
               lcIdx    = Left(lcIdx,At('.',lcIdx)-1)
            Endif
            lnIdx = Ascan(This.arrFields,Upper(lcIdx))
            Set Exact &lnOEx
            Assert lnIdx>0 Message "Field not found"
            If lnIdx=0
               Return .Null.
            Endif
            lnIdx = Asubscript(This.arrFields,lnIdx,1)
         Otherwise && Bad index value.
            Return .Null.
      Endcase
      lcVal = Substr(This.Structure,This.arrFields[lnIdx,3],This.arrFields[lnIdx,4])
      lvRes = This.TypeToVal(lcVal,This.arrFields[lnIdx,2],lnIdx)
      If Not Empty(lcSubFld)
         Assert Vartype(lvRes)='O' Message "SubField requires STRUCT Object"
         * Retrieving value from sub-field... Refresh sub-structures whole structure value:
         && Oct 23, 2003: Make sure the sub-structure is current
         This.arrFields[lnIdx,5].Structure = Substr(This.Structure,This.arrFields[lnIdx,3],This.arrFields[lnIdx,4])
         lvRes = lvRes.Fld[(lcSubFld)] && Oct 20, 2003: Pass by reference to avoid strange VFP6 behavior of skipping the _ACCESS method
      Endif
      Return lvRes
   Endfunc
   *
   Function Fld_Assign( pvNewVal, pncIdx )
      Local lcBuf, lnIdx, lnVal, lvNewVal, lnPtr, lnOEx, lcIdx, lcSubFld
      lcSubFld = ''
      If Type('pncIdx')='N'
         lnIdx = pncIdx
      Else
         Assert Type('pncIdx')='C' Message "Must provide numeric or character Index!"
         lnOEx = Set('EXACT')
         lcIdx = pncIdx
         Set Exact On
         If '.' $ lcIdx && this is a sub-structure field reference
            lcSubFld = Substr(lcIdx,At('.',lcIdx)+1)
            lcIdx    = Left(lcIdx,At('.',lcIdx)-1)
         Endif
         lnIdx = Ascan(This.arrFields,Upper(lcIdx))
         Set Exact &lnOEx
         Assert lnIdx>0 Message "Field not found"
         If lnIdx=0
            Return .Null.
         Endif
         lnIdx = Asubscript(This.arrFields,lnIdx,1)
      Endif
      If This.arrFields[lnIdx,2]='@STRING'
         * Free the stored string (ValToType will re-allocate memory)
         Declare Long GlobalFree In "kernel32" Long Hmem
         This.arrFields[lnIdx,2] = 'LONG'  && Not going to be a pointer much longer.
         lnPtr = This.Fld[lnIdx]           && get it as a LONG pointer
         This.arrFields[lnIdx,2] = '@STRING'
         If lnPtr>0
            GlobalFree(lnPtr)
         Endif
      Endif

      * If we were handed a structure object (primarily to assign a structure into an @STRING)
      *    take the String version of the structure.
      If Type('pvNewVal.Structure')='C' && substructure... take string version
         lvNewVal = pvNewVal.Structure
      Else
         lvNewVal = pvNewVal
      Endif

      Do Case && This CASE is to properly get the new encoded-value into lcBuf
         Case This.arrFields[lnIdx,2]='STRUCT'
            If Not Empty(lcSubFld)
               * Assigning value into sub-field... Refresh sub-structures whole structure value:
               && Oct 21, 2003: Make sure the sub-structure is current
               This.arrFields[lnIdx,5].Structure = Substr(This.Structure,This.arrFields[lnIdx,3],This.arrFields[lnIdx,4])
               * Assign new sub-field's value
               This.arrFields[lnIdx,5].Fld[(lcSubFld)] = lvNewVal  && Oct 21, 2003: Pass by reference to avoid strange VFP6 behavior of skipping the _ACCESS method
               * Retrieve the sub-structure's string to be stuffed back into this structure's string.
               * Make sure that the sub-structure's encoded string is the right length:
               lcBuf = Padr(This.arrFields[lnIdx,5].Structure,This.arrFields[lnIdx,4],Chr(0))
            Else
               * Assigning entire encoded-structure-string to replace this sub-structure

               * Make sure that the sub-structure's encoded string is the right length:
               lcBuf = Padr(lvNewVal,This.arrFields[lnIdx,4],Chr(0))
               * Set the new encoded-structure-string into the sub-structure object
               This.arrFields[lnIdx,5].Structure = lcBuf
            Endif
         Otherwise
            lcBuf = This.ValToType(lvNewVal,This.arrFields[lnIdx,2],This.arrFields[lnIdx,4])
      Endcase
      * Stuff the encoded string into THIS.structure
      * Arr Col 3:start idx in .structure, 4:length of data item
      This.Structure = Stuff( This.Structure, This.arrFields[lnIdx,3], This.arrFields[lnIdx,4], lcBuf )
   Endfunc
   *
   Function StructureToPtr
      Local lnOut
      lnOut = This.TypeToVal( This.ValToType( This.Structure, '@STRING' ), 'LONG' )  && return a numeric
      Return lnOut
   Endfunc
   Function PtrToStructure( pnPtr )
      Local lcStr
      * Convert the number to a string/Long
      * Then Retrieve the memory that String/Long points to.
      lcStr = This.TypeToVal( This.ValToType( pnPtr, 'LONG' ), '@STRING' )
      This.Structure = lcStr
   Endfunc
   Function FreePtr(Hmem)
      Declare Long GlobalFree In "kernel32" Long Hmem
      GlobalFree(Hmem)
   Endfunc
   Function Structure_Assign( pvNewVal )
      * Ensure that the type of Structure stays Character, and that it stays the same length!
      If Vartype(pvNewVal)='C'
         If This.BypassStructureProtection
            This.Structure = pvNewVal
         Else
            This.Structure = Padr(pvNewVal,Len(This.Structure),Chr(0))
         Endif
      Endif
   Endfunc
   Function AddToStructure( pcNewFld )
      * Ensure that the type of Structure stays Character, and that it stays the same length!
      This.BypassStructureProtection = .T.
      This.Structure = This.Structure + pcNewFld
      This.BypassStructureProtection = .F.
   Endfunc

   Function Destroy
      Local lnI, lnPtr
      Declare Long GlobalFree In "kernel32" Long Hmem
      For lnI = 1 To This.FieldCount
         Do Case
            Case This.arrFields[lnI,2]='@STRING'
               This.arrFields[lnI,2] = 'LONG' && Not going to be a pointer much longer.
               lnPtr = This.Fld[lnI]          && get it as a LONG pointer
               GlobalFree(lnPtr)              && Now, it really is no longer a pointer
            Case This.arrFields[lnI,2]='STRUCT'
               loObj = This.arrFields[lnI,5]   && save contained object.
               This.arrFields[lnI,5] = .Null.  && remove reference in array
               Release loObj                   && Explicitly release it
               loObj = .Null.
         Endcase
      Endfor
   Endfunc
   *
   Function DebugShowStruct
      * This should build a multi-line string displaying the structure and it's contents.
      Local lnI, lnJ, lcOut, lnFldLen, lnTypLen, lnValLen, lvVal, lcSub, lcRaw
      lnFldLen = 15
      lnTypLen = 10
      lnValLen = 20
      lcOut = 'Structure Class '+This.Class + _CRLF
      For lnJ = 1 To Len(This.Structure)
         lcOut = lcOut + Str( Asc(Substr(This.Structure,lnJ)), 4 )
      Endfor
      lcOut = lcOut + _CRLF

      For lnI = 1 To This.FieldCount
         lnFldLen = Max(lnFldLen,Len(This.arrFields[lnI,1]))
         lnTypLen = Max(lnTypLen,Len(This.arrFields[lnI,2]))
         lcSub = Substr(This.Structure,This.arrFields[lnI,3],This.arrFields[lnI,4])
         lcRaw = ''
         For lnJ = 1 To Len(lcSub)
            lcRaw = lcRaw + Str( Asc(Substr(lcSub,lnJ)), 4 )
         Endfor

         lvVal = This.Fld(lnI)
         Do Case
            Case Type('lvVal')='O' And Type('lvVal.structure')='C'
               lvVal = '(struct '+lvVal.Class+')'
            Case Type('lvVal')='O'
               lvVal = '(object '+lvVal.Class+')'
            Otherwise
               lvVal = Tran(lvVal)
         Endcase
         lnValLen = Max(lnValLen,Len(lvVal))
         lcOut = lcOut+'  '+Padr(This.arrFields[lnI,1],lnFldLen);
            +'  '+Padr(This.arrFields[lnI,2],lnTypLen);
            +'  '+Padr(lvVal,lnValLen)+ ':'+ lcRaw + _CRLF
         If lvVal='(struct '
            lvVal = This.Fld(lnI)
            lvVal = lvVal.DebugShowStruct()
            lvVal = '  '+Trim(Strtran(lvVal,_CRLF,_CRLF+'  '))
            lcOut = lcOut + lvVal
         Endif
      Endfor
      Return lcOut
   Endfunc
Enddefine