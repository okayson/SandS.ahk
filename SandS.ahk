;--------------------------------
; Declare and Initialize Global Variables.
;--------------------------------
	gIsSpaceKeyPressed := False
	gStartTickCountOfSpaceKeyPressed := 0
	gIsWaitingForInput := False
	
;--------------------------------
*Space::
	
	If gIsSpaceKeyPressed
	{
		Return
	}
	gIsSpaceKeyPressed := True
	gStartTickCountOfSpaceKeyPressed := A_TickCount
	
	Send {RShift Down}
		
	gIsWaitingForInput := True
	Input, inputKey, L1 V, {RShift}
	gIsWaitingForInput := False
	
	Return
;--------------------------------
*Space Up::
	
	If !gIsSpaceKeyPressed
	{
		Return
	}
	gIsSpaceKeyPressed := False
	
	Send {RShift Up}
	
	If gIsWaitingForInput
	{
		If isSpaceKeyAvairable(A_TickCount - gStartTickCountOfSpaceKeyPressed)
		{
			Send {Space}
		}
		; Send dummy key to finish the "Input" method.
		Send {RShift}
	}
	
	Return
;--------------------------------
isSpaceKeyAvairable(limitTickCount)
{
	Return (limitTickCount < 200)
}