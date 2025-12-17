$ErrorActionPreference = "Stop"

# Add MiKTeX to PATH for this session
$miktexPath = "C:\miktex-portable\texmfs\install\miktex\bin\x64"
if (Test-Path $miktexPath) {
    $env:PATH = "$miktexPath;$env:PATH"
    Write-Host "Added MiKTeX to PATH: $miktexPath"
}
else {
    Write-Warning "MiKTeX path not found: $miktexPath"
}

function Check-Command($cmd) {
    if (-not (Get-Command $cmd -ErrorAction SilentlyContinue)) {
        Write-Error "Command '$cmd' not found. Please ensure MiKTeX/TeXLive is installed and in PATH."
        exit 1
    }
}

Check-Command "lualatex"

$main = "main"

Write-Host "Building $main.tex with LuaLaTeX..."

# Clean auxiliary files
Remove-Item -Path "*.aux", "*.log", "*.toc", "*.out", "*.pdf" -ErrorAction SilentlyContinue

# First Pass
Write-Host "Pass 1: LuaLaTeX..."
lualatex --interaction=nonstopmode --halt-on-error $main.tex

# Bibliography (if needed, currently assuming no bibliography check or check if .bcf exists)
if (Test-Path "$main.bcf") {
    Write-Host "Running Biber..."
    if (Get-Command "biber" -ErrorAction SilentlyContinue) {
        biber $main
    }
    else {
        Write-Warning "Biber not found, skipping bibliography generation."
    }
}

# Second Pass
Write-Host "Pass 2: LuaLaTeX (resolving references)..."
lualatex --interaction=nonstopmode --halt-on-error $main.tex

# Third Pass (to ensure correct page numbers and toc)
Write-Host "Pass 3: LuaLaTeX (finalizing)..."
lualatex --interaction=nonstopmode --halt-on-error $main.tex

Write-Host "Build Complete!"
