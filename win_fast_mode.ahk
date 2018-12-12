;;; ---------------------- info
;;; to simpliy operation like scroll page, compose key in Windows OS
;;; set global mode, like vim mode-editting `ESC`
;;; most time, we just scroll page, alt-tab
;;; be simple,but highly customizable
;;; design0er@gmail.com 2018-11

;;; ---------------------- roadmap
;;; - alttab: emacs like buffer list, reg search input string,for fast switch
;;; - fast launch : search input for a pre defined list to launche app/url/file
;;; - N multi operate: vim like prefix operate, '3j' for 'j j j'
;;; - leader key: if 26 alphabet + 10 number is not enough. consider leader key.

;;; ---------------------- dev & design
;;; - In the light of:
;;; 	- vim / emacs / spaceamcs
;;;		- AquaSnap
;;;		- HashTWM
;;;		- Divvy
;;;		- bug.n




;;; - what should this script do?
;;; 	- think what is most used ?
;;; 	- what is needed?

#InstallKeybdHook
#Persistent
SetTitleMatchMode RegEx
IfExist, app_list.ico
{
	Menu TRAY, Icon, app_list.ico
}
FastModeState := 0
ToggleFastMode(){
	global FastModeState
	if FastModeState = 0
	{
		FastModeState := 1
		Tooltip, 'dive into fast mode'
		BeginFastMode()
	}
	else
	{
		FastModeState :=0
		Tooltip, 'Return Normal'
	}
	return
}
ScrollLock::ToggleFastMode()
;left ctrl + `
>!`::ToggleFastMode()
InjectKeyForFast(key,func){
	global FastModeState
	if FastModeState = 1
	{
		Send %func%
	}
	else{
		Send {w Up}
		Send {w Down}
	}
	return
}
BeginFastMode(){
	global FastModeState
	loop{
		if FastModeState = 0
		{
			Tooltip, "mode = 0. return"
			return
		}
		else{
			Input, OneKey,I L1,q
			Tooltip, " get input " . %OneKey%

			if OneKey = k
			{
				Send {Up}
			}
			else if OneKey = j
			{
				Send {Down}
			}
			else if OneKey = h
			{
				Send {Left}
			}
			else if OneKey = l
			{
				Send {Right}
			}
			; b for window switch
			; create a list UI
			; input number for order
			; input string for search
			else if OneKey = b
			{
				Send {Alt down}
				Send {Tab}
				Input, SecKey,I L1,q
				if SecKey = h
				{
					Send {Up}
				}
				else if SecKey = l
				{
					Send {Down}
				}
				Send {Alt Up}

			}
			;z : hide
			else if OneKey = z
			{
				WinHide  
			}
			;x : max
			else if OneKey = x
			{
				WinKill 
			}
			; c : windowed
			else if OneKey = c
			{
				WinRestore 
			}
			; v : v layout
			else if OneKey = v
			{
				WinMaximize
			}
			; s : s layout
			else if OneKey = s
			{
				Send,{PgDn}
			}
			else if OneKey = w
			{
				Send {PgUp}
			}
			else if OneKey = enter
			{
				FastModeState := 0
			}
			else
			{
				Tooltip, "get else .send raw input" 
				Send %OneKey%
			}
			If InStr(ErrorLevel, "EndKey:")
			{
			    Tooltip, You entered "%UserInput%" and terminated the input with %ErrorLevel%.
				Break
			}
		}
	}
	Tooltip, "exit loop"
	return
}
;;; cannot directly register key event
;;; it will cause loop
;;; use `input` instead
