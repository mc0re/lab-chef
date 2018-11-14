function New-RandomString {
    $String = $null
    $r = New-Object System.Random
    1..6 | % { $String += [char]$r.next(97,122) }
    $string
}

### Define variables

$SubscriptionName = 'Visual Studio Premium with MSDN'
$Location = 'West US' ### Use "Get-AzureLocation | Where-Object Name -eq 'ResourceGroup' | Format-Table Name, LocationsString -Wrap" in ARM mode to find locations which support Resource Groups
$GroupName = 'chef-lab'
$DeploymentName = 'client-deployment'
$PublicDNSName = 'chef-lab-' + (New-RandomString)
$AdminUsername = 'chef'

### Connect to Azure account

Connect-AzureRmAccount
if (Get-AzureSubscription){
    Get-AzureSubscription -SubscriptionName $SubscriptionName | Select-AzureSubscription -Verbose
    }
    else {
    Add-AzureAccount
    Get-AzureSubscription -SubscriptionName $SubscriptionName | Select-AzureSubscription -Verbose
    }

### Get Resource Group ###
$AzureResourceGroup = Get-AzureRmResourceGroup -Name $GroupName
Write-Host 'Resource Group Name is: '$AzureResourceGroup.ResourceGroupName

### Get Storage Account ###
$AzureStorageAccount = (Get-AzureRmStorageAccount -ResourceGroupName $GroupName).StorageAccountName
Write-Host 'Storage Account is: ' $AzureStorageAccount

### Get Virtual Network ###
$AzureVirtualNetwork = ($AzureResourceGroup | Get-AzureRmVirtualNetwork).Name
Write-Host 'Virtual Network is: ' $AzureVirtualNetwork

$parameters = @{
    'StorageAccountName'="$AzureStorageAccount";
    'adminUsername'="$AdminUsername";
    'dnsNameForPublicIP'="$PublicDNSName";
    'virtualNetworkName'="$AzureVirtualNetwork"
    }

New-AzureRmResourceGroupDeployment `
    -Name $DeploymentName `
    -ResourceGroupName $AzureResourceGroup.ResourceGroupName `
    -StorageAccountName $AzureStorageAccount `
    -TemplateFile LinuxClient.json `
    -TemplateParameterObject $parameters `
    -Verbose