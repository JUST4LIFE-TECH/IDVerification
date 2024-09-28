Write-Host "EID Check"
Write-Host " "
$EID = Read-Host "Enter EID"
Get-ADUser -Identity $EID -Properties * | select AccountExpirationDate,Description,displayName,homePostalAddress,@{N='LastLogon'; E={[DateTime]::FromFileTime($_.LastLogon)}},manager,otherMobile,whenChanged,whenCreated,zContractorCompany,zDOB
pause