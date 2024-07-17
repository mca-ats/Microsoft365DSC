<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Example
{
    param(
        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $CertificateThumbprint
    )

    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        AADSocialIdentityProvider "AADSocialIdentityProvider-Google"
        {
            ClientId             = "Google-OAUTH";
            ClientSecret         = "FakeSecret-Updated"; # Updated Property
            ApplicationId         = $ApplicationId
            TenantId              = $TenantId
            CertificateThumbprint = $CertificateThumbprint
            DisplayName          = "My Google Provider";
            Ensure               = "Present";
            IdentityProviderType = "Google";
        }
    }
}
