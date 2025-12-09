Function Show-GTweaksLogo {
    <#
        .SYNOPSIS
            Displays the GTweaks logo in ASCII art.
        .DESCRIPTION
            This function displays the GTweaks logo in ASCII art format.
        .PARAMETER None
            No parameters are required for this function.
        .EXAMPLE
            Show-GTweaksLogo
            Prints the GTweaks logo in ASCII art format to the console.
    #>

    $asciiArt = @"
    CCCCCCCCCCCCGTweaksTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
 CCC::::::::::::CT:::::::::::::::::::::TT:::::::::::::::::::::T
CC:::::::::::::::CT:::::::::::::::::::::TT:::::::::::::::::::::T
C:::::CCCCCCCC::::CT:::::TT:::::::TT:::::TT:::::TT:::::::TT:::::T
C:::::C       CCCCCGTweaksTTTT  T:::::T  TTTTTTTTTTTT  T:::::T  TTTTTT
C:::::C                     T:::::T                T:::::T
C:::::C                     T:::::T                T:::::T
C:::::C                     T:::::T                T:::::T
C:::::C                     T:::::T                T:::::T
C:::::C                     T:::::T                T:::::T
C:::::C                     T:::::T                T:::::T
C:::::C       CCCCCC        T:::::T                T:::::T
C:::::CCCCCCCC::::C      TT:::::::TT            TT:::::::TT
CC:::::::::::::::C       T:::::::::T            T:::::::::T
CCC::::::::::::C         T:::::::::T            T:::::::::T
  CCCCCCCCCCCCC          TTTTTTTTTTT            TTTTTTTTTTT

====GTweaks=====
=====Windows Toolbox=====
"@

    Write-Host $asciiArt
}


