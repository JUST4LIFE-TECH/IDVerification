#Enable AD Module
Import-module ActiveDirectory

$loop = 1
do {

cls
$eid = Read-Host 'Enter EID'
    $DisplayName = get-aduser -identity $eid -properties DisplayName | Select -expand DisplayName
    $zSSN = get-aduser -identity $eid -Properties zSSN | Select -expand zSSN
    $zDOB = get-aduser -identity $eid -Properties zDOB | Select -expand zDOB
    $zManagerEID = get-aduser -identity $eid -Properties zManagerEID | Select -expand zManagerEID
    $Manager = get-aduser -identity $zManagerEID -Properties DisplayName | Select -expand DisplayName
    $lastlogontimestamp = get-aduser -identity $eid -Properties lastlogon | Select -expand lastlogon
    $lastlogonfriendly = [DateTime]::FromFileTime($lastlogontimestamp)
    $otherMobile = Get-ADUser -identity $eid -Properties otherMobile | Select -expand otherMobile
    $zContractorCompany = Get-ADUser -identity $eid -Properties zContractorCompany | Select -expand zContractorCompany
    $zDOBfirstfour = $zDOB.SubString(0,4)
    $zemployeeID = get-aduser -identity $eid -Properties employeeID | Select -expand employeeID
    $zFranchiseEID = get-aduser -identity $eid -Properties zFranchiseEID | Select -expand zFranchiseEID
    $zUserAccountType = get-aduser -identity $eid -Properties zUserAccountType | Select -expand zUserAccountType

    write-host ""
    write-host "             Name: " $DisplayName
    write-host "     SSN (last 4): " $zSSN
    write-host "      DOB (mm/dd): " $zDOBfirstfour
    write-host "          Manager: " $Manager
    write-host "       Last Login: " $lastlogonfriendly
    write-host "     Other Mobile: " $otherMobile
    write-host "       EmployeeID: " $zemployeeID
    write-host "     FranchiseEID: " $zFranchiseEID
    write-host "     Account Type: " $zUserAccountType
    write-host "3rd Party Company: " $zContractorCompany
        
    write-host ""

$pause = Read-Host 'Press enter to lookup another EID'

#Cleanup
    $DisplayName = ""
    $zSSN = ""
    $zDOB = ""
    $zManagerEID = ""
    $Manager = ""
    $lastlogon = ""


}
while ($loop -eq "1")

