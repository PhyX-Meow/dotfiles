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
Invoke-Expression (oh-my-posh init pwsh --config ~/gitRepo/dotfiles/pwsh_theme.omp.json)

# Autojump
Invoke-Expression ($(lua "$env:USERPROFILE\scoop\apps\z.lua\current\z.lua" --init powershell enhanced once echo) -join "`n")

# Env
# $env:JULIA_PKG_SERVER = 'https://mirrors.tuna.tsinghua.edu.cn/julia'

# Alias
# Set-Alias 'mamba' 'micromamba'
Set-Alias 'ls' 'eza_ls'
Set-Alias 'l' 'eza_l'
Set-Alias 'll' 'eza_ll'

Function which {
	Get-Command -All $args
}
Function prc {
	# code "%USERPROFILE%\Documents\Powershell\profile.ps1"
	code "%USERPROFILE%\gitRepo\dotfiles\profile.ps1"
}
Function ytdl {
	# yt-dlp --downloader aria2c --proxy http://127.0.0.1:8128/ --js-runtimes node $args
	yt-dlp --downloader aria2c --js-runtimes node $args
}
function eza_ls {
	eza --icons --group-directories-first --time-style=long-iso
}
function eza_l {
	eza --long --icons --git --group-directories-first --time-style=long-iso
}
function eza_ll {
	eza --long --all --icons --git --header --group-directories-first --time-style=long-iso -I 'ntuser.*|NTUSER.*'
}