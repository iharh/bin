Set FSO = CreateObject("Scripting.FileSystemObject")
Set SHELL = CreateObject("WScript.Shell")

subversion_home = SHELL.ExpandEnvironmentStrings("%SUBVERSION_HOME%")
status_log = subversion_home + "\svn_status.log"

'Delete c:\svn_status.log
if (FSO.FileExists(status_log)) then 
	FSO.DeleteFile(status_log)
end if

'Generate c:\svn_clean.log
Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run "%comspec% /c svn status --no-ignore > " + status_log, 2, true 

'Iterate through c:\svn_status.log, and for each entry that is ?, delete it
'If it's a file, delete the file
'If it's a directory, delete the directory
Set svn_status = FSO.OpenTextFile(status_log, 1, TristateFalse)

Do While svn_status.AtEndOfStream <> True
	statusLine = svn_status.ReadLine
	if Left(statusLine,1) = "?" then
		Path = Right(statusLine, Len(statusLine) - 8)
		'MsgBox Path, 65, "list"
		WScript.Echo "X " & path
		if FSO.FileExists(path) then
			'MsgBox "del " & path, 65, "list"
			FSO.DeleteFile path, True
		elseif FSO.FolderExists(path) then
			'MsgBox "rmdir " & path, 65, "list"
			FSO.DeleteFolder path, True
		end if
	end if
Loop

svn_status.close
