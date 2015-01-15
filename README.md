#streaming extraction

## Regarder film gratuit . com

The two following scripts allow to extract the link to the video linked on the "regarder-film-gratuit.com" website, if it's hosted on youwatch (vk also for the bash version).

### regarderfilmgratuit (bash version)
- depends on  egrep, grep, curl, sed, tail, head
- to be run directly in the bash

Usage:

```
user@computer:~$ regarderfilmgratuit -h

usage: /usr/local/sbin/regarderfilmgratuit -n seriename options

 This script allow to extract info from regarder-film-gratuit.com
 
 OPTIONS:
    -h     Show this message
  Inputs
    -n 	   serie name [mandatory]
    -s     saison
    -e     episode
    -m     first episode to show using list all 
    -x     last episode to show using list all 
  Actions
    -d     dump cmd to download streamingservice using youwatch [ requires -s -e]
    -D     dump cmd to download streamingservice [vk or yw, requires -s -e]
    -g     to directely run the download command
    -l     to list last available episode
    -a 	   to list all episode youwatch link for season s episode m to x [requires -s -m -x]

  Examples:
   regarderfilmgratuit -n homeland -l
   regarderfilmgratuit -n greys-anatomy -a -s3 -m2 -x15
   regarderfilmgratuit -n revenge -d -s2 -e7
   regarderfilmgratuit -n revenge -D yw -s2 -e7


```
to make it available anywhere, copy the script to /usr/local/sbin/regarderfilmgratuit (in ubuntu, maybe different for others) and change the permission to execute

you can add the serie names completion by adding to your .bashrc the following:
```
_completeregarderfilmgratuit() {
          local curw=${COMP_WORDS[COMP_CWORD]}
              COMPREPLY=($(compgen -W '24-heures-chrono 90210 american-wives awkward a-la-maison-blanche bad-teacher bates-motel black-books black-box black-sails blue-bloods boardwalk-empire body-of-proof bones breaking-bad brothers-sisters burn-notice californication castle championnes-a-tout-prix chasing-life chez-maupassant chicago-fire chuck clem client-list cougar-town crossbones dallas dallas-2012 deadwood desperate-housewives destins-croises devious-maids dexter downton-abbey dr-house dynastie dynastie-2-les-colby elementary elisa esprits-criminels fais-pas-ci-fais-pas-ca faites-comme-chez-vous fbi-duo-tres-special following gilmore-girls glee gossip-girl grand-hotel greek greys-anatomy hannibal hart-of-dixie hartley-coeurs-a-vif hawaii-5-0 heartland hercule-poirot homeland house-of-cards how-i-met-your-mother inspecteur-barnaby la-reine-du-sud la-vie-secrete-dune-ado-ordinaire las-vegas le-destin-de-bruno le-destin-de-lisa les-borgia les-experts les-freres-scott les-soprano les-tudors leverage lie-to-me luther mad-dogs mad-men mafiosa maison-close malcolm medium melrose-place mentalist mistresses mon-oncle-charlie murdoch-mysteries ncis-los-angeles ncis-enquetes-speciales new-york-911 newport-beach nikita niptuck odysseus parenthood physique-ou-chimie prison-break private-practice privileged psych reign revenge ringer rizzoli-isles royal-pains satisfaction scandal sex-and-the-city siberia six-feet-under skins sons-of-anarchy spartacus suits-avocats-sur-mesure switched-at-birth the-americans the-big-c the-firm the-good-wife the-listener the-musketeers the-white-queen thierry-la-fronde transporteur true-detective tunnel turn tyrant un-dos-tres unforgettable urgences veronica-mars vikings violetta weeds zero-hour' -- "$curw"))
              #COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
                return 0
        }

complete -F _completeregarderfilmgratuit regarderfilmgratuit

```


### regarderfilmgratuit.ps1 (PowerShell version)
Procedure:
- install curl http://curl.haxx.se/download.html in the directory 
- copy "regarderfilmgratuit.ps1" file in the same directory
- edit in regarderfilmgratuit.ps1 the path to the curl.exe (should be the "C:\Users\ ... currentdirectory ... \curl.exe")
- add a shortcut to the desktop with the Target location:
 %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "C:\Users\ ... currentdirectory ... \regarderfilmgratuit.ps1"
- adapt the "Start In" of the shortcut with the current directory "C:\Users\ ... currentdirectory ... "
- double click on the shortcut should ask for the serie name, season and episode number. (serie name should be in the same form as in the regarder-film-gratuit.com address corresponding to the show example: the-americans )


### bash_downloads 
- contains various bash function to extract from vk, youwatch, arte, canal+, ...
- depends on w3m, curl, avconv, (e)grep, curl, sed, tail, head
