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
    $zDOBlastfour  =  $zDOB.SubString(4).contains("1920")
    $zDOBlastfour1  =  $zDOB.SubString(4).contains("1900")

    write-host ""
    write-host "        Name      :    " $DisplayName
    write-host " SSN (last 4)     :    " $zSSN
    write-host ""
    write-host " DOB (mm/dd)      :    " $zDOBfirstfour
    write-host "  Year 1920       :    " $zDOBlastfour
    write-host "  Year 1900       :    " $zDOBlastfour1
    write-host "     Manager      :    " $Manager
    write-host "  Last Login      :    " $lastlogonfriendly
    write-host "Other Mobile      :    " $otherMobile
    write-host "     Company      :    " $zContractorCompany
    write-host ""

$pause = Read-Host 'Press enter to lookup another EID'

#Cleanup
    $DisplayName = ""
    $zSSN = ""
    $zDOB = ""
    $zManagerEID = ""
    $zDOBlastfour = ""
    $zDOBlastfour1=""
    $Manager = ""
    $lastlogon = ""


}
while ($loop -eq "1")