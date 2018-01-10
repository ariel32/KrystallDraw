UseTIFFImageDecoder()


Define image_id.i

Enumeration
  #Window_0
  #CanvasGadget
  #sourceImage
  
  #iterationImg
EndEnumeration

Procedure SquareCalc()
; load image
image_id = LoadImage( #PB_Any, "C:\test.jpg" )

Dim image_pixel_data.b( ImageWidth(image_id), ImageHeight(image_id) )

StartDrawing(ImageOutput( image_id ) )
For y = 0 To ImageHeight(image_id) - 1
  For x = 0 To ImageWidth(image_id) - 1
    If Point(x,y) <> #Black
      i = i+1
    EndIf
  Next x
Next y
StopDrawing()
FreeImage(image_id)
Debug i
EndProcedure

If OpenWindow(#Window_0, 0, 0, 220, 220, "CanvasGadget", #PB_Window_SystemMenu); | #PB_Window_ScreenCentered)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_Escape, 1)
  
  CanvasGadget(#CanvasGadget, 10, 10, 200, 200, #PB_Canvas_Keyboard)
  
  
EndIf

 ; path.s = OpenFileRequester("","C:/src.tif","*.*",0)
  path.s = "C:/src.tif"
  If LoadImage(#sourceImage, path)
    imgW = ImageWidth(#sourceImage) : imgH = ImageHeight(#sourceImage)
    imgH = imgH*0.5 : imgW = imgW*0.55
    
    
    ResizeWindow(#Window_0,#PB_Ignore,#PB_Ignore,imgW+20, imgH+20)
    ResizeGadget(#CanvasGadget, 10,10, imgW, imgH)
    
    StartDrawing(CanvasOutput(#CanvasGadget))
      ResizeImage(#sourceImage,imgW, imgH)
      DrawImage(ImageID(#sourceImage),0,0)
    StopDrawing()
  EndIf
  
    CreateImage(10,imgW, imgH)
    SetActiveGadget(#CanvasGadget)
    
    CreateImage(#iterationImg, ImgW, imgH, 32 | #PB_Image_Transparent)

    crclRadius = 50
    
    Repeat
      
      
    Event=WaitWindowEvent()
    Gadget=EventGadget()
    Type=EventType()
    Window=EventWindow()
    Menu=EventMenu()
    Timer=EventTimer()
   
   If Event = #PB_Event_Gadget And Gadget = #CanvasGadget And Type = #PB_EventType_MouseWheel
     crclRadius = crclRadius + 5*GetGadgetAttribute(#CanvasGadget, #PB_Canvas_WheelDelta)
   EndIf
   
   If crclRadius < 0 : crclRadius = 0 : EndIf
   
      
      If Event = #PB_Event_Gadget And Gadget = #CanvasGadget
        If Type = #PB_EventType_LeftButtonDown Or (Type = #PB_EventType_MouseMove And GetGadgetAttribute(#CanvasGadget, #PB_Canvas_Buttons) & #PB_Canvas_LeftButton)
          If StartDrawing(CanvasOutput(#CanvasGadget))
            DrawingMode(#PB_2DDrawing_AlphaBlend)
            x = GetGadgetAttribute(#CanvasGadget , #PB_Canvas_MouseX)
            y = GetGadgetAttribute(#CanvasGadget , #PB_Canvas_MouseY)
            Circle(x, y, crclRadius, RGBA(0, 255, 0, 50))
            StopDrawing()
          EndIf
          
          If StartDrawing(ImageOutput(10))
            Circle(x, y, crclRadius, RGB(0, 255, 0))
            StopDrawing()
          EndIf
        EndIf
      EndIf
      
      If Gadget = #CanvasGadget And Event = #PB_Event_Gadget And Type = #PB_EventType_LeftButtonUp
        SaveImage(10,"C:/test.jpg")
        SquareCalc()
      EndIf
      
      

If Event=#PB_Event_Menu And Window = #Window_0 And Menu=1 : End : EndIf
Until Event=#PB_Event_CloseWindow And Window = #Window_0


; IDE Options = PureBasic 4.60 (Windows - x86)
; CursorPosition = 88
; FirstLine = 47
; Folding = +
; EnableXP