;------------------------------
#Include Debug.ahk
;------------------------------
Debug_initialize()
Debug_setDebugMode(1)
;------------------------------
d::
	Debug_dumpMessage("Test")
	Return
s::
	Debug_dumpMessage("s is inputd.")
	Return

e::
	Exit
	Return
	