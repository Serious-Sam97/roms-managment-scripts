#Script to filter roms and add to a separated folder

$removeFolder = ".\Remove"

if (-not (Test-Path $removeFolder)) {
    New-Item -ItemType Directory -Path $removeFolder | Out-Null
}

Get-ChildItem -File | Where-Object { 
    ($_.Name -match 'Europe') -and ($_.Name -notmatch 'USA|World')
} | ForEach-Object {
    Move-Item $_.FullName -Destination $removeFolder
}

