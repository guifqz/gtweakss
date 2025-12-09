Write-Host "INICIANDO PROCESSO DE REBRANDING PARA GTWEAKS..." -ForegroundColor Cyan

$mapaSubstituicao = @{
    "ChrisTitusTech/winutil" = "guifqz/GTweaks"
    "github.com/ChrisTitusTech" = "github.com/guifqz"
    "raw.githubusercontent.com/ChrisTitusTech" = "raw.githubusercontent.com/guifqz"
    "Chris Titus Tech" = "GTweaks"
    "Titus Tech" = "GTweaks"
    "Chris Titus" = "GTweaks Dev"
    "WinUtil" = "GTweaks"
    "CTT" = "GTweaks"
}

$extensoes = @("*.ps1", "*.json", "*.md", "*.xml", "*.xaml", "*.html")
$arquivos = Get-ChildItem -Path . -Recurse -Include $extensoes | Where-Object { $_.Name -ne "Rebrand.ps1" -and $_.FullName -notmatch "\\.git\\" }

$totalAlterados = 0

foreach ($arquivo in $arquivos) {
    $conteudoOriginal = Get-Content -Path $arquivo.FullName -Raw -ErrorAction SilentlyContinue
    if (-not $conteudoOriginal) { continue }

    $conteudoNovo = $conteudoOriginal
    $arquivoAlterado = $false

    foreach ($chave in $mapaSubstituicao.Keys) {
        if ($conteudoNovo -match [regex]::Escape($chave)) {
            $novoValor = $mapaSubstituicao[$chave]
            $conteudoNovo = $conteudoNovo -replace [regex]::Escape($chave), $novoValor
            $arquivoAlterado = $true
            Write-Host "  [ALTERADO] '$chave' -> '$novoValor' em: $($arquivo.Name)" -ForegroundColor Yellow
        }
    }

    if ($arquivoAlterado) {
        Set-Content -Path $arquivo.FullName -Value $conteudoNovo -Encoding UTF8
        $totalAlterados++
    }
}

Write-Host "`n------------------------------------------------"
Write-Host "CONCLUÍDO. Total de arquivos modificados: $totalAlterados"
Write-Host "IMPORTANTE: Agora rode o comando: .\Compile.ps1" -ForegroundColor Red
Write-Host "------------------------------------------------"

