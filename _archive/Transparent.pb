#iterationImg = 1000
#iterationImg2 = 1001

imgH = 200 : imgW = 200

CreateImage(#iterationImg, ImgW, imgH)
CreateImage(#iterationImg2, ImgW, imgH, 32 | #PB_Image_Transparent)


StartDrawing(ImageOutput(#iterationImg))
  DrawText(10,10,"First Image")
StopDrawing()

StartDrawing(ImageOutput(#iterationImg2))
;   DrawingMode(#PB_2DDrawing_AlphaBlend)
;   DrawText(50,50,"Second Image")
  DrawingMode(#PB_2DDrawing_AlphaBlend)
  Circle(90,90, 20, RGBA(255,0,0,255))
StopDrawing()

StartDrawing(ImageOutput(#iterationImg))
  DrawingMode(#PB_2DDrawing_AlphaBlend)
  DrawAlphaImage(ImageID(#iterationImg2),0,0,55)
StopDrawing()



;SaveImage(#iterationImg, "C:/t.jpg")
UsePNGImageEncoder() : SaveImage(#iterationImg2, "C:/t.png", #PB_ImagePlugin_PNG)
; IDE Options = PureBasic 4.60 (Windows - x86)
; CursorPosition = 17
; EnableXP