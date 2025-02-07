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

SwitchActivate(name) {
    window := WinExist("ahk_exe" name)
    if window {
        active := WinActive("ahk_id" window)
        if active
            WinMinimize("ahk_id" active)
        else
            WinActivate("ahk_id" window)
    }
    return
}

#`:: RunOrActivate("WindowsTerminal.exe", "wt.exe")

#b:: RunOrActivate("msedge.exe", "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")

#m:: RunOrActivate("Mathematica.exe", "C:\Program Files\Wolfram Research\Wolfram\14.2\WolframNB.exe")

#c:: Run "C:\Program Files\Microsoft VS Code\Code.exe"

#p:: SwitchActivate("X410.exe")

#j:: Run "wt.exe new-tab -p `"Julia in WSL`""

#HotIf WinActive("ahk_exe WindowsTerminal.exe")
!Enter:: Send "!^j"
#HotIf