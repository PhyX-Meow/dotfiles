#NoEnv
#SingleInstance force
SendMode Input
; DetectHiddenWindows, on
SetWinDelay 0

; SwitchToWindowsTerminal()
; {
;     windowHandleId := WinExist("ahk_exe WindowsTerminal.exe")
;     windowExistsAlready := windowHandleId > 0

;     ; If the Windows Terminal is already open, determine if we should put it in focus or minimize it.
;     if (windowExistsAlready = true)
;     {
;         activeWindowHandleId := WinExist("A")
;         windowIsAlreadyActive := activeWindowHandleId == windowHandleId

;         if (windowIsAlreadyActive)
;         {
;             ; Minimize the window.
;             WinMinimize, "ahk_id %windowHandleId%"
;         }
;         else
;         {
;             ; Put the window in focus.
;             WinActivate, "ahk_id %windowHandleId%"
;             WinShow, "ahk_id %windowHandleId%"
;         }
;     }
;     ; Else it's not already open, so launch it.
;     else
;     {
;         Run, wt
;     }
; }
; ; Hotkey to use Win+` to launch/restore the Windows Terminal.
; #`::SwitchToWindowsTerminal()

#`::
    terminal := WinExist("ahk_exe WindowsTerminal.exe")
    if (terminal) 
    {
        active := WinActive("ahk_id " terminal)
        if (active)
            WinMinimize, ahk_id %active%
        else
            WinActivate, ahk_id %terminal%
    }
    else
        Run, wt.exe
Return

#b::Run, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
Return

#c::Run, "C:\Program Files\Microsoft VS Code\Code.exe"
Return

#m::Run, "C:\Program Files\Wolfram Research\Mathematica\12.3\Mathematica.exe"
Return
