$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$classesDir = Join-Path $projectRoot "build\classes"
$libDir = Join-Path $projectRoot "lib"
$classpath = @(
    Join-Path $libDir "mysql-connector-j-8.0.32.jar"
    Join-Path $libDir "jcalendar-1.4.jar"
    Join-Path $libDir "AbsoluteLayout.jar"
) -join ";"

New-Item -ItemType Directory -Force -Path $classesDir | Out-Null

$sources = Get-ChildItem -Path (Join-Path $projectRoot "src") -Filter "*.java" | ForEach-Object { $_.FullName }
& javac -encoding UTF-8 -cp $classpath -d $classesDir $sources
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

Get-ChildItem -Path (Join-Path $projectRoot "src") -Include *.png,*.jpg,*.jpeg,*.gif,*.form -File | ForEach-Object {
    Copy-Item -LiteralPath $_.FullName -Destination $classesDir -Force
}

Write-Host "Build complete: $classesDir"
