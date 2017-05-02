Function apiGetCurrentThemeName
   Lparameters stringThemeName, lengthThemeName, stringColorName, lengthColorName, stringSizeName, lengthSizeName
   Declare Integer GetCurrentThemeName In uxtheme As apiGetCurrentThemeName ;
      String @ stringThemeName, ;
      Integer lengthThemeName, ;
      String @ stringColorName, ;
      Integer lengthColorName, ;
      String @ stringSizeName, ;
      Integer lengthSizeName
   Return apiGetCurrentThemeName(@m.stringThemeName, m.lengthThemeName, @m.stringColorName, m.lengthColorName, @m.stringSizeName, lengthSizeName)
Endfunc

Function apiUpdateLayeredWindow
   Lparameters HWnd, hdcDst, pptDst, psize, hdcSrc, pprSrc, crKey, pblend, dwFlags
   Declare Integer UpdateLayeredWindow In User32 As apiUpdateLayeredWindow ;
      Integer HWnd, ;
      Integer hdcDst, ;
      String @ pptDst, ;
      String @ psize, ;
      Integer hdcSrc, ;
      String @ pprSrc, ;
      Integer crKey, ;
      String @ pblend, ;
      Integer dwFlags
   Return apiUpdateLayeredWindow(m.HWnd, m.hdcDst, @m.pptDst, @m.psize, m.hdcSrc, @m.pprSrc, m.crKey, @m.pblend, m.dwFlags)
Endfunc

Function apiDeleteDC
   Lparameters hDC
   Declare Integer DeleteDC In Gdi32 As apiDeleteDC ;
      Integer hDC
   Return apiDeleteDC(m.hDC)
Endfunc

Function apiReleaseCapture
   Declare Long ReleaseCapture In WIN32API As apiReleaseCapture
   Return apiReleaseCapture()
Endfunc

Function apiSleep
   Lparameters lnMiliseconds
   Declare Integer Sleep In Win32API As apiSleep ;
      Integer lnMiliseconds
   Return apiSleep(m.lnMiliseconds)
Endfunc

Function apiSetLayeredWindowAttributes
   Lparameters HWnd, crKey, bAlpha, dwFlags
   Declare Integer SetLayeredWindowAttributes In user32 As apiSetLayeredWindowAttributes ;
      Integer HWnd, ;
      Integer crKey, ;
      Short bAlpha, ;
      Integer dwFlags
   Return apiSetLayeredWindowAttributes(m.HWnd, m.crKey, m.bAlpha, m.dwFlags)
Endfunc

*!*	Function apiAnimateWindow
*!*	   Lparameters HWnd, dwTime, dwFlags
*!*	   Declare Integer AnimateWindow In User32 As apiAnimateWindow ;
*!*	      Integer HWnd, ;
*!*	      Integer dwTime, ;
*!*	      Integer dwFlags
*!*	   Return apiAnimateWindow(m.HWnd, m.dwTime, m.dwFlags)
*!*	Endfunc