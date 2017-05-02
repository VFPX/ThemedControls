********************************************************************************
*!* ctl32.prg
********************************************************************************
*!* This is the main file for the ctl32 classes. This gets called by
*!* each and every class in the Init event.

#Include ctl32.h

*!* Adding this file location to the path list. ADDITIVE is not used, it seems
*!* to have problems with expressions, so to avoid using macro substitution:
Local m.lcPath As String

m.lcPath = Addbs(Justpath(Sys(16)))

If Empty(Set("Path")) Then
	Set Path To (m.lcPath)
Else
	If Not m.lcPath $ Set("Path") Then
		Set Path To (Set("Path") + ";" + m.lcPath)
	Endif
Endif

*!* Load the main visual classes VCX file:
If Not "CTL32.VCX" $ Upper(Set("Classlib")) Then
	Set Classlib To m.lcPath + "ctl32.vcx" Additive
Endif

*!* Load ctl32 modules:
Do ctl32_api.prg
Do ctl32_classes.prg
Do ctl32_functions.prg
Do ctl32_structures.prg
Do ctl32_vfp2c32.prg

Return


