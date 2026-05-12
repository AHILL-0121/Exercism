function Get-BobResponse() {
    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )

    $trimmed  = $HeyBob.Trim()
    $isQuiet  = [string]::IsNullOrEmpty($trimmed)
    $hasLetters = $trimmed -cmatch '[a-zA-Z]'
    $isYelling  = $hasLetters -and ($trimmed -ceq $trimmed.ToUpper())
    $isQuestion = $trimmed.EndsWith('?')

    if ($isQuiet)              { return "Fine. Be that way!" }
    if ($isYelling -and $isQuestion) { return "Calm down, I know what I'm doing!" }
    if ($isYelling)            { return "Whoa, chill out!" }
    if ($isQuestion)           { return "Sure." }
    return "Whatever."
}