using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

$APIName = $TriggerMetadata.FunctionName
Log-Request -user $request.headers.'x-ms-client-principal' -API $APINAME  -message "Accessed this API" -Sev "Debug"


# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."
$user = $request.headers.'x-ms-client-principal'

$username = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($user)) | ConvertFrom-Json).userDetails
$date = (Get-Date).tostring('dd-MM-yyyy')
try {
    if ($Request.Query.List) {
        if (!(Test-Path .\config\ExcludeSkuList.JSON)) {

            Set-Content '.\config\ExcludeSkuList.JSON' -Value '[{"GUID":"90d8b3f8-712e-4f7b-aa1e-62e7ae6cbe96","Product_Display_Name":"Business Apps (free)"},{"GUID":"90d8b3f8-712e-4f7b-aa1e-62e7ae6cbe96","Product_Display_Name":"Business Apps (free)"},{"GUID":"f30db892-07e9-47e9-837c-80727f46fd3d","Product_Display_Name":"MICROSOFT FLOW FREE"},{"GUID":"f30db892-07e9-47e9-837c-80727f46fd3d","Product_Display_Name":"MICROSOFT FLOW FREE"},{"GUID":"f30db892-07e9-47e9-837c-80727f46fd3d","Product_Display_Name":"MICROSOFT FLOW FREE"},{"GUID":"16ddbbfc-09ea-4de2-b1d7-312db6112d70","Product_Display_Name":"MICROSOFT TEAMS (FREE)"},{"GUID":"16ddbbfc-09ea-4de2-b1d7-312db6112d70","Product_Display_Name":"MICROSOFT TEAMS (FREE)"},{"GUID":"16ddbbfc-09ea-4de2-b1d7-312db6112d70","Product_Display_Name":"MICROSOFT TEAMS (FREE)"},{"GUID":"16ddbbfc-09ea-4de2-b1d7-312db6112d70","Product_Display_Name":"MICROSOFT TEAMS (FREE)"},{"GUID":"16ddbbfc-09ea-4de2-b1d7-312db6112d70","Product_Display_Name":"MICROSOFT TEAMS (FREE)"},{"GUID":"16ddbbfc-09ea-4de2-b1d7-312db6112d70","Product_Display_Name":"MICROSOFT TEAMS (FREE)"},{"GUID":"a403ebcc-fae0-4ca2-8c8c-7a907fd6c235","Product_Display_Name":"Power BI (free)"},{"GUID":"a403ebcc-fae0-4ca2-8c8c-7a907fd6c235","Product_Display_Name":"Power BI (free)"},{"GUID":"61e6bd70-fbdb-4deb-82ea-912842f39431","Product_Display_Name":"Dynamics 365 Customer Service Insights Trial"},{"GUID":"bc946dac-7877-4271-b2f7-99d2db13cd2c","Product_Display_Name":"Dynamics 365 Customer Voice Trial"},{"GUID":"bc946dac-7877-4271-b2f7-99d2db13cd2c","Product_Display_Name":"Dynamics 365 Customer Voice Trial"},{"GUID":"bc946dac-7877-4271-b2f7-99d2db13cd2c","Product_Display_Name":"Dynamics 365 Customer Voice Trial"},{"GUID":"bc946dac-7877-4271-b2f7-99d2db13cd2c","Product_Display_Name":"Dynamics 365 Customer Voice Trial"},{"GUID":"bc946dac-7877-4271-b2f7-99d2db13cd2c","Product_Display_Name":"Dynamics 365 Customer Voice Trial"},{"GUID":"338148b6-1b11-4102-afb9-f92b6cdc0f8d","Product_Display_Name":"DYNAMICS 365 P1 TRIAL FOR INFORMATION WORKERS"},{"GUID":"338148b6-1b11-4102-afb9-f92b6cdc0f8d","Product_Display_Name":"DYNAMICS 365 P1 TRIAL FOR INFORMATION WORKERS"},{"GUID":"fcecd1f9-a91e-488d-a918-a96cdb6ce2b0","Product_Display_Name":"Microsoft Dynamics AX7 User Trial"},{"GUID":"fcecd1f9-a91e-488d-a918-a96cdb6ce2b0","Product_Display_Name":"Microsoft Dynamics AX7 User Trial"},{"GUID":"dcb1a3ae-b33f-4487-846a-a640262fadf4","Product_Display_Name":"Microsoft Power Apps Plan 2 Trial"},{"GUID":"dcb1a3ae-b33f-4487-846a-a640262fadf4","Product_Display_Name":"Microsoft Power Apps Plan 2 Trial"},{"GUID":"dcb1a3ae-b33f-4487-846a-a640262fadf4","Product_Display_Name":"Microsoft Power Apps Plan 2 Trial"},{"GUID":"dcb1a3ae-b33f-4487-846a-a640262fadf4","Product_Display_Name":"Microsoft Power Apps Plan 2 Trial"},{"GUID":"dcb1a3ae-b33f-4487-846a-a640262fadf4","Product_Display_Name":"Microsoft Power Apps Plan 2 Trial"},{"GUID":"74fbf1bb-47c6-4796-9623-77dc7371723b","Product_Display_Name":"Microsoft Teams Trial"},{"GUID":"74fbf1bb-47c6-4796-9623-77dc7371723b","Product_Display_Name":"Microsoft Teams Trial"},{"GUID":"74fbf1bb-47c6-4796-9623-77dc7371723b","Product_Display_Name":"Microsoft Teams Trial"},{"GUID":"74fbf1bb-47c6-4796-9623-77dc7371723b","Product_Display_Name":"Microsoft Teams Trial"},{"GUID":"74fbf1bb-47c6-4796-9623-77dc7371723b","Product_Display_Name":"Microsoft Teams Trial"},{"GUID":"74fbf1bb-47c6-4796-9623-77dc7371723b","Product_Display_Name":"Microsoft Teams Trial"},{"GUID":"74fbf1bb-47c6-4796-9623-77dc7371723b","Product_Display_Name":"Microsoft Teams Trial"},{"GUID":"74fbf1bb-47c6-4796-9623-77dc7371723b","Product_Display_Name":"Microsoft Teams Trial"},{"GUID":"74fbf1bb-47c6-4796-9623-77dc7371723b","Product_Display_Name":"Microsoft Teams Trial"},{"GUID":"74fbf1bb-47c6-4796-9623-77dc7371723b","Product_Display_Name":"Microsoft Teams Trial"},{"GUID":"606b54a9-78d8-4298-ad8b-df6ef4481c80","Product_Display_Name":"Power Virtual Agents Viral Trial"},{"GUID":"606b54a9-78d8-4298-ad8b-df6ef4481c80","Product_Display_Name":"Power Virtual Agents Viral Trial"},{"GUID":"606b54a9-78d8-4298-ad8b-df6ef4481c80","Product_Display_Name":"Power Virtual Agents Viral Trial"},{"GUID":"1f2f344a-700d-42c9-9427-5cea1d5d7ba6","Product_Display_Name":"MICROSOFT STREAM"},{"GUID":"1f2f344a-700d-42c9-9427-5cea1d5d7ba6","Product_Display_Name":"MICROSOFT STREAM"},{"GUID":"6470687e-a428-4b7a-bef2-8a291ad947c9","Product_Display_Name":"WINDOWS STORE FOR BUSINESS"},{"GUID":"6470687e-a428-4b7a-bef2-8a291ad947c9","Product_Display_Name":"WINDOWS STORE FOR BUSINESS"},{"GUID":"710779e8-3d4a-4c88-adb9-386c958d1fdf","Product_Display_Name":"MICROSOFT TEAMS EXPLORATORY"}]' -Force
        }
        $ExcludedTenants = Get-Content '.\config\ExcludeSkuList.JSON' | ConvertFrom-Json
        Log-Request -API $APINAME -user $request.headers.'x-ms-client-principal'  -message "got excluded tenants list" -Sev "Info"
        $body = $ExcludedTenants
    }
    # Interact with query parameters or the body of the request.
    $name = $Request.Query.TenantFilter
    if ($Request.Query.AddExclusion) {
        $ExcludedList = [System.Collections.ArrayList](Get-Content '.\config\ExcludeSkuList.JSON' | ConvertFrom-Json)
        $AddObject = [pscustomobject]@{
            "GUID"                 = $Request.body.GUID
            "Product_Display_Name" = $request.body.SKUName
        }
        $ExcludedList.add($AddObject)
        
        Set-Content '.\config\ExcludeSkuList.JSON' -Value ($ExcludedList | ConvertTo-Json) -Force
        Log-Request -API $APINAME -tenant $($name) -user $request.headers.'x-ms-client-principal'   -message "Added exclusion for customer $($name)" -Sev "Info" 
        $body = [pscustomobject]@{"Results" = "Success. We've added $($request.body.SKUName) to the excluded list." }
    }

    if ($Request.Query.RemoveExclusion) {
        $ExcludedList = [System.Collections.ArrayList](Get-Content '.\config\ExcludeSkuList.JSON' | ConvertFrom-Json)
        Set-Content '.\config\ExcludeSkuList.JSON' -Value ($ExcludedList | Where-Object -Property 'GUID' -NE $Request.query.guid | ConvertTo-Json) -Force
        Log-Request -API $APINAME -tenant $($name) -user $request.headers.'x-ms-client-principal'   -message "Removed exclusion for customer $($name)" -Sev "Info"
        $body = [pscustomobject]@{"Results" = "Success. We've removed $($Request.query.guid) from the excluded list." }
    }


}
catch {
    Log-Request -API $APINAME -tenant $($name) -user $request.headers.'x-ms-client-principal'   -message "Exclusion API failed. $($_.Exception.Message)" -Sev "Error"
    $body = [pscustomobject]@{"Results" = "Failed. $($_.Exception.Message)" }
}



# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body       = $body
    })
