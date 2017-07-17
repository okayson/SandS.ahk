;--------------------------------
; Space and Utility.
; This Script realizes utility keybord input methods with space key.
;--------------------------------
; Include other modules
;--------------------------------
#Include Debug.ahk
;--------------------------------
; Declare and Initialize Global Variables.
;--------------------------------
gIsSpaceKeyPressed					:= False
gStartTickCountOfSpaceKeyPressed	:= 0
gIsWaitingForInput					:= False

;--------------------------------
; Initialize
;--------------------------------
Debug_initialize()
Debug_setDebugMode(1)

;--------------------------------
*Space::
	
	gIsSpaceKeyPressed := True
	gStartTickCountOfSpaceKeyPressed := A_TickCount
	
	Debug_dumpMessage("begin loop.")
	while gIsSpaceKeyPressed
	{
		gIsWaitingForInput := True
		Input, userInput, L1, {Esc}
		gIsWaitingForInput := False
		
		If ErrorLevel != Max
		{
			Debug_dumpMessage(ErrorLevel . ", " . userInput)
			Break
		}
		
		_executeCommandByInput(userInput)
	}
	Debug_dumpMessage("end loop.")
	
	Return
	
;--------------------------------
*Space Up::
	
	gIsSpaceKeyPressed := False
	
	If gIsWaitingForInput
	{
		; Send dummy key to finish the "Input" method.
		Send {Esc}
		
		If _inRangeOfSpaceKeyAvairable(A_TickCount - gStartTickCountOfSpaceKeyPressed)
		{
			Send {Space}
		}
	}
	
	Return

;--------------------------------
_executeCommandByInput(userInput)
{
	;--------------------------------
	; home(h)
	; end(e)
	; C-home
	; C-end
	; Å©
	; Å®
	; Å™
	; Å´
	; delete
	; backspace
	; page-up
	; page-down
	; changing input method
	; ëSäpîºäpêÿÇËë÷Ç¶
	; ï∂éöïœä∑ âpêîÅAÇ–ÇÁÇ™Ç»Ç»Ç«
	;--------------------------------
	If userInput = h
	{
		Debug_dumpMessage(userInput . ": Home")
		Send {Home}
		Return
	}
	If userInput = e
	{
		Debug_dumpMessage(userInput . ": End")
		Send {End}
		Return
	}
}
;--------------------------------
_inRangeOfSpaceKeyAvairable(pressedTickCount)
{
	Return (pressedTickCount < 200)
}
