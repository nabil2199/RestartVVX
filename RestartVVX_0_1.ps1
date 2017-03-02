
<#
VVX Restart
Verion 0.1
OCWS
#>

param([string]$userCsv = "C:\Sources\users.csv",[string]$IPfilePath = "C:\Sources\IPfile.csv")


$ClientIP = '10.220.201.93'

##REBOOT REST CALL
$user = 'Polycom'
$pass= '789'
$secpasswd = ConvertTo-SecureString $pass -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($user, $secpasswd)
try {
                $json = Invoke-RestMethod -Uri "http://${ClientIP}:80/api/v1/mgmt/safeRestart" -Credential $cred -Method Post -ContentType "application/json"  -TimeoutSec 2 

} catch {
    Write-Host "Exception:" $_.Exception.Message -foreground "red"
    if($_.Exception.Response.StatusCode.value__ -eq "")
    {
                    Write-Host "StatusCode:" $_.Exception.Response.StatusCode.value__ -foreground "red"
                    Write-Host "StatusDescription:" $_.Exception.Response.StatusDescription -foreground "red"
    }
}