$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
& (Join-Path $PSScriptRoot "build.ps1")

$classesDir = Join-Path $projectRoot "build\classes"
$classpath = @(
    $classesDir
    Join-Path $projectRoot "lib\mysql-connector-j-8.0.32.jar"
    Join-Path $projectRoot "lib\jcalendar-1.4.jar"
    Join-Path $projectRoot "lib\AbsoluteLayout.jar"
) -join ";"

$dbUrl = if ($env:BLH_DB_URL) { $env:BLH_DB_URL } else { "jdbc:mysql://localhost:3306/betterlifehospital?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC" }
$dbUser = if ($env:BLH_DB_USER) { $env:BLH_DB_USER } else { "root" }
$dbPassword = if ($env:BLH_DB_PASSWORD) { $env:BLH_DB_PASSWORD } else { "root" }

& java "-Ddb.url=$dbUrl" "-Ddb.user=$dbUser" "-Ddb.password=$dbPassword" -cp $classpath Login
