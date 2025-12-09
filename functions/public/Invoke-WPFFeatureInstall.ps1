function Invoke-WPFFeatureInstall {
    <#

    .SYNOPSIS
        Installs selected Windows Features

    #>

    if($sync.ProcessRunning) {
        $msg = "[Invoke-WPFFeatureInstall] Install process is currently running."
        [System.Windows.MessageBox]::Show($msg, "GTweaks", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
        return
    }

    $Features = (Get-GTweaksCheckBoxes)["WPFFeature"]

    Invoke-WPFRunspace -ArgumentList $Features -DebugPreference $DebugPreference -ScriptBlock {
        param($Features, $DebugPreference)
        $sync.ProcessRunning = $true
        if ($Features.count -eq 1) {
            $sync.form.Dispatcher.Invoke([action]{ Set-GTweaksTaskbaritem -state "Indeterminate" -value 0.01 -overlay "logo" })
        } else {
            $sync.form.Dispatcher.Invoke([action]{ Set-GTweaksTaskbaritem -state "Normal" -value 0.01 -overlay "logo" })
        }

        Invoke-GTweaksFeatureInstall $Features

        $sync.ProcessRunning = $false
        $sync.form.Dispatcher.Invoke([action]{ Set-GTweaksTaskbaritem -state "None" -overlay "checkmark" })

        Write-Host "==================================="
        Write-Host "---   Features are Installed    ---"
        Write-Host "---  A Reboot may be required   ---"
        Write-Host "==================================="
    }
}


