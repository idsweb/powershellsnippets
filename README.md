# powershellsnippets
Repo for useful reusable powershell snippets

##Note on dot sourcing and reuse
Scripts behave differently in ISE than they do in the interactive pain or console window. To include a script in the same directory you can use dot sourcing. To use a script in the same directory use:
```powershell
. .\getConfig.ps1
```

###Dot source gotchas
1. If you run a script from the ISE with the above line to include the script then you will get an error (assuming you are not in the directory the script is in). If however you CD into the script directory and run the script it should find the file.
2. Once a scropt with functions has loaded in ISE the functions stay available unless you close the window. 
