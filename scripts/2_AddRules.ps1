$ProgramPath = "C:\Program Files (x86)\VB\Voicemeeter\"
$RuleName = "Voicemeeter Block Rule"

# Check if the firewall rule already exists
$ExistingRule = Get-NetFirewallRule | Where-Object {$_.DisplayName -eq $RuleName}

if ($ExistingRule) {
    Write-Host "The rule '$RuleName' already exists. Skipping creation."
} else {
    # Get all .exe files in the specified directory
    $Executables = Get-ChildItem -Path $ProgramPath -Filter *.exe

    # Loop through each executable and create a firewall rule for it
    foreach ($exe in $Executables) {
        Write-Host "Creating rule to block $($exe.FullName)"
        New-NetFirewallRule -DisplayName "$RuleName - $($exe.Name)" -Direction Outbound -Action Block -Program $exe.FullName
    }
    Write-Host "Firewall rule(s) created successfully."
}
