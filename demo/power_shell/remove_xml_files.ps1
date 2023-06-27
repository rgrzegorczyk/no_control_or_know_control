<#
CHAT GPT prompts

Let's prepare Power Shell Script

I have a folder called database with some subfolders. Write power shell script that will remove all files with XML extension only from subfolders.
I will execute script from database folder.
Script will not delete XML files from database folder (we need controller.xml)

#>
Get-ChildItem -Path ".\*" -Include "*.xml" -Recurse | Where-Object { $_.DirectoryName -ne $pwd.Path -and $_.Name -ne "controller.xml" } | Remove-Item -Force
