@ECHO OFF
REM Creating secure shared folders for home directories / redirected folders and profiles
REM Sample articles:
REM https://support.microsoft.com/en-us/help/274443/how-to-dynamically-create-security-enhanced-redirected-folders-by-using-folder-redirection-in-windows-2000-and-in-windows-server-2003
REM https://technet.microsoft.com/en-us/library/jj649078(v=ws.11).aspx

REM Create and share folders with permissions for home directories / redirected folders and profiles
SET Folder = E:\Home
md %Folder%
net share Home=%Folder% /GRANT:Users,CHANGE /GRANT:Administrators,FULL /CACHE:Automatic /REMARK:"User home folders"
icacls %Folder% /inheritance:d
icacls %Folder% /remove Users
icacls %Folder% /grant Users:(S,RD,AD,X,RA)

REM Create and share folders with permissions for profiles
SET Folder = E:\Profiles
md %Folder%
net share Profiles=%Folder% /GRANT:Users,CHANGE /GRANT:Administrators,FULL /CACHE:None /REMARK:"User profiles"
icacls %Folder% /inheritance:d
icacls %Folder% /remove Users
icacls %Folder% /grant Users:(S,RD,AD,X,RA)