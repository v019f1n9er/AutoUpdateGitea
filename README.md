# AutoUpdateGitea

## Purpose ##
The goal of this project is to automate the search for new versions of Gitea and update Gitea to these versions.

## Getting started ##
To start this project, you need to add execution permission to the file. For this, use the following command:
`chmod +x <path-to-UpgraderGitea.sh`

After that, it is not necessary to place it in the bracket using the keyboard:
`crontab -e`

And specify how often it is necessary to check and perform updates. In my case, the line will look like this:
```
running the script on the first day of each month at 00:00
0 0 1 * * /path/to/UpgraderGitea.sh
```
