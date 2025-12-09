function Invoke-WPFundoall {
    <#

    .SYNOPSIS
        Undoes every selected tweak

    #>

    if($sync.ProcessRunning) {
        $msg = "[Invoke-WPFundoall] Install process is currently running."
        [System.Windows.MessageBox]::Show($msg, "GTweaks", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
        return
    }

    $tweaks = (Get-GTweaksCheckBoxes)["WPFtweaks"]

    if ($tweaks.count -eq 0) {
        $msg = "Please check the tweaks you wish to undo."
        [System.Windows.MessageBox]::Show($msg, "GTweaks", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
        return
    }

    Invoke-WPFRunspace -ArgumentList $tweaks -DebugPreference $DebugPreference -ScriptBlock {
        param($tweaks, $DebugPreference)

        $sync.ProcessRunning = $true
        if ($tweaks.count -eq 1) {
            $sync.form.Dispatcher.Invoke([action]{ Set-GTweaksTaskbaritem -state "Indeterminate" -value 0.01 -overlay "logo" })
        } else {
            $sync.form.Dispatcher.Invoke([action]{ Set-GTweaksTaskbaritem -state "Normal" -value 0.01 -overlay "logo" })
        }


        for ($i = 0; $i -lt $tweaks.Count; $i++) {
            Set-GTweaksProgressBar -Label "Undoing $($tweaks[$i])" -Percent ($i / $tweaks.Count * 100)
            Invoke-GTweakstweaks $tweaks[$i] -undo $true
            $sync.form.Dispatcher.Invoke([action]{ Set-GTweaksTaskbaritem -value ($i/$tweaks.Count) })
        }

        Set-GTweaksProgressBar -Label "Undo Tweaks Finished" -Percent 100
        $sync.ProcessRunning = $false
        $sync.form.Dispatcher.Invoke([action]{ Set-GTweaksTaskbaritem -state "None" -overlay "checkmark" })
        Write-Host "=================================="
        Write-Host "---  Undo Tweaks are Finished  ---"
        Write-Host "=================================="

    }
}


