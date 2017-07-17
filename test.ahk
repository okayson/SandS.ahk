Gui, add, text,, First name:
Gui, add, text,, Last name:
Gui, add, edit, vFirstName ym  ; The ym option starts a new column of controls.
Gui, add, edit, vLastName
Gui, add, button, default, OK  ; The label ButtonOK (if it exists) will be run when the button is pressed.
Gui, show,, Simple Input Example
return  ; End of auto-execute section. The script is idle until the user does something.

GuiClose:
ButtonOK:
Gui, submit  ; Save the input from the user to each control's associated variable.
MsgBox You entered "%FirstName% %LastName%".
ExitApp