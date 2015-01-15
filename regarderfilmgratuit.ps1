<#
.SYNOPSIS
Récupère le video depuis regarder-film-gratuit.com
.DESCRIPTION
Récupère le fichier video hébergé sur youwatch affiché dans sur regarder-film-gratuit.com 
example:
 regarderfilmgratuit.ps1 -Name the-americans -Saison 1 -EpNumber 2
.PARAMETER Name
The codename of the Show.
.EXAMPLE
regarderfilmgratuit.ps1 -Name the-americans -Saison 1 -EpNumber 2
.LINK
http://www.regarder-film-gratuit.com
#>
param(
[Parameter(Mandatory=$true)][string]$Name,
[Parameter(Mandatory=$true)][string]$Saison,
[Parameter(Mandatory=$true)][string]$EpNumber
)
echo "`n Information `n ----------- "
$initurl = "http://www.regarder-film-gratuit.com/$Name-saison-$Saison-episode-$EpNumber/"
echo "- url sur regarder-film-gratuit:`n   $initurl"

$myoutput = C:\Users\IEUser\Documents\curl_740_0_ssl\curl.exe  --silent $initurl
$myoutput = $myoutput | Select-String -Pattern 'http://youwatch[^"]*800x460.html' 
$myoutput = $myoutput.Matches
$myoutput = $myoutput| % { $_.Value }
echo "- url sur youwatch:`n   $myoutput"
#$thevideoids = (curl --silent $myoutput | Select-String -Pattern 'video\|[^|]*\|.*\|.*\|setup' | % { $_.Matches } | % {$_.Value } )

$thevideoids =  C:\Users\IEUser\Documents\curl_740_0_ssl\curl.exe --silent $myoutput 
$thevideoids = $thevideoids | Select-String -Pattern 'video\|[^|]*\|.*\|.*\|setup'
$thevideoids = $thevideoids.Matches
$thevideoids = $thevideoids | % { $_.Value }
#echo $thevideoids

$thefinalurl = ($thevideoids -replace "video\|([a-z0-9]+)\|([0-9]+)\|([a-z0-9]+)\|setup\b" ,'http://$3.youwatch.org:$2/$1/video.mp4' )
echo "- url de la video:`n    $thefinalurl `n `n Download `n --------`n"

##C:\Users\IEUser\Documents\curl_740_0_ssl\curl.exe -o $Name_$Serie_$Episode.mp4 $thefinalurl
$finalcommand = "C:\Users\IEUser\Documents\curl_740_0_ssl\curl.exe -o $Name-s$Saison-e$EpNumber.mp4 $thefinalurl"
Invoke-Expression $finalcommand
