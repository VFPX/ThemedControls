On Shutdown CloseApplication()

* Set paths
Local lcDefaultPath
If _vfp.StartMode = 0 And ;
      Type("_vfp.ActiveProject")=="O"
   lcDefaultPath = _vfp.ActiveProject.HomeDir
   Set Path To (Addbs(lcDefaultPath)+"VCX") Additive
Else
   lcDefaultPath = Sys(5)+Sys(2003)
Endif
Set Path To (Addbs(lcDefaultPath)+"Images") Additive
Set Default To (lcDefaultPath)

* To use additional ThemedControls
*!*	_Screen.Newobject("ThemesManager","ThemesManager","ThemedControls.vcx","",.T.)
*!*	With _Screen.ThemesManager
*!*	   .AdditionalThemesXMLFiles = "ThemesMessageBox.xml,ThemesSplitters.xml"
*!*	   .Initialize()
*!*	Endwith
*

Do Form Splash
*!*	Do Form ZoomNavBar
Read Events

Function CloseApplication
   * Destroy ThemesManager object
   If Vartype(_Screen.ThemesManager)=="O"
      _Screen.RemoveObject("ThemesManager")
   Endif
   * Destroy BindWindowsEventsProxy object
   If Type("_vfp.BindWindowsEventsProxy")<>"U"
      _vfp.BindWindowsEventsProxy = Null
   Endif
   * Remove all API libraries from memory
   Set Library To
   *
   On Shutdown
   Clear Events
   If _vfp.StartMode > 0
      Quit
   Endif
   Return
Endfunc