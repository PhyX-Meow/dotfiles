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

#`:: RunOrActivate("WindowsTerminal.exe", "wt.exe")

#b:: RunOrActivate("msedge.exe", "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")

#c:: Run "C:\Program Files\Microsoft VS Code\Code.exe"

#m:: Run "C:\Program Files\Wolfram Research\Mathematica\13.1\Mathematica.exe"

#HotIf WinActive("ahk_exe WindowsTerminal.exe")
!Enter:: Send "!^j"
#HotIf