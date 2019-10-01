Set-AzContext -Subscription "d07c0080-170c-4c24-861d-9c817742786c"
Register-AzResourceProvider -ProviderNamespace 'Microsoft.Security'

Set-AzContext -Subscription "d07c0080-170c-4c24-861d-9c817742786c"
Set-AzSecurityPricing -Name "default" -PricingTier "Standard"
Set-AzSecurityWorkspaceSetting -Name "default" -Scope
"/subscriptions/d07c0080-170c-4c24-861d-9c817742786c" -WorkspaceId"/subscriptions/d07c0080-170c-4c24-861d-9c817742786c/resourceGroups/myRg/providers/Microsoft.OperationalInsights/workspaces/myWorkspace"
Set-AzContext -Subscription "d07c0080-170c-4c24-861d-9c817742786c"

Set-AzSecurityAutoProvisioningSetting -Name "default" -EnableAutoProvision

Set-AzSecurityContact -Name "default1" -Email "destsec@outlook.com" -Phone "3022646852" -AlertAdmin -NotifyOnAlert

Register-AzResourceProvider -ProviderNamespace 'Microsoft.PolicyInsights'
$Policy = Get-AzPolicySetDefinition | where {$_.Properties.displayName -EQ '[Preview]: Enable Monitoring in Azure Security Center'}
New-AzPolicyAssignment -Name 'ASC Default <d07c0080-170c-4c24-861d-9c817742786c>' -DisplayName 'Security Center Default <subscription ID>' -PolicySetDefinition $Policy -Scope '/subscriptions/d07c0080-170c-4c24-861d-9c817742786c'
