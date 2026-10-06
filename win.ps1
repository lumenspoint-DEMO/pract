$base = "https://raw.githubusercontent.com/lumenspoint-DEMO/pract/main"
$dest = Join-Path ([Environment]::GetFolderPath("Desktop")) "pract-docs"

New-Item -ItemType Directory -Force -Path $dest | Out-Null
Write-Host "Creating folder: $dest"

$list = (Invoke-RestMethod "$base/files.txt") -split "`n"
foreach ($f in $list) {
    $f = $f.Trim()
    if ($f -eq "") { continue }
    try {
        Invoke-WebRequest "$base/docs/$f" -OutFile (Join-Path $dest $f)
        Write-Host "OK: $f"
    } catch {
        Write-Host "FAILED: $f"
    }
}

Write-Host "Done! Files saved to: $dest"
