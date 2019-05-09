. ($PSScriptRoot + "./secrets.ps1")
. ($PSScriptRoot + "./Get-Board.ps1")
. ($PSScriptRoot + "./Reset-Boards.ps1")
. ($PSScriptRoot + "./New-Board.ps1")
. ($PSScriptRoot + "./Set-Column.ps1")
. ($PSScriptRoot + "./Set-Card.ps1")
. ($PSScriptRoot + "./Get-ColumnId.ps1")
. ($PSScriptRoot + "./Get-CardId.ps1")
. ($PSScriptRoot + "./Edit-Card.ps1")
. ($PSScriptRoot + "./Add-Comment.ps1")

# FIXME: Begin turning this into a module now before anyone else gets hurt!
# NOTE: Update board needs to INCLUDE the 'get list' funtion for it to work <-- pay attention to this!
# NOTE: Is there an 'include' for powershell or are we .Sourcing everything? <-- redo 'creating modules' course...
# NOTE: Can't returns from the API be managed as objects in a 'GUI LIKE' way so you don't have to keep stepping through the query flow to add a comment to a document? [see note below about pipes]

# TODO: function names SHOULD match the API calls they're making really... <<==

# FIXME: actually use PIPES to send results from one function to the next!!

# TODO: can you mock this stuff using Pester? No idea. Leave this for now...

# TODO: Add pathing to the readme
# TODO: Add a way of updating the same column over and over till you're done with path
# TODO: Rename Reset-Boards function to something more descriptive...

Add-Comment -Comment 'here is a brand new comment'