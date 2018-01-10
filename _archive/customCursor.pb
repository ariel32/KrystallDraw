If OpenWindow(0,5,5,400,300,"Курсор") 
  CanvasGadget(0,5,5,390,290) 
  str$ = Chr(0) 
  hcur = CreateCursor_(0,1,1,50,2,@str$, @str$) 
  SetGadgetAttribute(0,#PB_Canvas_CustomCursor,hcur) 
  Repeat:Until WaitWindowEvent() = #PB_Event_CloseWindow 
EndIf
; IDE Options = PureBasic 4.60 (Windows - x86)
; CursorPosition = 2
; EnableXP