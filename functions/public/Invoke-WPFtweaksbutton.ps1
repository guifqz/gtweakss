function Invoke-WPFtweaksbutton {
  <#

    .SYNOPSIS
        Invokes the functions associated with each group of checkboxes

  #>

  if($sync.ProcessRunning) {
    $msg = "[Invoke-WPFtweaksbutton] Install process is currently running."
    [System.Windows.MessageBox]::Show($msg, "GTweaks", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
    return
  }

  $Tweaks = (Get-GTweaksCheckBoxes)["WPFTweaks"]

  Set-GTweaksDNS -DNSProvider $sync["WPFchangedns"].text

  if ($tweaks.count -eq 0 -and  $sync["WPFchangedns"].text -eq "Default") {
    $msg = "Please check the tweaks you wish to perform."
    [System.Windows.MessageBox]::Show($msg, "GTweaks", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
    return
  }

  Write-Debug "Number of tweaks to process: $($Tweaks.Count)"

  # The leading "," in the ParameterList is necessary because we only provide one argument and powershell cannot be convinced that we want a nested loop with only one argument otherwise
  Invoke-WPFRunspace -ParameterList @(,("tweaks",$tweaks)) -DebugPreference $DebugPreference -ScriptBlock {
    param(
      $tweaks,
      $DebugPreference
      )
    Write-Debug "Inside Number of tweaks to process: $($Tweaks.Count)"

    $sync.ProcessRunning = $true

    if ($Tweaks.count -eq 1) {
        $sync.form.Dispatcher.Invoke([action]{ Set-GTweaksTaskbaritem -state "Indeterminate" -value 0.01 -overlay "logo" })
    } else {
        $sync.form.Dispatcher.Invoke([action]{ Set-GTweaksTaskbaritem -state "Normal" -value 0.01 -overlay "logo" })
    }
    # Execute other selected tweaks

    for ($i = 0; $i -lt $Tweaks.Count; $i++) {
      Set-GTweaksProgressBar -Label "Applying $($tweaks[$i])" -Percent ($i / $tweaks.Count * 100)
      Invoke-GTweaksTweaks $tweaks[$i]
      $sync.form.Dispatcher.Invoke([action]{ Set-GTweaksTaskbaritem -value ($i/$Tweaks.Count) })
    }
    Set-GTweaksProgressBar -Label "Tweaks finished" -Percent 100
    $sync.ProcessRunning = $false
    $sync.form.Dispatcher.Invoke([action]{ Set-GTweaksTaskbaritem -state "None" -overlay "checkmark" })
    Write-Host "================================="
    Write-Host "--     Tweaks are Finished    ---"
    Write-Host "================================="

    # $ButtonType = [System.Windows.MessageBoxButton]::OK
    # $MessageboxTitle = "Tweaks are Finished "
    # $Messageboxbody = ("Done")
    # $MessageIcon = [System.Windows.MessageBoxImage]::Information
    # [System.Windows.MessageBox]::Show($Messageboxbody, $MessageboxTitle, $ButtonType, $MessageIcon)
  }
}


