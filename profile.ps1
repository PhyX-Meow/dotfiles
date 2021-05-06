# PowerShell Profile

#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& "C:\Users\wuli\miniconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion

Import-Module posh-git
Import-Module oh-my-posh
# Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key "Ctrl+p" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "Ctrl+n" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key 'Ctrl+d' -Function DeleteCharOrExit
Set-PSReadLineOption -PredictionSource History

#region scoop
# enable completion in current shell, use absolute path because PowerShell Core not respect $env:PSModulePath
Import-Module "$($(Get-Item $(Get-Command scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"
# Fast scoop search
Invoke-Expression (&scoop-search --hook)
#endregion

# Color Theme
Set-PoshPrompt -Theme powerlevel10k_rainbow
colortool -q GruvboxDark.itermcolors

# Alias
Function which($cmd) {
	Get-Command -All $cmd
}
Function pyup {
	pip install --upgrade you-get youtube-dl pynvim
}
Function pycc {
	Remove-Item "C:\Users\wuli\AppData\Local\pip\cache\http\*"
	Remove-Item	"C:\Users\wuli\AppData\Local\pip\cache\wheels\*"
}

# Autojump
Invoke-Expression ($(lua "C:\Users\wuli\scoop\apps\z.lua\current\z.lua" --init powershell enhanced once echo) -join "`n")