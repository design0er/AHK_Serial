;  Mapping application shortcut use `Left Win + Numpad N`
; - combine with left win+1/2/3, leave them to most used app
; - it's hard to use win+4/5/6...
; - it's not readable for which is win+9/0
; - it's inefficient use alt+tab when 5+ exe live in desktop
; - so we need more mapping shortcut for exe
; - win+numpad is good for this sence
; - hit win+numpad N, find the right window by ahk_class
; 	- if not exist, start the exe directly.
; author: design0er@gmail.com
; earliest developed on 2014-02.
#InstallKeybdHook
SetTitleMatchMode RegEx
IfExist, apply.ico
{
	Menu TRAY, Icon, arrow-down-2.ico
}
FindAndActive(someClass,path,max)
{
	s  = ahk_class %someClass%
	if WinExist(s)
	{
		WinActivate
		if(max)
			WinMaximize
	}
	else {
	  run %path%
	}
	return
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; num 0: totalcmd: C:\totalcmd\TOTALCMD64.EXE
; num 1: chrome
; num 2: cmder: D:\program_h\cmder1_3_8\vendor\conemu-maximus5\ConEmu64.exe
; num 3: firefox: C:\Program Files\Mozilla Firefox\firefox.exe
; num 4: emacs : C:\pro_some\emacs-26.1-x86_64\bin\emacs.exe
; num 5: ssms: HwndWrapper:  
; num 6: PROCEXPL: C:\pro_some\SysinternalsSuite\procexp64.exe
; num 7: WFS_Frame :win file manager: C:\pro_some\Winfile_v10.0.1806.1\x64\Winfile.exe
; num 8: everything: "C:\Program Files\Everything\Everything.exe"
; num 9: YodaoMainWndClass: D:\program_h\Youdao\Dict\YoudaoDict.exe
; 

; remark:
; - chrome complict with vscode insider, same as chromium wrapper appliation.
; - if use this script, leave win+1/2/3/4 to the most useful shortcut


;;;numpad shortcut
; 启用		关闭
; Numpad0	NumpadIns
; Numpad1 	NumpadEnd
; Numpad2 	NumpadDown
; Numpad3 	NumpadPgDn
; Numpad4 	NumpadLeft
; Numpad5 	NumpadClear
; Numpad6 	NumpadRight
; Numpad7 	NumpadHome
; Numpad8 	NumpadUp
; Numpad9 	NumpadPgUp
; NumpadDot (.)  NumpadDel
; NumpadDiv (/) NumpadDiv (/)
; NumpadMult (*) NumpadMult (*)
; NumpadAdd (+) NumpadAdd (+)
; NumpadSub (-) NumpadSub (-)
; NumpadEnter NumpadEnter

;totalCMD
<#Numpad0::
FindAndActive("TTOTAL_CMD","C:\totalcmd\TOTALCMD64.EXE",1)
return

;Chrome
<#Numpad1::
FindAndActive("Chrome_WidgetWin*","C:\Program Files (x86)\Google\Chrome\Application\chrome.exe",1)
return

;cmder: D:\program_h\cmder1_3_8\vendor\conemu-maximus5\ConEmu64.exe
<#Numpad2::
FindAndActive("VirtualConsoleClass","D:\program_h\cmder1_3_8\vendor\conemu-maximus5\ConEmu64.exe",0)
return

;firefox
<#Numpad3::
FindAndActive("MozillaWindowClass","C:\Program Files (x86)\Mozilla Firefox\firefox.exe",1)
return

;emacs
<#Numpad4::
if WinExist("ahk_class Emacs")
{
	WinActivate
	WinMaximize
}
;do not start emacs.exe directly
;FindAndActive("Emacs","C:\pro\emacs-bin-w64-24.4\emacs\bin\emacs.exe")
return

;ssms
<#Numpad5::
FindAndActive("HwndWrapper","ssms.exe",1)
return

;process hacker
<#Numpad6::
FindAndActive(" PROCEXPL","C:\pro_some\SysinternalsSuite\procexp64.exe",1)
return

;<#Numpad6::
;if WinExist("系统属性")
;{
;WinActivate
;}
;else
;{
;run "SystemPropertiesAdvanced.exe"
;}
;return

;WFS_Frame :win file manager: C:\pro_some\Winfile_v10.0.1806.1\x64\Winfile.exe
<#Numpad7::
FindAndActive("WFS_Frame","C:\pro_some\Winfile_v10.0.1806.1\x64\Winfile.exe")
return

<#Numpad8::
FindAndActive("everything","C:\Program Files\Everything\Everything.exe")
return

<#Numpad9::
FindAndActive("YodaoMainWndClass","D:\program_h\Youdao\Dict\YoudaoDict.exe")
return