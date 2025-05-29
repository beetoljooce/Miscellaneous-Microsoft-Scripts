#########################################
# 
# Title: simpleUserAuthPull.ps1
# Description: Pulls auth for a specific user, for simple pull jobs
# Author: beetoljooce
# Date: 22APR2025
# Prereq -- Powershell modules for Graph (https://learn.microsoft.com/en-us/powershell/microsoftgraph/installation?view=graph-powershell-1.0)
#
#########################################

Connect-MgGraph -Scopes 'Directory.Read.All, User.Read.All, UserAuthenticationMethod.ReadWrite.All'

do{
    $userInput = Read-Host "[X] Enter a user's email or object ID to search. Press 'q' and hit 'Enter' to quit" #Prompt user input for user object
    if ($userInput -ne "q") { #Doesn't run if the user quits
        $detailPull = Get-EntraUserAuthenticationMethod -UserId $userInput | Select-Object AuthenticationMethodType, DisplayName, CreatedDateTime | Format-Table AuthenticationMethodType,DisplayName,CreatedDateTime #Actual operation
        Write-Output $detailPull #writing the table to the screen instead of at the end
    }
} While($userInput -ne "q")