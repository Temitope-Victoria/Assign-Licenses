Install-Module MSOnline  

Import-Module MSOnline 

Get-Module -ListAvailable MSOnline 

Connect-MsolService 

Get-MsolAccountSku | Select-Object AccountSkuId 

  Get-CASMailbox

  

to remove 

  

Import-Csv .\TEST.csv | ForEach-Object { 

    $User = Get-MsolUser -UserPrincipalName $_.UserPrincipalName 

    $Skus = $User.licenses.AccountSkuId 

    Set-MsolUserLicense -UserPrincipalName $User.UserPrincipalName -RemoveLicenses $Skus 

} 

  

  

to assign  

$users = import-csv ".\TEST1.csv" 

    foreach ($user in $users) 

    { 

        $upn=$user.UserPrincipalName 

        $usagelocation= "US"  

        $SKU= "TENANTNAME:STANDARDWOFFPACK_IW_STUDENT"   #Ensure to enter the correct AccountSkuID based on your SkuID 

        Set-MsolUser -UserPrincipalName $upn -UsageLocation $usagelocation 

        Set-MsolUserLicense -UserPrincipalName $upn -AddLicenses $SKU 

        Write-Host "License Assigned to UPN:"$upn "License Assigned to UPN:"$upn #Return which UserPrincipalName was successfully assigned with the license  

         }  