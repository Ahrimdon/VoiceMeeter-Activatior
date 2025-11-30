function Show-Menu {
    Clear-Host
    Write-Host "1. Add registry key"
    Write-Host "2. Remove registry key"
    Write-Host "3. Exit/Cancel"
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        1 {
            New-ItemProperty -Path "HKCU:\VB-Audio\VoiceMeeter" -Name "code" -PropertyType DWord -Value 0x00123456 -Force
            Write-Host "Activation complete"
            Pause
        }
        2 {
            Remove-ItemProperty -Path "HKCU:\VB-Audio\VoiceMeeter" -Name "code" -ErrorAction SilentlyContinue
            Write-Host "Deactivation complete"
            Pause
        }
        3 {
            Write-Host "Exiting..."
            break
        }
        Default {
            Write-Host "Invalid choice. Please try again."
            Pause
        }
    }
} while ($choice -ne 3)