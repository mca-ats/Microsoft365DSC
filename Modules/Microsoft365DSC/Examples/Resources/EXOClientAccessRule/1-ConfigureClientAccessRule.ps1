<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Example
{
    param(
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $Credscredential
    )
    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        EXOClientAccessRule 'ConfigureClientAccessRule'
        {
            Action                               = "AllowAccess"
            UserRecipientFilter                  = $null
            ExceptAnyOfAuthenticationTypes       = @()
            ExceptUsernameMatchesAnyOfPatterns   = @()
            AnyOfAuthenticationTypes             = @()
            UsernameMatchesAnyOfPatterns         = @()
            Identity                             = "Always Allow Remote PowerShell"
            Priority                             = 1
            AnyOfProtocols                       = @("RemotePowerShell")
            Enabled                              = $True
            ExceptAnyOfProtocols                 = @()
            ExceptAnyOfClientIPAddressesOrRanges = @()
            AnyOfClientIPAddressesOrRanges       = @()
            Ensure                               = "Present"
            Credential                           = $GlobalAdmin
        }
    }
}
