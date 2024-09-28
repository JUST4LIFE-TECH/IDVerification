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
    $zDOBfirstfour = $zDOB.SubString(0,4)

    write-host ""
    write-host "        Name: " $DisplayName
    write-host "SSN (last 4): " $zSSN
    write-host " DOB (mm/dd): " $zDOBfirstfour
    write-host "     Manager: " $Manager
    write-host "  Last Login: " $lastlogonfriendly
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

