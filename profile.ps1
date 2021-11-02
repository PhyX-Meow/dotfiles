# PowerShell Profile

#region scoop
# enable completion in current shell, use absolute path because PowerShell Core not respect $env:PSModulePath
Import-Module "$($(Get-Item $(Get-Command scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"
# Fast scoop search
Invoke-Expression (&scoop-search --hook)
#endregion

# PSReadline
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key "Ctrl+p" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "Ctrl+n" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key 'Ctrl+d' -Function DeleteCharOrExit
Set-PSReadLineOption -PredictionSource History

# Colorlize
Import-Module Get-ChildItemColor
Import-Module posh-git
Invoke-Expression (oh-my-posh --init --shell pwsh --config ~/gitRepo/dotfiles/pwsh_theme.omp.json)
colortool -q GruvboxDark.itermcolors

# Alias
Function which($cmd) {
	Get-Command -All $cmd
}
Function prc(){
	code "C:\Users\wuli\Documents\Powershell\profile.ps1"
}

# Autojump
Invoke-Expression ($(lua "C:\Users\wuli\scoop\apps\z.lua\current\z.lua" --init powershell enhanced once echo) -join "`n")