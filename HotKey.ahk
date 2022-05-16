#SingleInstance force
SetWinDelay 0
; DetectHiddenWindows, on

RunOrActivate(name, command) {
    window := WinExist("ahk_exe" name)
    if window {
        active := WinActive("ahk_id" window)
        if active
            WinMinimize("ahk_id" active)
        else
            WinActivate("ahk_id" window)
    } else
        Run command
    return
}

<<<<<<< HEAD
#b::Run, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
Return
=======
#`:: RunOrActivate("WindowsTerminal.exe", "wt.exe")
>>>>>>> main

#b:: RunOrActivate("msedge.exe", "C:\Program Files (x86)\Microsoft\Edge Beta\Application\msedge.exe")

<<<<<<< HEAD
#m::Run, "C:\Program Files\Wolfram Research\Mathematica\13.0\Mathematica.exe"
Return

#IfWinActive ahk_exe WindowsTerminal.exe
{
	!Enter::!^j
}
=======
#c:: Run "C:\Program Files\Microsoft VS Code\Code.exe"

#m:: Run "C:\Program Files\Wolfram Research\Mathematica\13.0\Mathematica.exe"

#HotIf WinActive("ahk_exe WindowsTerminal.exe")
!Enter:: Send "!^j"
#HotIf
>>>>>>> main
