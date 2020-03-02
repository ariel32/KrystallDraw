UseTIFFImageDecoder()
UsePNGImageEncoder() : UsePNGImageDecoder()

Define image_id.i
Define proportionCoeff.f

Global path.s, msgtext.s

Enumeration
  #Window_0
  #CanvasGadget
  
  #FrameOperation
  #ButtonOpenImage
  #buttonSave
  #buttonLoadMask
    
    
  #ButtonClass1
  #ButtonClass2
  #ButtonClass3
  #ButtonClass4
  #ButtonClass5
  #ButtonClass6
  #ButtonClass7
  #ButtonClass8
  #ButtonClass9
  #ButtonBackGround
  #ButtonErase
  #ButtonEraseAll
  
  
  #FrameInfo
  #StringClass1
  #StringClass2
  #StringClass3
  #StringClass4
  #StringClass5
  #StringClass6
  #StringClass7
  #StringClass8
  #StringClass9
  #StringBackGround
  
  #FrameAuthors
  #ButtonAuthors
  
  
  #sourceImage
  #trgImg
EndEnumeration

Procedure AreaCalc()
image_id = LoadImage(#PB_Any, GetCurrentDirectory()+"maps\"+ReplaceString(GetFilePart(path),GetExtensionPart(path),"")+"map.png")
Dim image_pixel_data.b(ImageWidth(image_id), ImageHeight(image_id))

StartDrawing(ImageOutput( image_id ) )

For y = 0 To ImageHeight(image_id) - 1
  For x = 0 To ImageWidth(image_id) - 1
    Select Point(x,y)
      Case #Green
        class1 = class1+1
      Case #Red
        class2 = class2+1
      Case #Yellow
        class3 = class3+1
      Case RGB(0, 90, 255)
        class4 = class4+1
      Case RGB(0, 75, 25)
        class5 = class5+1
      Case RGB(255, 140, 0)
        class6 = class6+1
      Case RGB(127, 255, 212)
        class7 = class7+1
      Case RGB(238, 130, 238)
        class8 = class8+1
      Case RGB(255, 0, 122)
        class9 = class9+1
      Case RGB(255,255,255)
        classBackGround = classBackGround+1
    EndSelect
  Next x
Next y

StopDrawing()

FreeImage(image_id)
; Debug StrF(i/(GadgetWidth(#CanvasGadget) * GadgetHeight(#CanvasGadget))*100, 4)+"%"
SetGadgetText(#StringClass1, StrF(class1/((GadgetWidth(#CanvasGadget) * GadgetHeight(#CanvasGadget)-classBackGround))*100, 4)+"")
SetGadgetText(#StringClass2, StrF(class2/((GadgetWidth(#CanvasGadget) * GadgetHeight(#CanvasGadget)-classBackGround))*100, 4)+"")
SetGadgetText(#StringClass3, StrF(class3/((GadgetWidth(#CanvasGadget) * GadgetHeight(#CanvasGadget)-classBackGround))*100, 4)+"")
SetGadgetText(#StringClass4, StrF(class4/((GadgetWidth(#CanvasGadget) * GadgetHeight(#CanvasGadget)-classBackGround))*100, 4)+"")
SetGadgetText(#StringClass5, StrF(class5/((GadgetWidth(#CanvasGadget) * GadgetHeight(#CanvasGadget)-classBackGround))*100, 4)+"")
SetGadgetText(#StringClass6, StrF(class6/((GadgetWidth(#CanvasGadget) * GadgetHeight(#CanvasGadget)-classBackGround))*100, 4)+"")
SetGadgetText(#StringClass7, StrF(class7/((GadgetWidth(#CanvasGadget) * GadgetHeight(#CanvasGadget)-classBackGround))*100, 4)+"")
SetGadgetText(#StringClass8, StrF(class8/((GadgetWidth(#CanvasGadget) * GadgetHeight(#CanvasGadget)-classBackGround))*100, 4)+"")
SetGadgetText(#StringClass9, StrF(class9/((GadgetWidth(#CanvasGadget) * GadgetHeight(#CanvasGadget)-classBackGround))*100, 4)+"")
EndProcedure

ExamineDesktops()

;proportionCoeff = ImageHeight(#sourceImage)/ImageWidth(#sourceImage)
proportionCoeff = 0.75

imgW = DesktopWidth(0) * 0.7
imgH = proportionCoeff * imgW

If LoadFont(0, "Times New Roman", 14)
  SetGadgetFont(#PB_Default, FontID(0))
EndIf


If FileSize(GetCurrentDirectory()+"\maps") <> -2
  CreateDirectory(GetCurrentDirectory()+"\maps")
EndIf




If OpenWindow(#Window_0, 0, 0, 220, 220, "KrystallDraw"+" v."+Str(#PB_Editor_BuildCount)+"."+Str(#PB_Editor_CompileCount), #PB_Window_SystemMenu | #PB_Window_Maximize); | #PB_Window_ScreenCentered)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_Escape, 1)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_1, 2)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_2, 3)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_3, 4)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_4, 5)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_5, 6)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_6, 7)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_7, 8)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_8, 9)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_9, 10)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_0, 11)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_O, 100)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_S, 101)
  AddKeyboardShortcut(#Window_0, #PB_Shortcut_D, 102)
  
  CanvasGadget(#CanvasGadget, 10, 10, imgW, imgH, #PB_Canvas_Keyboard | #PB_Canvas_Border)
  
  
  
  FrameGadget(#FrameOperation, imgW+20, 10, DesktopWidth(0)-imgW-30, 100, "Операции")
  ButtonGadget(#ButtonOpenImage, imgW+30, 40, 110, 30, "Открыть") 
  ButtonGadget(#buttonSave, imgW+140, 40, 110, 30, "Сохранить")
  ButtonGadget(#ButtonEraseAll, imgW+30, 70, 110, 30, "Очистить")
  
  FrameGadget(#FrameInfo, imgW+20, 120, DesktopWidth(0)-imgW-30, 400, "Инфо")
  ButtonGadget(#ButtonClass1, imgW+30, 150, 150, 30, "Класс 1") : StringGadget(#StringClass1, imgW+190, 150, 220, 30,"",#PB_String_ReadOnly)
  ButtonGadget(#ButtonClass2, imgW+30, 180, 150, 30, "Класс 2") : StringGadget(#StringClass2, imgW+190, 180, 220, 30,"",#PB_String_ReadOnly)
  ButtonGadget(#ButtonClass3, imgW+30, 210, 150, 30, "Класс 3") : StringGadget(#StringClass3, imgW+190, 210, 220, 30,"",#PB_String_ReadOnly)
  ButtonGadget(#ButtonClass4, imgW+30, 240, 150, 30, "Класс 4") : StringGadget(#StringClass4, imgW+190, 240, 220, 30,"",#PB_String_ReadOnly)
  ButtonGadget(#ButtonClass5, imgW+30, 270, 150, 30, "Класс 5") : StringGadget(#StringClass5, imgW+190, 270, 220, 30,"",#PB_String_ReadOnly)
  ButtonGadget(#ButtonClass6, imgW+30, 300, 150, 30, "Класс 6") : StringGadget(#StringClass6, imgW+190, 300, 220, 30,"",#PB_String_ReadOnly)
  ButtonGadget(#ButtonClass7, imgW+30, 330, 150, 30, "Класс 7") : StringGadget(#StringClass7, imgW+190, 330, 220, 30,"",#PB_String_ReadOnly)
  ButtonGadget(#ButtonClass8, imgW+30, 360, 150, 30, "Класс 8") : StringGadget(#StringClass8, imgW+190, 360, 220, 30,"",#PB_String_ReadOnly)
  ButtonGadget(#ButtonClass9, imgW+30, 390, 150, 30, "Класс 9") : StringGadget(#StringClass9, imgW+190, 390, 220, 30,"",#PB_String_ReadOnly)
  ButtonGadget(#ButtonBackGround, imgW+30, 420, 150, 30, "Фон") : StringGadget(#StringBackGround, imgW+190, 420, 220, 30,"",#PB_String_ReadOnly)
  ButtonGadget(#ButtonErase, imgW+30, 480, 150, 30, "Стереть")
  
  FrameGadget(#FrameAuthors, imgW+20, 520, DesktopWidth(0)-imgW-30, imgH-510, "")
  ButtonGadget(#ButtonAuthors, imgW+30, 540, 150, 30, "Авторы")
EndIf

;{ красим стринги под цвет классов
SetGadgetColor(#StringClass1, #PB_Gadget_BackColor, #Green)
SetGadgetColor(#StringClass2, #PB_Gadget_BackColor, #Red)
SetGadgetColor(#StringClass3, #PB_Gadget_BackColor, #Yellow)
SetGadgetColor(#StringClass4, #PB_Gadget_BackColor, RGB(0, 90, 255))
SetGadgetColor(#StringClass5, #PB_Gadget_BackColor, RGB(0, 75, 25))
SetGadgetColor(#StringClass6, #PB_Gadget_BackColor, RGB(255, 140, 0))
SetGadgetColor(#StringClass7, #PB_Gadget_BackColor, RGB(127, 255, 212))
SetGadgetColor(#StringClass8, #PB_Gadget_BackColor, RGB(238, 130, 238))
SetGadgetColor(#StringClass9, #PB_Gadget_BackColor, RGB(255, 0, 122))

SetGadgetColor(#StringBackGround, #PB_Gadget_BackColor, RGB(255, 255, 255))
;}

 
  
  
  CreateImage(#trgImg,imgW, imgH, 32 , #PB_Image_Transparent)
  
  SetActiveGadget(#CanvasGadget)
    
    crclRadius = 50
    crclColor = RGBA(0, 255, 0, 255)
    str$ = Chr(0)
    hcur = CreateCursor_(0,crclRadius,0,crclRadius*2,2,@str$, @str$) 
    SetGadgetAttribute(#CanvasGadget,#PB_Canvas_CustomCursor,hcur)
        
    mode = #PB_2DDrawing_AlphaBlend
    
    Repeat
      
      
    Event=WaitWindowEvent()
    Gadget=EventGadget()
    Type=EventType()
    Window=EventWindow()
    Menu=EventMenu()
    Timer=EventTimer()
    
;{ стираем изображение по нажатию на клавишу "СТЕРЕТЬ ВСЕ"   
    If (Gadget = #ButtonEraseAll And Type = #PB_EventType_LeftClick And Event = #PB_Event_Gadget And IsImage(#sourceImage)) Or (Event=#PB_Event_Menu And Window = #Window_0 And Menu = 102 And IsImage(#sourceImage))
      If StartDrawing(CanvasOutput(#CanvasGadget))
        FreeImage(#trgImg) : CreateImage(#trgImg,imgW, imgH, 32, #PB_Image_Transparent)
        DrawImage(ImageID(#sourceImage),0,0) ; отрисовываем
        StopDrawing()
      EndIf
    EndIf
 ;}
    
;{ КИСТЬ - операции с размером и цветом
   ; изменяем радиус кисти
   If Event = #PB_Event_Gadget And Gadget = #CanvasGadget And Type = #PB_EventType_MouseWheel
     crclRadius = crclRadius + 5*GetGadgetAttribute(#CanvasGadget, #PB_Canvas_WheelDelta)
     
     hcur = CreateCursor_(0,crclRadius,0,crclRadius*2,2,@str$, @str$)
     SetGadgetAttribute(#CanvasGadget,#PB_Canvas_CustomCursor,hcur)
   EndIf
   
   If crclRadius < 5 : crclRadius = 5 : EndIf
   
      ; изменяем цвет кисти
   If Event=#PB_Event_Menu And Window = #Window_0 And Menu=2 : crclColor = RGBA(0, 255, 0, 255) : mode = #PB_2DDrawing_AlphaBlend : EndIf
   If Event=#PB_Event_Menu And Window = #Window_0 And Menu=3 : crclColor = RGBA(255, 0, 0, 255) : mode = #PB_2DDrawing_AlphaBlend : EndIf
   If Event=#PB_Event_Menu And Window = #Window_0 And Menu=4 : crclColor = RGBA(255, 255, 0, 255) : mode = #PB_2DDrawing_AlphaBlend : EndIf
   If Event=#PB_Event_Menu And Window = #Window_0 And Menu=5 : crclColor = RGBA(0, 90, 255, 255) : mode = #PB_2DDrawing_AlphaBlend : EndIf
   If Event=#PB_Event_Menu And Window = #Window_0 And Menu=6 : crclColor = RGBA(0, 75, 25, 255) : mode = #PB_2DDrawing_AlphaBlend : EndIf
   If Event=#PB_Event_Menu And Window = #Window_0 And Menu=7 : crclColor = RGBA(255, 140, 0, 255) : mode = #PB_2DDrawing_AlphaBlend : EndIf
   If Event=#PB_Event_Menu And Window = #Window_0 And Menu=8 : crclColor = RGBA(127, 255, 212, 255) : mode = #PB_2DDrawing_AlphaBlend : EndIf
   If Event=#PB_Event_Menu And Window = #Window_0 And Menu=9 : crclColor = RGBA(238, 130, 238, 255) : mode = #PB_2DDrawing_AlphaBlend : EndIf
   If Event=#PB_Event_Menu And Window = #Window_0 And Menu=10 : crclColor = RGBA(255, 0, 122, 255) : mode = #PB_2DDrawing_AlphaBlend : EndIf


   ; стираем
   If Event=#PB_Event_Menu And Window = #Window_0 And Menu=11 : crclColor = $00000000: mode = #PB_2DDrawing_AllChannels : EndIf
   ;}
   
;{ открываем изображение
If (Gadget = #ButtonOpenImage And Event = #PB_Event_Gadget And Type = #PB_EventType_LeftClick) Or (Gadget = #CanvasGadget And Type = #PB_EventType_LeftClick And Event = #PB_Event_Gadget And path = "") Or (Event=#PB_Event_Menu And Window = #Window_0 And Menu = 100)
  Pattern$ = "TIFF (*.tif) | *.tif"
  path = OpenFileRequester("Выберите изображение", GetCurrentDirectory(),Pattern$,1)
  If path <> ""
    If FileSize(GetCurrentDirectory()+"maps\"+ReplaceString(GetFilePart(path),GetExtensionPart(path),"")+"map.png") > 0
      LoadImage(#sourceImage, path) : LoadImage(#trgImg, GetCurrentDirectory()+"maps\"+ReplaceString(GetFilePart(path),GetExtensionPart(path),"")+"map.png")
      StartDrawing(CanvasOutput(#CanvasGadget))
      ResizeImage(#sourceImage,imgW, imgH)
      DrawImage(ImageID(#sourceImage),0,0)
      
      DrawingMode(#PB_2DDrawing_AlphaBlend)
      DrawAlphaImage(ImageID(#trgImg),0,0, 150) ; накладываем новую карту
      StopDrawing()      
    Else
      FreeImage(#trgImg) :   CreateImage(#trgImg,imgW, imgH, 32, #PB_Image_Transparent)
      LoadImage(#sourceImage, path)
      StartDrawing(CanvasOutput(#CanvasGadget))
      ResizeImage(#sourceImage,imgW, imgH)
      DrawImage(ImageID(#sourceImage),0,0)
      StopDrawing()
    EndIf
  Else
    MessageRequester("Ошибка!","Выберите изображение для анализа!", #MB_ICONERROR)
  EndIf
EndIf

;}
      
;{ рисуем карты и мержим с исходником  
   If IsImage(#sourceImage)
      If Event = #PB_Event_Gadget And Gadget = #CanvasGadget
        If Type = #PB_EventType_LeftButtonDown Or (Type = #PB_EventType_MouseMove And GetGadgetAttribute(#CanvasGadget, #PB_Canvas_Buttons) & #PB_Canvas_LeftButton)
                    
          ; рисуем "карту"
          If StartDrawing(ImageOutput(#trgImg))
            DrawingMode(mode)
            x = GetGadgetAttribute(#CanvasGadget , #PB_Canvas_MouseX)
            y = GetGadgetAttribute(#CanvasGadget , #PB_Canvas_MouseY)
            Circle(x, y, crclRadius, crclColor)
            StopDrawing()
          EndIf
          
          ; переносим карту на фото слюны
          If StartDrawing(CanvasOutput(#CanvasGadget))
          ;  ResizeImage(#sourceImage,imgW, imgH) ; грузим исходное изображение
            DrawImage(ImageID(#sourceImage),0,0) ; отрисовываем
            
            DrawingMode(#PB_2DDrawing_AlphaBlend)
            DrawAlphaImage(ImageID(#trgImg),0,0, 150) ; накладываем новую карту
            StopDrawing()
          EndIf
        EndIf
      EndIf
      
      
      If (Gadget = #CanvasGadget And Event = #PB_Event_Gadget And Type = #PB_EventType_LeftButtonUp) Or (Gadget = #ButtonEraseAll And Type = #PB_EventType_LeftClick) Or (Event=#PB_Event_Menu And Window = #Window_0 And Menu = 102)
        SaveImage(#trgImg,GetCurrentDirectory()+"maps\"+ReplaceString(GetFilePart(path),GetExtensionPart(path),"")+"map.png", #PB_ImagePlugin_PNG)
        AreaCalc()
      EndIf
    EndIf
;}    

;{ обработка кнопок с классами кристаллов
If Event = #PB_Event_Gadget And Type = #PB_EventType_LeftClick
Select Gadget
  Case  #ButtonClass1
    crclColor = RGBA(0, 255, 0, 255) : mode = #PB_2DDrawing_AlphaBlend
  Case  #ButtonClass2
    crclColor = RGBA(255, 0, 0, 255) : mode = #PB_2DDrawing_AlphaBlend
  Case  #ButtonClass3
    crclColor = RGBA(255, 255, 0, 255) : mode = #PB_2DDrawing_AlphaBlend
  Case  #ButtonClass4
    crclColor = RGBA(0, 90, 255, 255) : mode = #PB_2DDrawing_AlphaBlend
  Case  #ButtonClass5
    crclColor = RGBA(0, 75, 25, 255) : mode = #PB_2DDrawing_AlphaBlend
  Case  #ButtonClass6
    crclColor = RGBA(255, 140, 0, 255) : mode = #PB_2DDrawing_AlphaBlend
  Case  #ButtonClass7
    crclColor = RGBA(127, 255, 212, 255) : mode = #PB_2DDrawing_AlphaBlend
  Case  #ButtonClass8
    crclColor = RGBA(238, 130, 238, 255) : mode = #PB_2DDrawing_AlphaBlend
  Case  #ButtonClass9
    crclColor = RGBA(255, 0, 122, 255) : mode = #PB_2DDrawing_AlphaBlend
  Case  #ButtonBackGround
    crclColor = RGBA(255, 255, 255, 255) : mode = #PB_2DDrawing_AlphaBlend
  Case #ButtonErase
    crclColor = $00000000: mode = #PB_2DDrawing_AllChannels
EndSelect
SetActiveGadget(#CanvasGadget)
EndIf
;}

;{ сохраняем результаты

If (Gadget = #buttonSave And Event = #PB_Event_Gadget And Type = #PB_EventType_LeftClick) Or (Event=#PB_Event_Menu And Window = #Window_0 And Menu = 101)
  If path
    If FileSize(GetCurrentDirectory()+"report.csv") = -1
      CreateFile(0, GetCurrentDirectory()+"report.csv")
      WriteStringN(0, "FileName"+";"+"ID"+";"+"1 class"+";"+"2 class"+";"+"3 class"+";"+"4 class"+";"+"5 class"+";"+"6 class"+";"+"7 class"+";"+"8 class"+";"+"9 class")
      CloseFile(0)
    EndIf
    OpenFile(0, GetCurrentDirectory()+"report.csv")
    FileSeek(0, Lof(0))
    WriteStringN(0, path+";"+""+";"+GetGadgetText(#StringClass1)+";"+GetGadgetText(#StringClass2)+";"+GetGadgetText(#StringClass3)+";"+GetGadgetText(#StringClass4)+";"+GetGadgetText(#StringClass5)+";"+GetGadgetText(#StringClass6)+";"+GetGadgetText(#StringClass7)+";"+GetGadgetText(#StringClass8)+";"+GetGadgetText(#StringClass9))
    CloseFile(0)
    MessageRequester("","Результаты успешно сохранены в файл "+GetCurrentDirectory()+"report.csv")
  Else
    MessageRequester("", "А что, собственно, сохранять собираемся?")
  EndIf
EndIf

;}

;{ обработка кнопки Авторы
If (Gadget = #ButtonAuthors And Type = #PB_EventType_LeftClick And Event = #PB_Event_Gadget)
  msgtext = "УО "+Chr(34)+"Витебский государственный ордена Дружбы народов медицинский университет"+Chr(34)+", 2018"+Chr(10)+Chr(10)+
            "Осочук Сергей Стефанович"+Chr(10)+
            "Яковлева Ольга Святославна"+Chr(10)+
            "Марцинкевич Александр Францевич"
  MessageRequester("Информация об авторах", msgtext, #MB_ICONINFORMATION)
EndIf
;}










If Event=#PB_Event_Menu And Window = #Window_0 And Menu=1 : End : EndIf
Until Event=#PB_Event_CloseWindow And Window = #Window_0


; IDE Options = PureBasic 5.20 beta 7 (Windows - x86)
; CursorPosition = 202
; FirstLine = 145
; Folding = R5
; EnableXP
; Executable = KrystallDraw.exe
; EnableCompileCount = 35
; EnableBuildCount = 4