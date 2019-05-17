function Edit-Card {

    [CmdletBinding(DefaultParameterSetName='Description')]
    param(
        [Parameter(ParameterSetName = 'Description')]
        [string]$description,
        
        [Parameter(ParameterSetName = 'Name')]
        [string]
        $name
    )
    
    $boardId = Get-BoardId
    
    $cardId = Get-CardId -boardId $boardId

    # TODO: Honestly, should probably pull back the description text and make it editable in the command line INSTEAD OF how it currently works which is by over-writing it... 
    # NOTE: This would be MUCH BETTER for real use where the description is the main part of 'you should do this'...

if ($PSBoundParameters.ContainsKey('Description')) {
    Write-Host 'DESCRIPTION SET'
    $bodyJson=@"
{
"position": 0,
"description": {
    "text": "$description"
    }
}
"@
}

if ($PSBoundParameters.ContainsKey('Name')) {
    Write-Host 'NAME SET'
    $bodyJson=@"
{
"name": "$name"
}
"@
}

    $newToken = ConvertTo-SecureString -String $token -AsPlainText -Force
    
    $link = "https://$url/boards/"+ $boardId + "/cards/" + $cardId

Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' -Token $newToken -Authentication Bearer

}