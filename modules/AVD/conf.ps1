$connectTestResult = Test-NetConnection -ComputerName storageacdcruz.file.core.windows.net -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Save the password so the drive will persist on reboot
    cmd.exe /C "cmdkey /add:`"storageacdcruz.file.core.windows.net`" /user:`"localhost\storageacdcruz`" /pass:`"HgNN5B2eeRrN1ubD5uze2w7BvzLIvAh9dHz8KW0Y3MsMifzhPb1fFElhkBkhji/vJ1WHuwx1gqUB+AStsOyiCQ==`""
    # Mount the drive
    New-PSDrive -Name Z -PSProvider FileSystem -Root "\\storageacdcruz.file.core.windows.net\test" -Persist
} else {
    Write-Error -Message "Unable to reach the Azure storage account via port 445. Check to make sure your organization or ISP is not blocking port 445, or use Azure P2S VPN, Azure S2S VPN, or Express Route to tunnel SMB traffic over a different port."
}