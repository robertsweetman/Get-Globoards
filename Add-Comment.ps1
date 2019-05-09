function Add-Comment {

param(
    [Parameter(Mandatory=$true)]
    [string]$comment
)

    # need to replace this with something smarter
    . ($PSScriptRoot + "./secrets.ps1")

    $boardId = Get-Board

    $cardId = Get-CardId -boardId $boardId
    
$bodyJson=@"
{
"text": "$comment"
}
"@

$newToken = ConvertTo-SecureString -String $token -AsPlainText -Force

$link = "https://$url/boards/"+ $boardId + "/cards/" + $cardId + "/comments"

# TODO: Consider better error handling at this step also...
Invoke-RestMethod -Method Post -Body $bodyJson -Uri $link -ContentType 'application/json' -Token $newToken -Authentication Bearer

}