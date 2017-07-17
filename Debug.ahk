;------------------------------
Debug_initialize()
{
	global gDebugMode
	global gDebugWindowHandle
	global gDebugWindowExists
	
	gDebugMode := 0
	gDebugWindowHandle := 0
	gDebugWindowExists := False
	
	SetTitleMatchMode, 2
	SetKeyDelay, -1
	
	WinGet, gDebugWindowHandle, ID, DebugOutput.txt
	IfInString, gDebugWindowHandle, 0x
	{
		gDebugWindowExists := True
	}
	Else
	{
		gDebugWindowExists := False
		MsgBox, Error: Output window does not exist.Please open DebugOutput.txt by Notepad.
	}
}
;------------------------------
Debug_setDebugMode(debugMode)
{
	global gDebugMode
	
	gDebugMode := debugMode
}
;------------------------------
Debug_dumpMessage(message)
{
	global gDebugMode
	global gDebugWindowHandle
	global gDebugWindowExists
	
	If (gDebugMode = 0) || (!gDebugWindowExists)
	{
		Return
	}
	
	formattedMessage := message . "`n"
	
	ControlSend , , %formattedMessage%, ahk_id %gDebugWindowHandle%

	If ErrorLevel = 1
	{
		MsgBox, Error: Sending message to output window is failure.
		Return 
	}
}