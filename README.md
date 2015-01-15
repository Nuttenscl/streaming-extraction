#streaming extraction

## Regarder film gratuit . com

### regarderfilmgratuit (bash version)
- depends on  egrep, grep, curl, sed, tail, head
- to be run directly in the bash


### regarderfilmgratuit.ps1 (PowerShell version)
Procedure:
- install curl http://curl.haxx.se/download.html in the directory 
- copy "regarderfilmgratuit.ps1" file in the same directory
- modify the path to the curl.exe (should be the "C:\Users\ ... currentdirectory ... \curl.exe")
- add a shortcut to the desktop with the Target location:
 %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File "C:\Users\ ... currentdirectory ... \regarderfilmgratuit.ps1"
- adapt the "Start In" of the shortcut with the current directory "C:\Users\ ... currentdirectory ... "
- double click on the shortcut should ask for the serie name, season and episode number. (serie name should be in the same form as in the regarder-film-gratuit.com adress bar corresponding to the show example: the-americans )


### bash_downloads 
- contains various bash function to extract from vk, youwatch, arte, canal+, ...
- depends on w3m, curl, avconv, (e)grep, curl, sed, tail, head
