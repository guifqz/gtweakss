function Invoke-WPFButton {

    <#

    .SYNOPSIS
        Invokes the function associated with the clicked button

    .PARAMETER Button
        The name of the button that was clicked

    #>

    Param ([string]$Button)

    # Use this to get the name of the button
    #[System.Windows.MessageBox]::Show("$Button","GTweaks's Windows Utility","OK","Info")
    if (-not $sync.ProcessRunning) {
        Set-GTweaksProgressBar  -label "" -percent 0
    }

    Switch -Wildcard ($Button) {
        "WPFTab?BT" {Invoke-WPFTab $Button}
        "WPFInstall" {Invoke-WPFInstall}
        "WPFUninstall" {Invoke-WPFUnInstall}
        "WPFInstallUpgrade" {Invoke-WPFInstallUpgrade}
        "WPFStandard" {Invoke-WPFPresets "Standard" -checkboxfilterpattern "WPFTweak*"}
        "WPFMinimal" {Invoke-WPFPresets "Minimal" -checkboxfilterpattern "WPFTweak*"}
        "WPFClearTweaksSelection" {Invoke-WPFPresets -imported $true -checkboxfilterpattern "WPFTweak*"}
        "WPFClearInstallSelection" {Invoke-WPFPresets -imported $true -checkboxfilterpattern "WPFInstall*"}
        "WPFtweaksbutton" {Invoke-WPFtweaksbutton}
        "WPFOOSUbutton" {Invoke-WPFOOSU}
        "WPFAddUltPerf" {Invoke-WPFUltimatePerformance -State "Enable"}
        "WPFRemoveUltPerf" {Invoke-WPFUltimatePerformance -State "Disable"}
        "WPFundoall" {Invoke-WPFundoall}
        "WPFFeatureInstall" {Invoke-WPFFeatureInstall}
        "WPFPanelDISM" {Invoke-WPFSystemRepair}
        "WPFPanelAutologin" {Invoke-WPFPanelAutologin}
        "WPFPanelComputer" {Invoke-WPFControlPanel -Panel $button}
        "WPFPanelControl" {Invoke-WPFControlPanel -Panel $button}
        "WPFPanelNetwork" {Invoke-WPFControlPanel -Panel $button}
        "WPFPanelPower" {Invoke-WPFControlPanel -Panel $button}
        "WPFPanelPrinter" {Invoke-WPFControlPanel -Panel $button}
        "WPFPanelRegion" {Invoke-WPFControlPanel -Panel $button}
        "WPFPanelRestore" {Invoke-WPFControlPanel -Panel $button}
        "WPFPanelSound" {Invoke-WPFControlPanel -Panel $button}
        "WPFPanelSystem" {Invoke-WPFControlPanel -Panel $button}
        "WPFPanelTimedate" {Invoke-WPFControlPanel -Panel $button}
        "WPFPanelUser" {Invoke-WPFControlPanel -Panel $button}
        "WPFUpdatesdefault" {Invoke-WPFUpdatesdefault}
        "WPFFixesUpdate" {Invoke-WPFFixesUpdate}
        "WPFFixesWinget" {Invoke-WPFFixesWinget}
        "WPFRunAdobeCCCleanerTool" {Invoke-WPFRunAdobeCCCleanerTool}
        "WPFFixesNetwork" {Invoke-WPFFixesNetwork}
        "WPFUpdatesdisable" {Invoke-WPFUpdatesdisable}
        "WPFUpdatessecurity" {Invoke-WPFUpdatessecurity}
        "WPFGTweaksShortcut" {Invoke-WPFShortcut -ShortcutToAdd "GTweaks" -RunAsAdmin $true}
        "WPFGetInstalled" {Invoke-WPFGetInstalled -CheckBox "winget"}
        "WPFGetInstalledTweaks" {Invoke-WPFGetInstalled -CheckBox "tweaks"}
        "WPFGetIso" {Invoke-MicrowinGetIso}
        "WPFMicrowin" {Invoke-Microwin}
        "WPFCloseButton" {Invoke-WPFCloseButton}
        "MicrowinScratchDirBT" {Invoke-ScratchDialog}
        "WPFGTweaksInstallPSProfile" {Invoke-GTweaksInstallPSProfile}
        "WPFGTweaksUninstallPSProfile" {Invoke-GTweaksUninstallPSProfile}
        "WPFGTweaksSSHServer" {Invoke-WPFSSHServer}
        "WPFselectedAppsButton" {$sync.selectedAppsPopup.IsOpen = -not $sync.selectedAppsPopup.IsOpen}
        "WPFMicrowinPanelBack" {Toggle-MicrowinPanel 1}
        "MicrowinAutoConfigBtn" {Invoke-AutoConfigDialog}
    }
}


