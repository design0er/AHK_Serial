#InstallKeybdHook
SetTitleMatchMode RegEx
IfExist, apply.ico
{
	Menu TRAY, Icon, arrow-down-2.ico
}
;---------------------------------
;win
;---------------------------------
;system default
;#e
;#r
;#t
;#u
;#p
;#d
;#l
;#f replaced
;#m
;#b
;app setting
;#s
;#o
;#i
;left win
<#w::WinMaximize A
<#a::WinRestore A
<#c::WinMinimize A
<#u::WinClose A
<#z::WinClose A

;;;;macro

;^!s::  ; Control+Alt+S
;;ahk_class UnityWndClass
;IfWinNotExist Fallout Shelter
;    return  ;
;WinActivate  ; 
;Loop, 10
;{
;	Send {Click}
;}
;return  ;

;<#`::Send, {Numlock}
;<#`::ToggleCapsLock()
;<#z::Send,{PgDn}
;<#x::Send,{PgUp}
;<#q::Send,{PgUp}
<#y::
;<#i::ToggleCapsLock()
;<#f::ToggleCapsLock()
;<#g::ToggleCapsLock()
;<#h::ToggleCapsLock()
<#j::Send,{PgDn}
<#k::Send,{PgUp}
<#n::Send,{^Tab}
<#m::Send,{^+Tab}
<#0::AltTab
<#9::ShiftAltTab
<#v::ToggleCapsLock()

;alt
!z::WinClose A
!Escape:: Send !{F4}
; !1::Send {PgUp}
; !2::Send {PgDn}
RAlt & RWin::AltTab
RAlt & AppsKey::ShiftAltTab

;;page up & down emacs style
;left ctrl
^v::Send,{PgDn}
;left alt
<!v::Send,{PgUp}

;right alt
>!-::ShiftAltTab
>!=::AltTab
>![::Send,{PgDn}
>!]::Send,{PgUp}
>!'::Send,{WheelUp}
>!;::Send,{WheelDown}
;control
>^Delete::WinClose A
>^Insert::WinRestore A
>^Home::WinMaximize A
>^End::WinMinimize A
>^PgUp::^+Tab
>^PgDn::^Tab
; >^PgUp::Send {Ctrl Shift Tab}
; >^PgDn::Send {Ctrl Tab}

RWin::WheelDown
AppsKey::WheelUp
;RAlt::Send {Click 2}
;RCtrl UP:: Send {Click}
;RCtrl::LButton

;^`::Send {HOME}+{END}
XButton1::Send {Click 2}
XButton2::MButton

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;user register instead ahk
;Space::Control
;CapsLock::Space

;1 CAPSLOCK  2 NUMLOCK
ToggleCapsLock()
{
	if GetKeyState("CapsLock", "T") = 1
		SetCapsLockState Off
	else if GetKeyState("CapsLock", "T") = 0
		SetCapsLockState On
}

;1 is space   && 0 is left ctrl
;dont work
Is_Space(){
		return is_space_ctrl
	}