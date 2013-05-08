' Begining Technology-dependent Codes
' All number in um. 
' RF-VLSI Lab, National Chiao-Tung University.
' All Rights Reserved, 2012

Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
Set oAnsoftApp = CreateObject("AnsoftHfss.HfssScriptInterface")
Set oDesktop = oAnsoftApp.GetAppDesktop()
oDesktop.RestoreWindow
oDesktop.NewProject
Set oProject = oDesktop.GetActiveProject

oProject.InsertDesign "HFSS","ind_dual", "DrivenModal", ""
Set oDesign = oProject.SetActiveDesign("ind_dual")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")

oProject.SaveAs "E:\HFSS_API_RUN\DUAL_HFSS\HFSS_FILENAME.hfss", true
DefineNewMetal "PO",625000.0
rfvlsi_totoal_PO_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "CO",160680.52930056708
rfvlsi_totoal_CO_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL1",3.4722222222222224E7
rfvlsi_totoal_METAL1_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via1",2205419.0296156267
rfvlsi_totoal_Via1_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL2",3.2467532467532463E7
rfvlsi_totoal_METAL2_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via2",2205419.0296156267
rfvlsi_totoal_Via2_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL3",3.2467532467532463E7
rfvlsi_totoal_METAL3_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via3",2205419.0296156267
rfvlsi_totoal_Via3_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL4",3.2467532467532463E7
rfvlsi_totoal_METAL4_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via4",2205419.0296156267
rfvlsi_totoal_Via4_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL5",3.2467532467532463E7
rfvlsi_totoal_METAL5_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via5",2205419.0296156267
rfvlsi_totoal_Via5_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL6",3.2467532467532463E7
rfvlsi_totoal_METAL6_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via6",2205419.0296156267
rfvlsi_totoal_Via6_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL7",3.2467532467532463E7
rfvlsi_totoal_METAL7_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via7",3338945.0056116725
rfvlsi_totoal_Via7_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL8",5.05050505050505E7
rfvlsi_totoal_METAL8_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via8",2469135.8024691353
rfvlsi_totoal_Via8_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL9",5.88235294117647E7
rfvlsi_totoal_METAL9_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "Via9",542005.4200542006
rfvlsi_totoal_Via9_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

DefineNewMetal "METAL10",3.2840722495894913E7
rfvlsi_totoal_METAL10_ModelerObjects=0   ' tracking totaly number of created modeler objects for post-merging.

oProject.Save
rfvlsi_em_sim_piority = 0

rfvlsi_em_export = 100
rfvlsi_print_DIE=False

Set oEditor = oDesign.SetActiveEditor("3D Modeler")

Function floor(Number)
	floor=Int(Number)
End Function

function Ceil(Number)
    Ceil = Int(Number)
    if Ceil <> Number then
        Ceil = Ceil + 1
    end if
end function

Function ceiltogrid(Number)
	ceiltogrid=Ceil(Number/rfvlsi_maskgrid)*rfvlsi_maskgrid
End Function

Function floortogrid(Number)
	floortogrid=Floor(Number/rfvlsi_maskgrid)*rfvlsi_maskgrid
End Function
Function evenp(Number)
	evenp=(Number Mod 2 = 0)
End Function
Function pcRound(Number)
	pcRound=Round(Number)
End Function

Function atoi(Number)
	atoi=CInt(Number)
End Function

Function sqrt(Number)
	sqrt=sqr(Number)
End Function

Function Max(Number1, Number2)
	If (Number1>Number2) Then
		Max=Number1
	Else
		Max=Number2
	End If 
End Function

Function Min(Number1, Number2)
	If (Number1<Number2) Then
		Min=Number1
	Else
		Min=Number2
	End If 
End Function

Function cdfParseFloatString(strFloat)
        value=0.0
        if(Right(strFloat,1)="T") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e12
        Elseif (Right(strFloat,1)="G") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e9
        Elseif (Right(strFloat,1)="M") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e6
        Elseif (Right(strFloat,1)="K") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e3
        Elseif (Right(strFloat,1)="k") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e3
        Elseif (Right(strFloat,1)="m") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e-3
        Elseif (Right(strFloat,1)="u") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e-6
        Elseif (Right(strFloat,1)="n") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e-9
        Elseif (Right(strFloat,1)="p") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e-12
        Elseif (Right(strFloat,1)="f") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e-15
        Elseif (Right(strFloat,1)="a") Then
                value=CDbl(Left(strFloat,(Len(strFloat)-1)))*1e-18
        Else
                value=CDbl(Left(strFloat,(Len(strFloat))))
        End If

       cdfParseFloatString=value
End Function

Function roundtogrid(Number)
	roundtogrid=Round(Number/rfvlsi_maskgrid)*rfvlsi_maskgrid
End Function

''Drawing output functions:
Sub CMetalRect(strORIENT, iMetalIndex, fOriginX, fOriginY, fWidth, fLength, iNumX, iNumY, fSpaceX, fSpaceY)			
	For iXCreateBox=0 To (iNumX-1) 
		For iYCreateBox=0 To (iNumY-1) 
                	if((Len(Cstr(MetalName(iMetalIndex))) <> 0) AND (fWidth<>0) AND (fLength<>0) ) Then
                            oEditor.CreateBox _
                            Array("NAME:BoxParameters", _
                            "XPosition:=", cstr(rfvlsi_newOriginX(fOriginX, fOriginY, strORIENT, (iXCreateBox*(fWidth+fSpaceX)), (iYCreateBox*(fLength+fSpaceY)), rfvlsi_ORIENT_R0))&"um" , _
                            "YPosition:=", cstr(rfvlsi_newOriginY(fOriginX, fOriginY, strORIENT, (iXCreateBox*(fWidth+fSpaceX)), (iYCreateBox*(fLength+fSpaceY)), rfvlsi_ORIENT_R0))&"um" , _
                            "ZPosition:=", cstr(MetalHeight(iMetalIndex))&"um", _
                            "XSize:=", cstr(rfvlsi_newOriginX(0, 0, strORIENT, fWidth, fLength, rfvlsi_ORIENT_R0)) &"um", _
                            "YSize:=", cstr(rfvlsi_newOriginY(0, 0, strORIENT, fWidth, fLength, rfvlsi_ORIENT_R0)) &"um", _
                            "ZSize:=", cstr(MetalThickness(iMetalIndex))&"um"), _
                            Array("NAME:Attributes", _
                            "Name:=", MetalName(iMetalIndex), _
                            "Flags:=", "", _
                            "Color:=", "(132 132 193)", _
                            "Transparency:=", 0.75, _
                            "PartCoordinateSystem:=", "Global", _
                            "MaterialName:=",  MetalMaterial(iMetalIndex), _
                            "SolveInside:=", false)

                            MetalCountPlusOne iMetalIndex
                        End If
		Next
	Next
End Sub

Sub CViaRect(strORIENT, iViaIndex, fOriginX, fOriginY, fWidth, fLength, iNumX, iNumY, fSpaceX, fSpaceY)			
	For iXCreateBox=0 To (iNumX-1) 
		For iYCreateBox=0 To (iNumY-1) 
			oEditor.CreateBox _
			Array("NAME:BoxParameters", _
			"XPosition:=", cstr(rfvlsi_newOriginX(fOriginX, fOriginY, strORIENT, (iXCreateBox*(fWidth+fSpaceX)), (iYCreateBox*(fLength+fSpaceY)), rfvlsi_ORIENT_R0)) &"um", _
			"YPosition:=", cstr(rfvlsi_newOriginY(fOriginX, fOriginY, strORIENT, (iXCreateBox*(fWidth+fSpaceX)), (iYCreateBox*(fLength+fSpaceY)), rfvlsi_ORIENT_R0)) &"um", _
			"ZPosition:=", Cstr(ViaHeight(iViaIndex))&"um", _
			"XSize:=", cstr(rfvlsi_newOriginX(0, 0, strORIENT, fWidth, fLength, rfvlsi_ORIENT_R0)) &"um", _
			"YSize:=", cstr(rfvlsi_newOriginY(0, 0, strORIENT, fWidth, fLength, rfvlsi_ORIENT_R0)) &"um", _
			"ZSize:=", Cstr(ViaThickness(iViaIndex))&"um"), _
			Array("NAME:Attributes", _
			"Name:=", ViaName(iViaIndex), _
			"Flags:=", "", _
			"Color:=", "(132 132 193)", _
			"Transparency:=", 0.75, _
			"PartCoordinateSystem:=", "Global", _
			"MaterialName:=",  ViaMaterial(iViaIndex), _
			"SolveInside:=", false)

                         ViaCountPlusOne iViaIndex
		Next
	Next
End Sub

Sub CMetalPolygon(iMetalIndex,hfss_ThicknessFactor,XArray,YArray)
	Dim strPolyname
	Dim iNumPts
	iNumPts=UBound(XArray)+1
	Dim arrayPolyLinePoints
	Redim arrayPolyLinePoints(iNumPts)' staring from index 0,point1, ... , pointLast

	Dim iPts
	arrayPolyLinePoints(0)="NAME:PolylinePoints"
	For iPts=1 To (iNumPts) 
		arrayPolylinePoints(iPts)=Array("NAME:PLPoint", "X:=", XArray(iPts-1)&"um", "Y:=",  YArray(iPts-1)&"um", "Z:=", Cstr(MetalHeight(iMetalIndex))&"um")
	Next

	Dim arrayPolyLineSegments
	Redim arrayPolyLineSegments(iNumPts-1)
	arrayPolyLineSegments(0)="NAME:PolylineSegments"
	For iPts=1 To (iNumPts-1) 
		arrayPolyLineSegments(iPts)=Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", iPts-1, "NoOfPoints:=", iNumPts-2)
	Next

	idPolyShape = oEditor.CreatePolyline(Array("NAME:PolylineParameters", "IsPolylineCovered:=", true, "IsPolylineClosed:=",  true, arrayPolylinePoints, arrayPolyLineSegments), _
	Array("NAME:Attributes", "Name:=", MetalName(iMetalIndex), "Flags:=", "", "Color:=",  "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=", "", "MaterialValue:=", Chr(34)&"vacuum"&Chr(34), "SolveInside:=", true))

	oEditor.ThickenSheet Array("NAME:Selections", "Selections:=", idPolyShape, "NewPartsModelFlag:=",  _
	  "Model"), Array("NAME:SheetThickenParameters", "Thickness:=", Cstr(hfss_ThicknessFactor&MetalThickness(iMetalIndex))&"um", "BothSides:=",  _
	  false)

	oEditor.AssignMaterial Array("NAME:Selections", "Selections:=", idPolyShape), Array("NAME:Attributes", "MaterialValue:=",  _
	  Chr(34)&MetalMaterial(iMetalIndex)&Chr(34), "SolveInside:=", false)

        MetalCountPlusOne iMetalIndex
End Sub

Sub CViaPolygon(iViaIndex,hfss_ThicknessFactor,XArray,YArray)
	Dim strPolyname
	Dim iNumPts
	iNumPts=UBound(XArray)+1
	Dim arrayPolyLinePoints
	Redim arrayPolyLinePoints(iNumPts)' staring from index 0,point1, ... , pointLast

	Dim iPts
	arrayPolyLinePoints(0)="NAME:PolylinePoints"
	For iPts=1 To (iNumPts) 
		arrayPolylinePoints(iPts)=Array("NAME:PLPoint", "X:=", XArray(iPts-1)&"um", "Y:=",  YArray(iPts-1)&"um", "Z:=", Cstr(ViaHeight(iViaIndex))&"um")
	Next

	Dim arrayPolyLineSegments
	Redim arrayPolyLineSegments(iNumPts-1)
	arrayPolyLineSegments(0)="NAME:PolylineSegments"
	For iPts=1 To (iNumPts-1) 
		arrayPolyLineSegments(iPts)=Array("NAME:PLSegment", "SegmentType:=", "Line", "StartIndex:=", iPts-1, "NoOfPoints:=", iNumPts-2)
	Next

	idPolyShape = oEditor.CreatePolyline( _
	Array("NAME:PolylineParameters", _
	"IsPolylineCovered:=", true, _
	"IsPolylineClosed:=",  true, _
	arrayPolylinePoints, _
	arrayPolyLineSegments), _ 
	Array("NAME:Attributes", "Name:=", ViaName(iViaIndex), "Flags:=", "", "Color:=",  "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "UDMId:=", "", "MaterialValue:=", Chr(34)&"vacuum"&Chr(34), "SolveInside:=", true))

	oEditor.ThickenSheet Array("NAME:Selections", "Selections:=", idPolyShape, "NewPartsModelFlag:=",  _
	  "Model"), Array("NAME:SheetThickenParameters", "Thickness:=", Cstr(hfss_ThicknessFactor&ViaThickness(iViaIndex))&"um", "BothSides:=",  _
	  false)

	oEditor.AssignMaterial Array("NAME:Selections", "Selections:=", idPolyShape), Array("NAME:Attributes", "MaterialValue:=",  _
	  Chr(34)&ViaMaterial(iViaIndex)&Chr(34), "SolveInside:=", false)

       ViaCountPlusOne iViaIndex
End Sub

Sub DefineNewMetal(metal_name, conductivity)
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.AddMaterial _
    Array("NAME:" & metal_name, _
    "CoordinateSystemType:=","Cartesian",_
    "conductivity:=", conductivity)
End Sub

Sub CDielectric(dielectric_name, permitivity, conductivity, losstangent, fOriginX, fOriginY, fOriginZ, fWidth, fLength, fThickness, priority)
If (rfvlsi_em_sim_piority<=priority) Then
    Set oDefinitionManager = oProject.GetDefinitionManager()
    oDefinitionManager.AddMaterial _
        Array("NAME:" & dielectric_name, _
        "CoordinateSystemType:=","Cartesian",_
        "permittivity:=", permitivity, _
        "conductivity:=", conductivity, _
        "dielectric_loss_tangent:=", losstangent)

    oEditor.CreateBox _
            Array("NAME:BoxParameters", _
                "XPosition:=", cstr(fOriginX) & "um", _
                "YPosition:=", cstr(fOriginY) & "um", _
                "ZPosition:=", cstr(fOriginZ) & "nm", _
                "XSize:=", cstr(fWidth) &"um", _
                "YSize:=", cstr(fLength) &"um", _
                "ZSize:=", cstr(fThickness) &"nm"), _
            Array("NAME:Attributes", _
                "Name:=", dielectric_name, _
                "Flags:=", "", _
                "Color:=", "(132 132 193)", _
                "Transparency:=", 0.1, _
                "PartCoordinateSystem:=", "Global", _
                "MaterialName:=",  dielectric_name, _
                "SolveInside:=", true)
    End If
End Sub

Sub CBoundary(X0, Y0, Z0, XSize, YSize, ZSize, priority)
    If rfvlsi_em_sim_piority<= priority Then
        oEditor.CreateBox _
            Array("NAME:BoxParameters", _
            "XPosition:=", cstr(X0)&"um" , _
            "YPosition:=", cstr(Y0)&"um" , _
            "ZPosition:=", cstr(Z0)&"um", _
            "XSize:=", cstr(XSize) &"um", _
            "YSize:=", cstr(YSize) &"um", _
            "ZSize:=", cstr(ZSize) &"um"), _
            Array("NAME:Attributes", _
            "Name:=", "RadiationBoundary", _
            "Flags:=", "", _
            "Color:=", "(132 132 193)", _
            "Transparency:=", 0.05, _
            "PartCoordinateSystem:=", "Global", _
            "MaterialName:=",  "Air", _
            "SolveInside:=", True)

        Set oModule = oDesign.GetModule("BoundarySetup")
        oModule.AssignRadiation _
            Array("NAME:RadiationBoundary", _
            "Objects:=", Array("RadiationBoundary"))

        oProject.Save
    End If
End Sub

Sub CVport(portName,X1,Y1, X2, Y2, Width, strAxis, iMetalStart, iMetalStop, priority)
    If (rfvlsi_em_sim_piority<=priority) Then
        If strAxis="X" Then
            oEditor.CreateRectangle _
                Array("NAME:RectangleParameters", _
                "IsCovered:=", true, _
                "XStart:=", Cstr(X1) & "um", _
                "YStart:=", Cstr(Y1) &"um", _
                "ZStart:=", Cstr(MetalHeight(iMetalStart)) & "um", _
                "Width:=", Cstr(Width) & "um", _
                "Height:=", Cstr(MetalHeight(iMetalStop)+MetalThickness(iMetalStop)-MetalHeight(iMetalStart))&"um", _
                "WhichAxis:=", strAxis), _
                Array("NAME:Attributes", _
                "Name:=", "sheet_" &portName, _
                "Flags:=", "", _
                "Color:=", "(132 132 193)", _
                "Transparency:=", 5.000000e-001, _
                "PartCoordinateSystem:=", "Global", _
                "MaterialName:=", "vacuum", _
                "SolveInside:=", true)
        Else
            oEditor.CreateRectangle _
                Array("NAME:RectangleParameters", _
                "IsCovered:=", true, _
                "XStart:=", Cstr(X1) & "um", _
                "YStart:=", Cstr(Y1) &"um", _
                "ZStart:=", Cstr(MetalHeight(iMetalStart)) & "um", _
                "Width:=", Cstr(MetalHeight(iMetalStop)+MetalThickness(iMetalStop)-MetalHeight(iMetalStart))&"um", _
                "Height:=", Cstr(Width) & "um", _
                "WhichAxis:=", strAxis), _
                Array("NAME:Attributes", _
                "Name:=", "sheet_" &portName, _
                "Flags:=", "", _
                "Color:=", "(132 132 193)", _
                "Transparency:=", 5.000000e-001, _
                "PartCoordinateSystem:=", "Global", _
                "MaterialName:=", "vacuum", _
                "SolveInside:=", true)
        End If

        Set oModule = oDesign.GetModule("BoundarySetup")

        oModule.AssignLumpedPort Array("NAME:"&portName, "Objects:=", Array("sheet_" &portName), "RenormalizeAllTerminals:=",  _
          true, Array("NAME:Modes", Array("NAME:Mode1", "ModeNum:=", 1, "UseIntLine:=", true, Array("NAME:IntLine", "Start:=", Array( _
          Cstr((X1+X2)/2) & "um", Cstr((Y1+Y2)/2) & "um", Cstr(MetalHeight(iMetalStart)) & "um"), "End:=", Array(Cstr((X1+X2)/2) & "um",  _
          Cstr((Y1+Y2)/2) & "um", Cstr(MetalHeight(iMetalStop)+MetalThickness(iMetalStop)) & "um")), "CharImp:=", "Zpi", "RenormImp:=",  _
          "50ohm")), "ShowReporterFilter:=", false, "ReporterFilter:=", Array(true), "FullResistance:=",  _
          "50ohm", "FullReactance:=", "0ohm")

        'Below is for driven-terminal simulatoin.
        'Dim faceID 
        'faceID=oEditor.GetFaceByPosition(Array("NAME:Parameters", _
        '"BodyName:=", "sheet_" &portName, "XPosition:=", Cstr((X1+X2)/2)&"um", "YPosition:=", _
        'Cstr((Y1+Y2)/2)&"um", "ZPosition:=",  Cstr(MetalHeight(iMetalStop)+(MetalThickness(iMetalStop)-MetalHeight(iMetalStart))/2)&"um"))
        'oModule.AutoIdentifyPorts Array("NAME:Faces", faceID), false, Array("NAME:ReferenceConductors",  _
        '  MetalName(iMetalStart)), portName, true

        'oModule.AssignTerminal Array("NAME:" & portName & "_T1", "Objects:=", Array("sheet_" &portName), "ParentBndID:=",  _
        '  portName, "TerminalResistance:=", "50ohm")

        oProject.Save
    End If    
End Sub


Sub CHport(portName,X0,Y0, Width, Xi1, Yi1, Xi2,Yi2,iMetal, Axis, priority)
MsgBox Cstr(X0) & ":" & Cstr(Y0)
MsgBox Width
MsgBox Cstr(Xi1)&":"&Cstr(Yi1)
MsgBox  Cstr(Xi2)&":"&Cstr(Yi2)
    If (rfvlsi_em_sim_piority<=priority) Then
        If(Axis="X") Then
            oEditor.CreateRectangle _
                Array("NAME:RectangleParameters", _
                "IsCovered:=", true, _
                "XStart:=", Cstr(X0) & "um", _
                "YStart:=", Cstr(Y0) &"um", _
                "ZStart:=", Cstr(MetalHeight(iMetal)) & "um", _
                "Width:=", Cstr(Width) & "um", _
                "Height:=", Cstr(MetalThickness(iMetal))&"um", _
                "WhichAxis:=", Axis), _
                Array("NAME:Attributes", _
                "Name:=", "sheet_" &portName, _
                "Flags:=", "", _
                "Color:=", "(132 132 193)", _
                "Transparency:=", 5.000000e-001, _
                "PartCoordinateSystem:=", "Global", _
                "MaterialName:=", "vacuum", _
                "SolveInside:=", true)
        Else
             oEditor.CreateRectangle _
                Array("NAME:RectangleParameters", _
                "IsCovered:=", true, _
                "XStart:=", Cstr(X0) & "um", _
                "YStart:=", Cstr(Y0) &"um", _
                "ZStart:=", Cstr(MetalHeight(iMetal)) & "um", _
                "Width:=", Cstr(MetalThickness(iMetal))&"um", _
                "Height:=", Cstr(Width) & "um", _
                "WhichAxis:=", Axis), _
                Array("NAME:Attributes", _
                "Name:=", "sheet_" &portName, _
                "Flags:=", "", _
                "Color:=", "(132 132 193)", _
                "Transparency:=", 5.000000e-001, _
                "PartCoordinateSystem:=", "Global", _
                "MaterialName:=", "vacuum", _
                "SolveInside:=", true)       
        End If
        Set oModule = oDesign.GetModule("BoundarySetup")
        oModule.AssignLumpedPort Array("NAME:"&portName, "Objects:=", Array("sheet_" &portName), "RenormalizeAllTerminals:=",  _
          true, Array("NAME:Modes", Array("NAME:Mode1", "ModeNum:=", 1, "UseIntLine:=", true, Array("NAME:IntLine", "Start:=", Array( _
          Cstr(Xi1) & "um", Cstr(Yi1) & "um", Cstr(MetalHeight(iMetal)+(MetalThickness(iMetal))/2) & "um"), "End:=", Array(Cstr(Xi2) & "um",  _
          Cstr(Yi2) & "um", Cstr(MetalHeight(iMetal)+(MetalThickness(iMetal))/2) & "um")), "CharImp:=", "Zpi", "RenormImp:=",  _
          "50ohm")), "ShowReporterFilter:=", false, "ReporterFilter:=", Array(true), "FullResistance:=",  _
          "50ohm", "FullReactance:=", "0ohm")

        oProject.Save
    End If    
End Sub

Sub CHportXY(portName,X0,Y0, Width, Height, Xi1, Yi1, Xi2,Yi2,iMetal, priority)


    If (rfvlsi_em_sim_piority<=priority) Then
            oEditor.CreateRectangle _
                Array("NAME:RectangleParameters", _
                "IsCovered:=", true, _
                "XStart:=", Cstr(X0) & "um", _
                "YStart:=", Cstr(Y0) &"um", _
                "ZStart:=", Cstr(MetalHeight(iMetal)+MetalThickness(iMetal)) & "um", _
                "Width:=", Cstr(Width) & "um", _
                "Height:=", Cstr(Height)&"um", _
                "WhichAxis:=", "Z"), _
                Array("NAME:Attributes", _
                "Name:=", "sheet_" &portName, _
                "Flags:=", "", _
                "Color:=", "(132 132 193)", _
                "Transparency:=", 5.000000e-001, _
                "PartCoordinateSystem:=", "Global", _
                "MaterialName:=", "vacuum", _
                "SolveInside:=", true)

        Set oModule = oDesign.GetModule("BoundarySetup")
        oModule.AssignLumpedPort Array("NAME:"&portName, "Objects:=", Array("sheet_" &portName), "RenormalizeAllTerminals:=",  _
          true, Array("NAME:Modes", Array("NAME:Mode1", "ModeNum:=", 1, "UseIntLine:=", true, Array("NAME:IntLine", "Start:=", Array( _
          Cstr(Xi1) & "um", Cstr(Yi1) & "um", Cstr(MetalHeight(iMetal)+(MetalThickness(iMetal))) & "um"), "End:=", Array(Cstr(Xi2) & "um",  _
          Cstr(Yi2) & "um", Cstr(MetalHeight(iMetal)+(MetalThickness(iMetal))) & "um")), "CharImp:=", "Zpi", "RenormImp:=",  _
          "50ohm")), "ShowReporterFilter:=", false, "ReporterFilter:=", Array(true), "FullResistance:=",  _
          "50ohm", "FullReactance:=", "0ohm")

        oProject.Save
    End If    
End Sub

'Orientation Constant Definition:
Const rfvlsi_ORIENT_R0 = 0
Const rfvlsi_ORIENT_R90 = 1
Const rfvlsi_ORIENT_R180 = 2
Const rfvlsi_ORIENT_R270 = 3
Const rfvlsi_ORIENT_MX = 4
Const rfvlsi_ORIENT_MXR90 = 5
Const rfvlsi_ORIENT_MY = 6
Const rfvlsi_ORIENT_MYR90 = 7

Dim rfvlsiHFSS_RotateR0By
Dim rfvlsiHFSS_RotateR90By
Dim rfvlsiHFSS_RotateR180By
Dim rfvlsiHFSS_RotateR270By
Dim rfvlsiHFSS_RotateMXBy
Dim rfvlsiHFSS_RotateMXR90By
Dim rfvlsiHFSS_RotateMYBy
Dim rfvlsiHFSS_RotateMYR90By

rfvlsiHFSS_RotateR0By=Array(0,1,2,3,4,5,6,7)
rfvlsiHFSS_RotateR90By=Array(1,2,3,0,7,4,5,6)
rfvlsiHFSS_RotateR180By=Array(2,3,0,1,6,7,4,5)
rfvlsiHFSS_RotateR270By=Array(3,0,1,2,5,6,7,4)
rfvlsiHFSS_RotateMXBy=Array(4,5,6,7,0,1,2,3)
rfvlsiHFSS_RotateMXR90By=Array(5,6,7,4,3,0,1,2)
rfvlsiHFSS_RotateMYBy=Array(6,7,4,5,2,3,0,1)
rfvlsiHFSS_RotateMYR90By=Array(7,4,5,6,1,2,3,0)


Function rfvlsiHFSS_ThicknessFactor(rfvlsiHFSS_ORIENT)

	Select Case rfvlsiHFSS_ORIENT
      Case rfvlsi_ORIENT_R0
		rfvlsiHFSS_ThicknessFactor=""
      Case rfvlsi_ORIENT_R90
		rfvlsiHFSS_ThicknessFactor=""
      Case rfvlsi_ORIENT_R180
		rfvlsiHFSS_ThicknessFactor=""
      Case rfvlsi_ORIENT_R270
		rfvlsiHFSS_ThicknessFactor=""
      Case rfvlsi_ORIENT_MX
		rfvlsiHFSS_ThicknessFactor="-"
      Case rfvlsi_ORIENT_MXR90
		rfvlsiHFSS_ThicknessFactor="-"
      Case rfvlsi_ORIENT_MY
		rfvlsiHFSS_ThicknessFactor="-"
	  Case Else
		rfvlsiHFSS_ThicknessFactor="-"
   End Select

End Function

Function rfvlsi_newORIENT(orient1, orient2)
      Select Case orient2
      Case rfvlsi_ORIENT_R0
		rfvlsi_newORIENT=rfvlsiHFSS_RotateR0By(orient1)
      Case rfvlsi_ORIENT_R90
		rfvlsi_newORIENT=rfvlsiHFSS_RotateR90By(orient1)
      Case rfvlsi_ORIENT_R180
		rfvlsi_newORIENT=rfvlsiHFSS_RotateR180By(orient1)
      Case rfvlsi_ORIENT_R270
		rfvlsi_newORIENT=rfvlsiHFSS_RotateR270By(orient1)
      Case rfvlsi_ORIENT_MX
		rfvlsi_newORIENT=rfvlsiHFSS_RotateMXBy(orient1)
      Case rfvlsi_ORIENT_MXR90
		rfvlsi_newORIENT=rfvlsiHFSS_RotateMXR90By(orient1)
      Case rfvlsi_ORIENT_MY
		rfvlsi_newORIENT=rfvlsiHFSS_RotateMYBy(orient1)
	  Case Else
		rfvlsi_newORIENT=rfvlsiHFSS_RotateMYR90By(orient1)
   End Select
End Function

Function rfvlsi_newOriginX(offsetX, offsetY, offset_ORIENT, originX, originY, origin_ORIENT)
	Select Case offset_ORIENT
      Case rfvlsi_ORIENT_R0
		rfvlsi_newOriginX=offsetX+originX
      Case rfvlsi_ORIENT_R90
		rfvlsi_newOriginX=offsetX-originY
      Case rfvlsi_ORIENT_R180
		rfvlsi_newOriginX=offsetX-originX
      Case rfvlsi_ORIENT_R270
		rfvlsi_newOriginX=offsetX+originY
      Case rfvlsi_ORIENT_MX
		rfvlsi_newOriginX=offsetX+originX
      Case rfvlsi_ORIENT_MXR90
		rfvlsi_newOriginX=offsetX+originY
      Case rfvlsi_ORIENT_MY
		rfvlsi_newOriginX=offsetX-originX
	  Case Else
		rfvlsi_newOriginX=offsetX-originY
   End Select
End Function

Function rfvlsi_newOriginY(offsetX, offsetY, offset_ORIENT, originX, originY, origin_ORIENT)
	Select Case offset_ORIENT
      Case rfvlsi_ORIENT_R0
		rfvlsi_newOriginY=offsetY+originY
      Case rfvlsi_ORIENT_R90
		rfvlsi_newOriginY=offsetY+originX
      Case rfvlsi_ORIENT_R180
		rfvlsi_newOriginY=offsetY-originY
      Case rfvlsi_ORIENT_R270
		rfvlsi_newOriginY=offsetY-originX
      Case rfvlsi_ORIENT_MX
		rfvlsi_newOriginY=offsetY-originY
      Case rfvlsi_ORIENT_MXR90
		rfvlsi_newOriginY=offsetY+originX
      Case rfvlsi_ORIENT_MY
		rfvlsi_newOriginY=offsetY+originY
	  Case Else
		rfvlsi_newOriginY=offsetY-originX
   End Select
End Function
Function MetalHeight(iLayer)
	Select Case iLayer
            Case -2	'PO
                MetalHeight=0.32
            Case 0	'METAL1
                MetalHeight=0.59
            Case 1	'METAL2
                MetalHeight=0.945
            Case 2	'METAL3
                MetalHeight=1.34
            Case 3	'METAL4
                MetalHeight=1.735
            Case 4	'METAL5
                MetalHeight=2.13
            Case 5	'METAL6
                MetalHeight=2.525
            Case 6	'METAL7
                MetalHeight=2.92
            Case 7	'METAL8
                MetalHeight=3.735
            Case 8	'METAL9
                MetalHeight=5.375
            Case 9	'METAL10
                MetalHeight=9.575
	End Select
End Function

Function ViaHeight(iLayer)
	Select Case iLayer
            Case -1	'CO
                ViaHeight=0.42
            Case 0	'Via1
                ViaHeight=0.77
            Case 1	'Via2
                ViaHeight=1.165
            Case 2	'Via3
                ViaHeight=1.56
            Case 3	'Via4
                ViaHeight=1.955
            Case 4	'Via5
                ViaHeight=2.35
            Case 5	'Via6
                ViaHeight=2.745
            Case 6	'Via7
                ViaHeight=3.14
            Case 7	'Via8
                ViaHeight=4.635
            Case 8	'Via9
                ViaHeight=8.775
	End Select
End Function

Function MetalThickness(iLayer)
	Select Case iLayer
            Case -2	'PO
                MetalThickness=0.1
            Case 0	'METAL1
                MetalThickness=0.18
            Case 1	'METAL2
                MetalThickness=0.22
            Case 2	'METAL3
                MetalThickness=0.22
            Case 3	'METAL4
                MetalThickness=0.22
            Case 4	'METAL5
                MetalThickness=0.22
            Case 5	'METAL6
                MetalThickness=0.22
            Case 6	'METAL7
                MetalThickness=0.22
            Case 7	'METAL8
                MetalThickness=0.9
            Case 8	'METAL9
                MetalThickness=3.4
            Case 9	'METAL10
                MetalThickness=1.45
	End Select
End Function

Function ViaThickness(iLayer)
	Select Case iLayer
            Case -1	'CO
                ViaThickness=0.17
            Case 0	'Via1
                ViaThickness=0.175
            Case 1	'Via2
                ViaThickness=0.175
            Case 2	'Via3
                ViaThickness=0.175
            Case 3	'Via4
                ViaThickness=0.175
            Case 4	'Via5
                ViaThickness=0.175
            Case 5	'Via6
                ViaThickness=0.175
            Case 6	'Via7
                ViaThickness=0.595
            Case 7	'Via8
                ViaThickness=0.74
            Case 8	'Via9
                ViaThickness=0.8
	End Select
End Function

Function MetalMaterial(iLayer)
	Select Case iLayer
            Case -2	'PO
                MetalMaterial="PO"
            Case 0	'METAL1
                MetalMaterial="METAL1"
            Case 1	'METAL2
                MetalMaterial="METAL2"
            Case 2	'METAL3
                MetalMaterial="METAL3"
            Case 3	'METAL4
                MetalMaterial="METAL4"
            Case 4	'METAL5
                MetalMaterial="METAL5"
            Case 5	'METAL6
                MetalMaterial="METAL6"
            Case 6	'METAL7
                MetalMaterial="METAL7"
            Case 7	'METAL8
                MetalMaterial="METAL8"
            Case 8	'METAL9
                MetalMaterial="METAL9"
            Case 9	'METAL10
                MetalMaterial="METAL10"
	End Select
End Function

Function ViaMaterial(iLayer)
	Select Case iLayer
            Case -1	'CO
                ViaMaterial="CO"
            Case 0	'Via1
                ViaMaterial="Via1"
            Case 1	'Via2
                ViaMaterial="Via2"
            Case 2	'Via3
                ViaMaterial="Via3"
            Case 3	'Via4
                ViaMaterial="Via4"
            Case 4	'Via5
                ViaMaterial="Via5"
            Case 5	'Via6
                ViaMaterial="Via6"
            Case 6	'Via7
                ViaMaterial="Via7"
            Case 7	'Via8
                ViaMaterial="Via8"
            Case 8	'Via9
                ViaMaterial="Via9"
	End Select
End Function

Function MetalName(iLayer)
	Select Case iLayer
            Case -2	'PO
                MetalName="PO"
            Case 0	'METAL1
                MetalName="METAL1"
            Case 1	'METAL2
                MetalName="METAL2"
            Case 2	'METAL3
                MetalName="METAL3"
            Case 3	'METAL4
                MetalName="METAL4"
            Case 4	'METAL5
                MetalName="METAL5"
            Case 5	'METAL6
                MetalName="METAL6"
            Case 6	'METAL7
                MetalName="METAL7"
            Case 7	'METAL8
                MetalName="METAL8"
            Case 8	'METAL9
                MetalName="METAL9"
            Case 9	'METAL10
                MetalName="METAL10"
	End Select
End Function

Function ViaName(iLayer)
	Select Case iLayer
            Case -1	'CO
                ViaName="CO"
            Case 0	'Via1
                ViaName="Via1"
            Case 1	'Via2
                ViaName="Via2"
            Case 2	'Via3
                ViaName="Via3"
            Case 3	'Via4
                ViaName="Via4"
            Case 4	'Via5
                ViaName="Via5"
            Case 5	'Via6
                ViaName="Via6"
            Case 6	'Via7
                ViaName="Via7"
            Case 7	'Via8
                ViaName="Via8"
            Case 8	'Via9
                ViaName="Via9"
	End Select
End Function

Sub MetalCountPlusOne(iLayer)
	Select Case iLayer
            Case -2	'PO
                rfvlsi_totoal_PO_ModelerObjects=rfvlsi_totoal_PO_ModelerObjects+1
            Case 0	'METAL1
                rfvlsi_totoal_METAL1_ModelerObjects=rfvlsi_totoal_METAL1_ModelerObjects+1
            Case 1	'METAL2
                rfvlsi_totoal_METAL2_ModelerObjects=rfvlsi_totoal_METAL2_ModelerObjects+1
            Case 2	'METAL3
                rfvlsi_totoal_METAL3_ModelerObjects=rfvlsi_totoal_METAL3_ModelerObjects+1
            Case 3	'METAL4
                rfvlsi_totoal_METAL4_ModelerObjects=rfvlsi_totoal_METAL4_ModelerObjects+1
            Case 4	'METAL5
                rfvlsi_totoal_METAL5_ModelerObjects=rfvlsi_totoal_METAL5_ModelerObjects+1
            Case 5	'METAL6
                rfvlsi_totoal_METAL6_ModelerObjects=rfvlsi_totoal_METAL6_ModelerObjects+1
            Case 6	'METAL7
                rfvlsi_totoal_METAL7_ModelerObjects=rfvlsi_totoal_METAL7_ModelerObjects+1
            Case 7	'METAL8
                rfvlsi_totoal_METAL8_ModelerObjects=rfvlsi_totoal_METAL8_ModelerObjects+1
            Case 8	'METAL9
                rfvlsi_totoal_METAL9_ModelerObjects=rfvlsi_totoal_METAL9_ModelerObjects+1
            Case 9	'METAL10
                rfvlsi_totoal_METAL10_ModelerObjects=rfvlsi_totoal_METAL10_ModelerObjects+1
	End Select
End Sub

Sub ViaCountPlusOne(iLayer)
	Select Case iLayer
            Case -1	'CO
                rfvlsi_totoal_CO_ModelerObjects=rfvlsi_totoal_CO_ModelerObjects+1
            Case 0	'Via1
                rfvlsi_totoal_Via1_ModelerObjects=rfvlsi_totoal_Via1_ModelerObjects+1
            Case 1	'Via2
                rfvlsi_totoal_Via2_ModelerObjects=rfvlsi_totoal_Via2_ModelerObjects+1
            Case 2	'Via3
                rfvlsi_totoal_Via3_ModelerObjects=rfvlsi_totoal_Via3_ModelerObjects+1
            Case 3	'Via4
                rfvlsi_totoal_Via4_ModelerObjects=rfvlsi_totoal_Via4_ModelerObjects+1
            Case 4	'Via5
                rfvlsi_totoal_Via5_ModelerObjects=rfvlsi_totoal_Via5_ModelerObjects+1
            Case 5	'Via6
                rfvlsi_totoal_Via6_ModelerObjects=rfvlsi_totoal_Via6_ModelerObjects+1
            Case 6	'Via7
                rfvlsi_totoal_Via7_ModelerObjects=rfvlsi_totoal_Via7_ModelerObjects+1
            Case 7	'Via8
                rfvlsi_totoal_Via8_ModelerObjects=rfvlsi_totoal_Via8_ModelerObjects+1
            Case 8	'Via9
                rfvlsi_totoal_Via9_ModelerObjects=rfvlsi_totoal_Via9_ModelerObjects+1
	End Select
End Sub'This part is translated through skill-to-EM translator from *.il
rfvlsi_maskgrid=0.005

Function ViaWidthVec(iLayer)
	Select Case iLayer
		Case -1	'CO
			ViaWidthVec=0.09
		Case 0	'VIA1
			ViaWidthVec=0.1
		Case 1	'VIA2
			ViaWidthVec=0.1
		Case 2	'VIA3
			ViaWidthVec=0.1
		Case 3	'VIA4
			ViaWidthVec=0.1
		Case 4	'VIA5
			ViaWidthVec=0.1
		Case 5	'VIA6
			ViaWidthVec=0.1
		Case 6	'VIA7
			ViaWidthVec=0.36
		Case 7 	'VIA8
			ViaWidthVec=0.36
		Case Else	'RV
			ViaWidthVec=3.0
	End Select
End Function

Function ViaSpacingVec(iLayer)
	Select Case iLayer
		Case -1	'CO
			ViaSpacingVec=0.14
		Case 0	'VIA1
			ViaSpacingVec=0.13
		Case 1	'VIA2
			ViaSpacingVec=0.13
		Case 2	'VIA3
			ViaSpacingVec=0.13
		Case 3	'VIA4
			ViaSpacingVec=0.13
		Case 4	'VIA5
			ViaSpacingVec=0.13
		Case 5	'VIA6
			ViaSpacingVec=0.13
		Case 6	'VIA7
			ViaSpacingVec=0.54
		Case 7 	'VIA8
			ViaSpacingVec=0.54
		Case Else	'RV
			ViaSpacingVec=3.0
	End Select
End Function

Function ViaEncVec(iLayer)
	Select Case iLayer
		Case -1	'CO
			ViaEncVec=0.04
		Case 0	'VIA1
			ViaEncVec=0.04
		Case 1	'VIA2
			ViaEncVec=0.04
		Case 2	'VIA3
			ViaEncVec=0.04
		Case 3	'VIA4
			ViaEncVec=0.04
		Case 4	'VIA5
			ViaEncVec=0.04
		Case 5	'VIA6
			ViaEncVec=0.04
		Case 6	'VIA7
			ViaEncVec=0.08
		Case 7 	'VIA8
			ViaEncVec=0.3
		Case Else	'RV
			ViaEncVec=1.5
	End Select
End Function

Function MetalSingularEdgeFillVec(m)
	Select Case m
		Case 0, 1, 2, 3, 4, 5, 6
			returnVal = 0.5
		Case 7
			returnVal = 0.5
		Case 8
			returnVal = 2.0
		Case true
			returnVal = 3.0
	End Select
	MetalSingularEdgeFillVec = returnVal
End Function

Function drc_entry(m)
	Select Case m
		Case "co_diff"
			returnVal = 0.155
		Case "PO_S_4"
			returnVal = 0.05
		Case "co_diff_nch"
			returnVal = 0.115
		Case "co_diff_nch_25"
			returnVal = 0.135
		Case true
			returnVal = 0.2
	End Select
	drc_entry = returnVal
End Function

Function CoDiff(m)
	Select Case m
		Case "nch"
			returnVal = 0.115
		Case "pch"
			returnVal = 0.115
		Case "nch_lvt"
			returnVal = 0.115
		Case "nch_hvt"
			returnVal = 0.115
		Case "nch_25"
			returnVal = 0.135
		Case "pch_25"
			returnVal = 0.31
		Case "pch_lvt"
			returnVal = 0.2
		Case true
			returnVal = 0.2
	End Select
	CoDiff = returnVal
End Function

Function DiffWidth(m)
	Select Case m
		Case "nch"
			returnVal = 0.2
		Case "pch"
			returnVal = 0.2
		Case "nch_lvt"
			returnVal = 0.2
		Case "nch_hvt"
			returnVal = 0.2
		Case "nch_25"
			returnVal = 0.31
		Case "pch_25"
			returnVal = 0.31
		Case "pch_lvt"
			returnVal = 0.2
		Case true
			returnVal = 0.2
	End Select
	DiffWidth = returnVal
End Function


Function ImpbPP(m)
	Select Case m
		Case "nch"
			returnVal = true
		Case "pch"
			returnVal = false
		Case "nch_lvt"
			returnVal = true
		Case "nch_hvt"
			returnVal = true
		Case "nch_25"
			returnVal = true
		Case "pch_25"
			returnVal = false
		Case "pch_lvt"
			returnVal = false
		Case true
			returnVal = true
	End Select
	ImpbPP = returnVal
End Function

Function MOSYSpacing(m)
	Select Case m
		Case "nch"
			returnVal = 0.68
		Case "pch"
			returnVal = 0.68
		Case "nch_lvt"
			returnVal = 0.68
		Case "nch_hvt"
			returnVal = 0.68
		Case "nch_25"
			returnVal = 0.31
		Case "pch_lvt"
			returnVal = 0.68
		Case true
			returnVal = 0.2
	End Select
	MOSYSpacing = returnVal
End Function

Function OriginOffset(m)
	Select Case m
		Case "nch"
			returnVal = 0.1
		Case "pch"
			returnVal = 0.1
		Case "nch_lvt"
			returnVal = 0.1
		Case "nch_hvt"
			returnVal = 0.1
		Case "nch_25"
			returnVal = 0.155
		Case "pch_lvt"
			returnVal = 0.1
		Case true
			returnVal = 0.1
	End Select
	OriginOffset = returnVal
End Function

Function MinMetSpacing(m)
	Select Case m
		Case 0
			returnVal = 0.09
		Case 1, 2, 3, 4, 5, 6, 7
			returnVal = 0.1
		Case 8, 9
			returnVal = 2.0
		Case true
			returnVal = 3.0
	End Select
	MinMetSpacing = returnVal
End Function

Function MinMetWidth(m)
	Select Case m
		Case 0
			returnVal = 0.09
		Case 1, 2, 3, 4, 5, 6, 7
			returnVal = 0.1
		Case 8, 9
			returnVal = 2.0
		Case true
			returnVal = 3.0
	End Select
	MinMetWidth = returnVal
End Function

Function ViaSpacingVec(m)
	Select Case m
		Case (-1)
			returnVal = 0.14
		Case 0, 1, 2, 3, 4, 5
			returnVal = 0.13
		Case 6, 7
			returnVal = 0.54
		Case true
			returnVal = 3.0
	End Select
	ViaSpacingVec = returnVal
End Function

Function MetSpacingVec(m)
	Select Case m
		Case 1
			returnVal = 0.09
		Case 2, 3, 4, 5, 6, 7
			returnVal = 0.1
		Case 8, 9
			returnVal = 0.54
		Case true
			returnVal = 3.0
	End Select
	MetSpacingVec = returnVal
End Function

Function ViaOneRowSpacingVec(m)
	Select Case m
		Case (-1)
			returnVal = 0.11
		Case 0, 1, 2, 3, 4, 5
			returnVal = 0.1
		Case 6, 7
			returnVal = 0.34
		Case true
			returnVal = 3.0
	End Select
	ViaOneRowSpacingVec = returnVal
End Function

Function ViaEncVec(m)
	Select Case m
		Case (-1), 0, 1, 2, 3, 4, 5
			returnVal = 0.04
		Case 6
			returnVal = 0.08
		Case 7
			returnVal = 0.3
		Case true
			returnVal = 1.5
	End Select
	ViaEncVec = returnVal
End Function

Function ViaMinEncWidthVec(m, bIsLast)

	If (bIsLast) Then
		Select Case m
			Case 0
				returnVal = 0.1
			Case 1, 2, 3, 4, 5, 6
				returnVal = 0.1
			Case 7
				returnVal = 0.4
			Case 8
				returnVal = 2.0
			Case true
				returnVal = 4.5
		End Select
	Else
		Select Case m
			Case 0
				returnVal = 0.1
			Case 1, 2, 3, 4, 5
				returnVal = 0.1
			Case 6, 7
				returnVal = 0.4
			Case 7
				returnVal = 0.4
			Case true
				returnVal = 4.5
		End Select
	End If

	ViaMinEncWidthVec = returnVal
End Function

Function ViaDiagonalEncVec(m)
	Select Case m
		Case 0, 1, 2, 3, 4, 5
			returnVal = 0.06
		Case 6
			returnVal = 0.115
		Case 7
			returnVal = 0.45
		Case true
			returnVal = 2.12
	End Select
	ViaDiagonalEncVec = returnVal
End Function
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "vias"
Sub rfvlsiHFSS_Create_vias(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal Length , ByVal Width , ByVal TOP_ME , ByVal BTM_ME , ByVal bPP , ByVal conservative , ByVal x_cut , ByVal y_cut )
	PP_ext = 0.02
	NP_ext = 0.13
	NW_ENC = 0.16
	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		((TOP_ME)-(1)), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		Width, Length, 1, 1, 1.0, 1.0	
		

	'( rectOutline = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.

	If ((BTM_ME)<(1)) Then
		If (bPP) Then
			' Not using MetalVec/ViaVec, thus ignored in translation
		Else
			' Not using MetalVec/ViaVec, thus ignored in translation
			' Not using MetalVec/ViaVec, thus ignored in translation
		End If

	End If


	For m = (((BTM_ME)-(1))) to (((TOP_ME)-(2)))
		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(m), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
			(Width)-(0), (Length)-(0), 1, 1, 1.0, 1.0	
			

		enc_prime = ViaEncVec(m)

		If (conservative) Then
			enc_prime = max(ViaEncVec(m), (ViaSpacingVec(m))/(2))
		End If

		Pitch = (ViaWidthVec(m))+(ViaSpacingVec(m))
		num_Horz_Vias = floor(((((Width)-((2)*(enc_prime)))+(ViaSpacingVec(m))))/(Pitch))

		If (x_cut) Then
			num_Horz_Vias = floor((((Width)+(ViaSpacingVec(m))))/(Pitch))
		End If

		num_Horz_Vias = max(num_Horz_Vias, 1)
		num_Vert_Vias = floor(((((Length)-((2)*(enc_prime)))+(ViaSpacingVec(m))))/(Pitch))

		If (y_cut) Then
			num_Vert_Vias = floor((((Length)+(ViaSpacingVec(m))))/(Pitch))
		End If

		num_Vert_Vias = max(num_Vert_Vias, 1)
		len_Horz_Edge = roundtogrid(((((Width)-((num_Horz_Vias)*(ViaWidthVec(m))))-((((num_Horz_Vias)-(1)))*(ViaSpacingVec(m)))))/(2))
		len_Vert_Edge = roundtogrid(((((Length)-((num_Vert_Vias)*(ViaWidthVec(m))))-((((num_Vert_Vias)-(1)))*(ViaSpacingVec(m)))))/(2))

		If (((rfvlsi_em_export)=(0))) Then
			If (((num_Vert_Vias)>(0))AND ((num_Horz_Vias)>(0))) Then
				CViaRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ 
					(m), _ 
					rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, len_Horz_Edge, len_Vert_Edge, rfvlsi_ORIENT_R0), _ 
					rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, len_Horz_Edge, len_Vert_Edge, rfvlsi_ORIENT_R0), _ 
					ViaWidthVec(m), ViaWidthVec(m), num_Horz_Vias, num_Vert_Vias, ViaSpacingVec(m), ViaSpacingVec(m)
					

				'( rectHorz = )part is not translated, due to CViaRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _  returns a VOID in HFSS.
			End If

		Else
			CViaRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ 
				(m), _ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
				Width, Length, 1, 1, ViaSpacingVec(m), ViaSpacingVec(m)
				

			'( rectHorz = )part is not translated, due to CViaRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _  returns a VOID in HFSS.
		End If

	Next

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "mesh_rect"
Sub rfvlsiHFSS_Create_mesh_rect(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal Length , ByVal Width , ByVal TOP_ME , ByVal BTM_ME , ByVal len_Void , ByVal len_Fill , ByVal bPP , ByVal bEMExportSimplification )
	Pitch = (len_Void)+(len_Fill)
	num_Horz_Holes = floor((((Width)-(len_Fill)))/(Pitch))
	num_Vert_Holes = floor((((Length)-(len_Fill)))/(Pitch))

	If ((bEMExportSimplification)AND (((rfvlsi_em_export)<>(0)))) Then
		num_Horz_Holes = 0
		num_Vert_Holes = 0
	End If

	len_Horz_Edge = roundtogrid(((((Width)-((num_Horz_Holes)*(len_Void)))-((((num_Horz_Holes)-(1)))*(len_Fill))))/(2))
	len_Vert_Edge = roundtogrid(((((Length)-((num_Vert_Holes)*(len_Void)))-((((num_Vert_Holes)-(1)))*(len_Fill))))/(2))
	delta_Horz = (len_Horz_Edge)-(len_Fill)
	delta_Vert = (len_Vert_Edge)-(len_Fill)

	If (((num_Horz_Holes)<(1))) Then
		len_Horz_Edge = Width
	End If


	If (((num_Vert_Holes)<(1))) Then
		len_Vert_Edge = Length
	End If

	' No output for: master=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
		(((TOP_ME)-(1))), _ 
		rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ 
		len_Horz_Edge, Length, 1, 1, 1.0, 1.0	
		

	'( rectHorz1 = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.

	If (((num_Vert_Holes)>(0))) Then
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, len_Vert_Edge, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, len_Vert_Edge, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			((Length)-((2)*(len_Vert_Edge))), len_Horz_Edge, TOP_ME, BTM_ME, bPP, True, False, False
	End If


	If (((num_Horz_Holes)>(0))) Then
		If ((((num_Horz_Holes)>(1)))AND (((num_Vert_Holes)>(0)))) Then
			For n = (1) to (((num_Horz_Holes)-(1)))
				rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((delta_Horz)+((Pitch)*(n))), len_Vert_Edge, rfvlsi_ORIENT_R0), _
					rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((delta_Horz)+((Pitch)*(n))), len_Vert_Edge, rfvlsi_ORIENT_R0), _	
					rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
					((Length)-((2)*(len_Vert_Edge))), len_Fill, TOP_ME, BTM_ME, bPP, True, False, False
			Next

		End If

		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(((TOP_ME)-(1))), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Width)-(len_Horz_Edge)), 0, rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((Width)-(len_Horz_Edge)), 0, rfvlsi_ORIENT_R0), _ 
			len_Horz_Edge, Length, 1, 1, 1.0, 1.0	
			

		'( rectHorzN = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	End If

	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		len_Vert_Edge, Width, TOP_ME, BTM_ME, bPP, True, False, False
	'( inst = )part is not translated, due to rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	' No output for: rectVert1=rodGetObj(inst), but is internally processed.

	For m = (((BTM_ME)-(1))) to (((TOP_ME)-(1)))
		If (((num_Vert_Holes)>(0))) Then
			If (((num_Vert_Holes)>(1))) Then
				CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
					(m), _ 
					rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, ((len_Vert_Edge)+(len_Void)), rfvlsi_ORIENT_R0), _ 
					rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, ((len_Vert_Edge)+(len_Void)), rfvlsi_ORIENT_R0), _ 
					Width, len_Fill, 1, ((num_Vert_Holes)-(1)), 1.0, len_Void	
					

				'( rectVert = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
			End If

			CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
				(m), _ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _ 
				Width, len_Vert_Edge, 1, 1, 1.0, 1.0	
				

			'( rectVertN = )part is not translated, due to CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
		End If

	Next


	If ((num_Vert_Holes)>(0)) Then
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((Width)-(len_Horz_Edge)), len_Vert_Edge, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((Width)-(len_Horz_Edge)), len_Vert_Edge, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			((Length)-((2)*(len_Vert_Edge))), len_Horz_Edge, TOP_ME, BTM_ME, bPP, True, False, False
		'( inst2 = )part is not translated, due to rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((Width)-(len_Horz_Edge)), len_Vert_Edge, rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
		' No output for: rodinst2=rodGetObj(inst2), but is internally processed.
		' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	End If

	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		len_Vert_Edge, Width, TOP_ME, BTM_ME, bPP, True, False, False
	'( inst3 = )part is not translated, due to rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((Length)-(len_Vert_Edge)), rfvlsi_ORIENT_R0), _ returns a VOID in HFSS.
	' No output for: rodinst3=rodGetObj(inst3), but is internally processed.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
	' rodAssignHandleToParameter is skipped in translation output, and not processed at all.
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_em_gr"
Sub rfvlsiHFSS_Create_base_em_gr(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal W , ByVal L , ByVal LW , ByVal boundary_ext , ByVal priority )
	' No output for: m_base_em_bc=dbOpenCellViewByType(pcCellView~>lib"base_em_bc""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_em_bc rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		W, L, LW, boundary_ext, priority
	'Create a radiation boundary
	CBoundary (((((-(W)))/(2))-(boundary_ext))-(LW)),(((((-(L)))/(2))-(boundary_ext))-(LW)),(-(300.0)),(((W)+((2)*(boundary_ext)))+((2)*(LW))),(((L)+((2)*(boundary_ext)))+((2)*(LW))),600.0, priority

	rfvlsi_print_DIE=True
	CDielectric "Substrate", 11.9, 1, 10.0, (((((-(W)))/(2))-((boundary_ext)*(0.9)))-(LW)), (((((-(L)))/(2))-((boundary_ext)*(0.9)))-(LW)), -250000.0, (((W)+((boundary_ext)*(1.8)))+((2)*(LW))), (((L)+((boundary_ext)*(1.8)))+((2)*(LW))), 250000.0, priority
	CDielectric "FOX", 3.28174467495264, 1, 0.0, (((((-(W)))/(2))-((boundary_ext)*(0.9)))-(LW)), (((((-(L)))/(2))-((boundary_ext)*(0.9)))-(LW)), 0.0, (((W)+((boundary_ext)*(1.8)))+((2)*(LW))), (((L)+((boundary_ext)*(1.8)))+((2)*(LW))), 3140.0, priority
	CDielectric "IMD_7c", 4.491322366879034, 1, 0.0, (((((-(W)))/(2))-((boundary_ext)*(0.9)))-(LW)), (((((-(L)))/(2))-((boundary_ext)*(0.9)))-(LW)), 3140.0, (((W)+((boundary_ext)*(1.8)))+((2)*(LW))), (((L)+((boundary_ext)*(1.8)))+((2)*(LW))), 7435.0, priority
	oProject.Save


End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_em_bc"
Sub rfvlsiHFSS_Create_base_em_bc(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal W , ByVal L , ByVal LW , ByVal boundary_ext , ByVal priority )
	'Create a radiation boundary
	CBoundary (((((-(W)))/(2))-(boundary_ext))-(LW)),(((((-(L)))/(2))-(boundary_ext))-(LW)),(-(300.0)),(((W)+((2)*(boundary_ext)))+((2)*(LW))),(((L)+((2)*(boundary_ext)))+((2)*(LW))),600.0, priority

	rfvlsi_print_DIE=True
	CDielectric "Substrate", 11.9, 1, 10.0, (((((-(W)))/(2))-((boundary_ext)*(0.9)))-(LW)), (((((-(L)))/(2))-((boundary_ext)*(0.9)))-(LW)), -250000.0, (((W)+((boundary_ext)*(1.8)))+((2)*(LW))), (((L)+((boundary_ext)*(1.8)))+((2)*(LW))), 250000.0, priority
	CDielectric "FOX", 3.28174467495264, 1, 0.0, (((((-(W)))/(2))-((boundary_ext)*(0.9)))-(LW)), (((((-(L)))/(2))-((boundary_ext)*(0.9)))-(LW)), 0.0, (((W)+((boundary_ext)*(1.8)))+((2)*(LW))), (((L)+((boundary_ext)*(1.8)))+((2)*(LW))), 3140.0, priority
	CDielectric "IMD_7c", 4.491322366879034, 1, 0.0, (((((-(W)))/(2))-((boundary_ext)*(0.9)))-(LW)), (((((-(L)))/(2))-((boundary_ext)*(0.9)))-(LW)), 3140.0, (((W)+((boundary_ext)*(1.8)))+((2)*(LW))), (((L)+((boundary_ext)*(1.8)))+((2)*(LW))), 7435.0, priority
	oProject.Save


End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_lead"
Sub rfvlsiHFSS_Create_base_lead(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal L , ByVal W , ByVal WD , ByVal PINTXT , ByVal PINP , ByVal TOP_ME , ByVal BTM_ME , ByVal DUMMYL , ByVal DUMMYP , ByVal dummy )
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		W, L, atoi(TOP_ME), atoi(BTM_ME), True, True, False, False

	If (dummy) Then
		' Not using MetalVec/ViaVec, thus ignored in translation

		For m = (((atoi(BTM_ME))-(1))) to (((atoi(TOP_ME))-(1)))
			' Not using MetalVec/ViaVec, thus ignored in translation
		Next

		' Not using MetalVec/ViaVec, thus ignored in translation
		' dbCreateLabel is skipped in translation output, and not processed at all.
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_lead_pair"
Sub rfvlsiHFSS_Create_base_lead_pair(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal W , ByVal OPENING , ByVal LEAD , ByVal TOP_ME , ByVal LEAD_ME , ByVal dummy , ByVal P1TXT , ByVal N1TXT )
	' No output for: m_lead=dbOpenCellViewByType(pcCellView~>lib"base_lead""layout"), but is internally processed.
	' No output for: m_vias=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	TM = atoi(TOP_ME)
	LM = atoi(LEAD_ME)
	rfvlsiHFSS_Create_base_lead rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, OPENING, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, OPENING, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		LEAD, W, 1.0, P1TXT, "dummy1", LEAD_ME, LEAD_ME, "RFVLSI", "drawing", dummy
	rfvlsiHFSS_Create_base_lead rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OPENING)))-(W), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OPENING)))-(W), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		LEAD, W, 1.0, N1TXT, "dummy1", LEAD_ME, LEAD_ME, "RFVLSI", "drawing", dummy

	If ((TM)<>(LM)) Then
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, OPENING, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, OPENING, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			W, W, TM, LM, True, True, False, False
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OPENING)))-(W), rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OPENING)))-(W), rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			W, W, TM, LM, True, True, False, False
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_xfm_cross"
Sub rfvlsiHFSS_Create_base_xfm_cross(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal WI , ByVal WO , ByVal S , ByVal TOP_ME , ByVal BTM_ME , ByVal dummy , ByVal viat , ByVal viad , ByVal top )
	pi = 3.141592
	C = ceiltogrid(((WO)*(tan((pi)/(8))))+(0.005))
	C2 = ceiltogrid((C)/(sqrt(2)))
	OOCH = (((WO)+(S))+((WI)/(2)))-(C2)

	If ((((2)*(S))+(WI))<=((2.0)*(sqrt(2.0)))) Then
		OOCHD = ceiltogrid(((2.01)*(sqrt(2.0)))-(WI))
	Else
		OOCHD = 0.0
	End If

	' No output for: masterxdiag=dbOpenCellViewByType(pcCellView~>lib"base_ind_diag""layout"), but is internally processed.

	If (top) Then
		rfvlsiHFSS_Create_base_ind_diag rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			WO, ((2)*(S))+(WI), TOP_ME
	Else
		rfvlsiHFSS_Create_base_ind_diag rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			WO, ((2)*(S))+(WI), BTM_ME
	End If

	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OOCH)))-(OOCHD), rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, ((-(OOCH)))-(OOCHD), rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		WO, WO, TOP_ME, BTM_ME, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((WI)+(WO))+((2)*(S)), (OOCH)+(OOCHD), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((WI)+(WO))+((2)*(S)), (OOCH)+(OOCHD), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		WO, WO, TOP_ME, BTM_ME, True, True, False, False
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_oct_quad"
Sub rfvlsiHFSS_Create_base_oct_quad(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal OP , ByVal MET )
	pi = 3.141592
	C = ceiltogrid(((W)*(tan((pi)/(8))))+(0.005))
	DIV = (2)+(sqrt(2))
	A = roundtogrid((OD)/(DIV))
	B = (OD)-((2)*(A))
	BA = floortogrid(((B)/(2))-(0.005))
	BB = (B)-(BA)

	If ((OP)>(BA)) Then
		CMetalPolygon ((MET)-(1)), _
			rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
			Array(_
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (W)+(BA) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)/(2) , ((W)/(2))+(BA) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)/(2) , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (A)+(C) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, A , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (W)+(BA) , rfvlsi_ORIENT_R0)), _
			Array(_
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (W)+(BA) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)/(2) , ((W)/(2))+(BA) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)/(2) , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (A)+(C) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, A , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (W)+(BA) , rfvlsi_ORIENT_R0)) 

	Else
		CMetalPolygon ((MET)-(1)), _
			rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
			Array(_
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , BA , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , OP , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , OP , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (A)+(C) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, A , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , BA , rfvlsi_ORIENT_R0)), _
			Array(_
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , BA , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , OP , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , OP , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (BA)-(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (A)+(C) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , ((BA)+(A))-(W) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OD)/(2) , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, A , (BA)+(A) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , BA , rfvlsi_ORIENT_R0)) 

	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_oct_half"
Sub rfvlsiHFSS_Create_base_oct_half(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal LOP , ByVal ROP , ByVal MET )
	' No output for: m_base_oct_quad=dbOpenCellViewByType(pcCellView~>lib"base_oct_quad""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_oct_quad rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(OD)))/(2)), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(OD)))/(2)), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, LOP, MET
	rfvlsiHFSS_Create_base_oct_quad rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)/(2)), 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)/(2)), 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		OD, W, ROP, MET
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_oct"
Sub rfvlsiHFSS_Create_base_oct(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal LOP , ByVal ROP , ByVal MET )
	' No output for: m_base_oct_quad=dbOpenCellViewByType(pcCellView~>lib"base_oct_half""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_oct_half rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, LOP, ROP, MET
	rfvlsiHFSS_Create_base_oct_half rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		OD, W, LOP, ROP, MET
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_oct_quad_fill"
Sub rfvlsiHFSS_Create_base_oct_quad_fill(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal OP , ByVal MET , ByVal layer , ByVal purp )
	pi = 3.141592
	C = ceiltogrid(((W)*(tan((pi)/(8))))+(0.005))
	DIV = (2)+(sqrt(2))
	A = roundtogrid((OD)/(DIV))
	B = (OD)-((2)*(A))
	BA = floortogrid(((B)/(2))-(0.005))
	BB = (B)-(BA)
	' Not using MetalVec/ViaVec, thus ignored in translation
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_oct_half_fill"
Sub rfvlsiHFSS_Create_base_oct_half_fill(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal LOP , ByVal ROP , ByVal MET , ByVal layer , ByVal purp )
	' No output for: m_base_oct_quad_fill=dbOpenCellViewByType(pcCellView~>lib"base_oct_quad_fill""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_oct_quad_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(OD)))/(2)), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(OD)))/(2)), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, ROP, MET, layer, purp
	rfvlsiHFSS_Create_base_oct_quad_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)/(2)), 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((OD)/(2)), 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		OD, W, LOP, MET, layer, purp
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_oct_fill"
Sub rfvlsiHFSS_Create_base_oct_fill(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal LOP , ByVal ROP , ByVal MET , ByVal layer , ByVal purp )
	' No output for: m_base_oct_fill=dbOpenCellViewByType(pcCellView~>lib"base_oct_half_fill""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_oct_half_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, 0.0, 0.0, MET, layer, purp
	rfvlsiHFSS_Create_base_oct_half_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		OD, W, 0.0, 0.0, MET, layer, purp
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_ind_hud_cross"
Sub rfvlsiHFSS_Create_base_ind_hud_cross(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal S , ByVal OPENING , ByVal TOP_ME , ByVal BTM_ME , ByVal under , ByVal dummy , ByVal DUMMYL )
	P = (W)+(S)

	If (((atoi(TOP_ME))-(atoi(BTM_ME)))<(2)) Then
		via_to_next = False
	End If

	pi = 3.141592
	C = roundtogrid((W)*(tan((pi)/(8))))
	C2 = roundtogrid((C)/(sqrt(2)))
	OO = ((2)*(W))+(S)
	OOC = (((2)*(W))+(S))-((2)*(C2))
	OOCH = (OOC)/(2)
	' No output for: m_base_oct=dbOpenCellViewByType(pcCellView~>lib"base_oct""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_oct rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, ((OOCH)+(roundtogrid(((2)*(sqrt(2.0)))-(S))))+(0.01), OPENING, 9

	If (under) Then
		rfvlsiHFSS_Create_base_xfm_cross rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(OD)))/(2)), 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((-(OD)))/(2)), 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			S, W, 0.0, atoi(TOP_ME), (atoi(TOP_ME))-(1), dummy, True, True, False
		rfvlsiHFSS_Create_base_xfm_cross rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((((-(OD)))/(2))+(P))+(W)), 0, rfvlsi_ORIENT_MY), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((((-(OD)))/(2))+(P))+(W)), 0, rfvlsi_ORIENT_MY), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
			S, W, 0.0, atoi(TOP_ME), atoi(TOP_ME), dummy, False, False, False
	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "ind_sym"
Sub rfvlsiHFSS_Create_ind_sym(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal OPENING , ByVal LEAD , ByVal S , ByVal NT , ByVal strName , ByVal NT_N , ByVal dummy )
	P = (W)+(S)
	DUMMYL = "RFVLSI"
	' No output for: m_lead_pair=dbOpenCellViewByType(pcCellView~>lib"base_lead_pair""layout"), but is internally processed.
	' No output for: m_base_em_gr=dbOpenCellViewByType(pcCellView~>lib"base_em_gr""layout"), but is internally processed.
	' No output for: m_vias=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	' No output for: m_base_ind_hud_cross=dbOpenCellViewByType(pcCellView~>lib"base_ind_hud_cross""layout"), but is internally processed.
	' No output for: m_oct=dbOpenCellViewByType(pcCellView~>lib"base_oct""layout"), but is internally processed.
	' No output for: m_base_oct_fill=dbOpenCellViewByType(pcCellView~>lib"base_oct_fill""layout"), but is internally processed.
	rfvlsiHFSS_Create_base_oct_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, 5.0, 0.0, 0.0, 9, "RFVLSI", "drawing"
	rfvlsiHFSS_Create_base_oct_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, 5.0, 0.0, 0.0, 9, "RFVLSI_LVS", "dummy8"
	rfvlsiHFSS_Create_base_oct_fill rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, 5.0, 0.0, 0.0, 9, "RFVLSI_LVS", "dummy9"


	If ((NT)>(2)) Then
		For i = (1) to ((NT)-(2))
			If (evenp(i)) Then
				rfvlsiHFSS_Create_base_ind_hud_cross rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
					rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
					rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
					(OD)-(((2)*(i))*(P)), W, S, (2)*(W), "9", "8", True, True, "RFVLSI"
			Else
				rfvlsiHFSS_Create_base_ind_hud_cross rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MY), _
					rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_MY), _	
					rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
					(OD)-(((2)*(i))*(P)), W, S, (2)*(W), "9", "8", True, True, "RFVLSI"
			End If

		Next
	End If

	rfvlsiHFSS_Create_base_ind_hud_cross rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, S, OPENING, "9", "8", True, True, "RFVLSI"

	If (evenp(NT)) Then
		rfvlsiHFSS_Create_base_ind_hud_cross rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			(OD)-(((2)*(((NT)-(1))))*(P)), W, S, 0, "9", "8", False, True, "RFVLSI"
	Else
		rfvlsiHFSS_Create_base_oct rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			(OD)-(((2)*(((NT)-(1))))*(P)), W, 0.0, (2)*(W), 9
	End If

	rfvlsiHFSS_Create_base_lead_pair rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)/(2), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (OD)/(2), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		W, OPENING, LEAD, "9", "9", dummy, "P1", "N1"	
End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "base_ind_diag"
Sub rfvlsiHFSS_Create_base_ind_diag(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal W , ByVal S , ByVal MET )
	pi = 3.141592
	P = (S)+(W)
	C = ceiltogrid(((W)*(tan((pi)/(8))))+(0.005))
	C2 = ceiltogrid((C)/(sqrt(2)))
	OO = ((2)*(W))+(S)
	OOC = (((2)*(W))+(S))-((2)*(C2))
	OOCH = (OOC)/(2)

	If ((S)<=((2.0)*(sqrt(2)))) Then
		CMetalPolygon ((MET)-(1)), _
			rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
			Array(_
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , ((-(OOCH)))+(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (-(((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (-(((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (-(OOCH)) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)+(P) , ((-(OOCH)))+(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, OO , ((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OO)-(W) , ((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, P , (((-(OOCH)))+(C))+(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , ((-(OOCH)))+(C) , rfvlsi_ORIENT_R0)), _
			Array(_
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , ((-(OOCH)))+(C) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (-(((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (-(((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (-(OOCH)) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)+(P) , ((-(OOCH)))+(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, OO , ((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (OO)-(W) , ((OOCH)+(ceiltogrid(((2.01)*(sqrt(2.0)))-(S)))) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, P , (((-(OOCH)))+(C))+(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , ((-(OOCH)))+(C) , rfvlsi_ORIENT_R0)) 

	Else
		CMetalPolygon ((MET)-(1)), _
			rfvlsiHFSS_ThicknessFactor(rfvlsi_PCellOffsetORIENT), _
			Array(_
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (OOCH)-(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (-(OOCH)) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (-(OOCH)) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)+(P) , ((-(OOCH)))+(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, OO , OOCH , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, P , OOCH , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (OOCH)-(P) , rfvlsi_ORIENT_R0)), _
			Array(_
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (OOCH)-(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (-(OOCH)) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, W , (-(OOCH)) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (W)+(P) , ((-(OOCH)))+(P) , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, OO , OOCH , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, P , OOCH , rfvlsi_ORIENT_R0),_ 
				rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, 0 , (OOCH)-(P) , rfvlsi_ORIENT_R0)) 

	End If

End Sub
' This source code is generated by NCTU RFVLSI Lab SKILL -> HFSS VBscript translator.
' This SKILL/HFSS VBsciprt Translator is a intellectual property of RFVLSI Lab, NCTU, Taiwan
' All rights reserved. 2012-2013. Confidential, and intended for internal use only. 

strCellName = "ind_dual"
Sub rfvlsiHFSS_Create_ind_dual(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ByVal OD , ByVal W , ByVal SS_Gap1 , ByVal SG_Gap1 , ByVal SS_Gap2 , ByVal SG_Gap2 , ByVal LEAD , ByVal S , ByVal NT , ByVal strName , ByVal NT_N , ByVal short1 , ByVal gnd1 , ByVal sig1 , ByVal sig2 , ByVal short2 , ByVal gnd2 , ByVal GND_ME )
	P = (W)+(S)
	DUMMYL = "RFVLSI"
	lead_length = ((2)*(MinMetSpacing(8)))+(W)
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' dbCreateLabel is skipped in translation output, and not processed at all.
	' No output for: m_ind_sym=dbOpenCellViewByType(pcCellView~>lib"ind_sym""layout"), but is internally processed.
	' No output for: m_base_em_bc=dbOpenCellViewByType(pcCellView~>lib"base_em_bc""layout"), but is internally processed.
	' No output for: m_vias=dbOpenCellViewByType(pcCellView~>lib"vias""layout"), but is internally processed.
	' No output for: m_lead=dbOpenCellViewByType(pcCellView~>lib"base_lead""layout"), but is internally processed.
	' No output for: m_mesh_rect=dbOpenCellViewByType(pcCellView~>lib"mesh_rect""layout"), but is internally processed.
	rfvlsiHFSS_Create_ind_sym rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((((((-(OD)))/(2))-(lead_length))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2)))-(W)), 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((((((-(OD)))/(2))-(lead_length))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2)))-(W)), 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		OD, W, 4.0, lead_length, S, NT, "ind_sym", NT_N, False
	rfvlsiHFSS_Create_ind_sym rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((((OD)/(2))+(lead_length))+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2)))+(W)), 0, rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((((OD)/(2))+(lead_length))+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2)))+(W)), 0, rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		OD, W, 4.0, lead_length, S, NT, "ind_sym", NT_N, False

	If (gnd1) Then
		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(8), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), (-(4.0)), rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), (-(4.0)), rfvlsi_ORIENT_R0), _ 
			(((((-(2)))*(W))-(SG_Gap1))-((SS_Gap1)/(2)))-((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), (((-(4.0)))-(W))-((-(4.0))), 1, 1, 1.0, 1.0	
			

		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(8), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))), (-(4.0)), rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))), (-(4.0)), rfvlsi_ORIENT_R0), _ 
			((((2)*(W))+((SS_Gap1)/(2)))+(SG_Gap1))-(((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))), (((-(4.0)))-(W))-((-(4.0))), 1, 1, 1.0, 1.0	
			

		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((-(W)))-((SS_Gap1)/(2)))-(SG_Gap1)), (-(4.0)), rfvlsi_ORIENT_R180), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((-(W)))-((SS_Gap1)/(2)))-(SG_Gap1)), (-(4.0)), rfvlsi_ORIENT_R180), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R180),_
			((W)+((2)*(MinMetSpacing(8)))), W, 9, GND_ME, True, True, False, False
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((W)+((SS_Gap1)/(2)))+(SG_Gap1)), (-(4.0)), rfvlsi_ORIENT_MX), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((W)+((SS_Gap1)/(2)))+(SG_Gap1)), (-(4.0)), rfvlsi_ORIENT_MX), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
			((W)+((2)*(MinMetSpacing(8)))), W, 9, GND_ME, True, True, False, False
	End If


	If (sig1) Then
		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(8), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), (-(4.0)), rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), (-(4.0)), rfvlsi_ORIENT_R0), _ 
			(((-(SS_Gap1)))/(2))-((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), (((-(4.0)))-(W))-((-(4.0))), 1, 1, 1.0, 1.0	
			

		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(8), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))), (-(4.0)), rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))), (-(4.0)), rfvlsi_ORIENT_R0), _ 
			((SS_Gap1)/(2))-(((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))), (((-(4.0)))-(W))-((-(4.0))), 1, 1, 1.0, 1.0	
			

	End If


	If (short1) Then
		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(8), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), (-(4.0)), rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), (-(4.0)), rfvlsi_ORIENT_R0), _ 
			(((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2)))-((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), (((-(4.0)))-(W))-((-(4.0))), 1, 1, 1.0, 1.0	
			

	End If

	rfvlsiHFSS_Create_mesh_rect rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((-(W)))-(SG_Gap1))-((SS_Gap1)/(2))), ((((-(OD)))/(2))-(LEAD)), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((-(W)))-(SG_Gap1))-((SS_Gap1)/(2))), ((((-(OD)))/(2))-(LEAD)), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		((((((OD)/(2))+(LEAD))-(4.0))-((2)*(MinMetSpacing(8))))-(W)), ((((2)*(W))+(SS_Gap1))+((2)*(SG_Gap1))), GND_ME, GND_ME, 2.0, 1.0, True, True

	If (short2) Then
		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(8), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((-(W)))-((2)*(max(SG_Gap1, SG_Gap2))))-((max(SS_Gap1, SS_Gap2))/(2))), 4.0, rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((-(W)))-((2)*(max(SG_Gap1, SG_Gap2))))-((max(SS_Gap1, SS_Gap2))/(2))), 4.0, rfvlsi_ORIENT_R0), _ 
			(((W)+((2)*(max(SG_Gap1, SG_Gap2))))+((max(SS_Gap1, SS_Gap2))/(2)))-((((-(W)))-((2)*(max(SG_Gap1, SG_Gap2))))-((max(SS_Gap1, SS_Gap2))/(2))), ((4.0)+(W))-(4.0), 1, 1, 1.0, 1.0	
			

	End If


	If (sig2) Then
		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(8), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), 4.0, rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), 4.0, rfvlsi_ORIENT_R0), _ 
			(((-(SS_Gap2)))/(2))-((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), ((4.0)+(W))-(4.0), 1, 1, 1.0, 1.0	
			

		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(8), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))), 4.0, rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))), 4.0, rfvlsi_ORIENT_R0), _ 
			((SS_Gap2)/(2))-(((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))), ((4.0)+(W))-(4.0), 1, 1, 1.0, 1.0	
			

	End If


	If (gnd2) Then
		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(8), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), 4.0, rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, ((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), 4.0, rfvlsi_ORIENT_R0), _ 
			(((((-(2)))*(W))-(SG_Gap2))-((SS_Gap2)/(2)))-((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))), ((4.0)+(W))-(4.0), 1, 1, 1.0, 1.0	
			

		CMetalRect rfvlsi_newORIENT(rfvlsi_PCellOffsetORIENT, rfvlsi_ORIENT_R0), _
			(8), _ 
			rfvlsi_newOriginX(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))), 4.0, rfvlsi_ORIENT_R0), _ 
			rfvlsi_newOriginY(rfvlsi_PCellOffsetX0, rfvlsi_PCellOffsetY0, rfvlsi_PCellOffsetORIENT, (((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))), 4.0, rfvlsi_ORIENT_R0), _ 
			((((2)*(W))+((SS_Gap2)/(2)))+(SG_Gap2))-(((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))), ((4.0)+(W))-(4.0), 1, 1, 1.0, 1.0	
			

		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((-(W)))-((SS_Gap2)/(2)))-(SG_Gap2)), 4.0, rfvlsi_ORIENT_MY), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((-(W)))-((SS_Gap2)/(2)))-(SG_Gap2)), 4.0, rfvlsi_ORIENT_MY), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
			((W)+((2)*(MinMetSpacing(8)))), W, 9, GND_ME, True, True, False, False
		rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((W)+((SS_Gap2)/(2)))+(SG_Gap2)), 4.0, rfvlsi_ORIENT_R0), _
			rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((W)+((SS_Gap2)/(2)))+(SG_Gap2)), 4.0, rfvlsi_ORIENT_R0), _	
			rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
			((W)+((2)*(MinMetSpacing(8)))), W, 9, GND_ME, True, True, False, False
	End If

	rfvlsiHFSS_Create_mesh_rect rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((-(W)))-(SG_Gap2))-((SS_Gap2)/(2))), (((OD)/(2))+(LEAD)), rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((-(W)))-(SG_Gap2))-((SS_Gap2)/(2))), (((OD)/(2))+(LEAD)), rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		((((((OD)/(2))+(LEAD))-(4.0))-((2)*(MinMetSpacing(8))))-(W)), ((((2)*(W))+(SS_Gap2))+((2)*(SG_Gap2))), GND_ME, GND_ME, 2.0, 1.0, True, True
	rfvlsiHFSS_Create_mesh_rect rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((((-(2)))*(W))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap2, SS_Gap1))/(2))), ((((-(4.0)))-((2)*(MinMetSpacing(8))))-(W)), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((((-(2)))*(W))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap2, SS_Gap1))/(2))), ((((-(4.0)))-((2)*(MinMetSpacing(8))))-(W)), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		(((8.0)+((4)*(MinMetSpacing(8))))+((2)*(W))), ((((4)*(W))+(max(SS_Gap1, SS_Gap2)))+((2)*(max(SG_Gap1, SG_Gap2)))), GND_ME, GND_ME, 2.0, 1.0, True, True
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((-(W)))-((SS_Gap1)/(2)))-(SG_Gap1)), ((((-(OD)))/(2))-(LEAD)), rfvlsi_ORIENT_MY), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((-(W)))-((SS_Gap1)/(2)))-(SG_Gap1)), ((((-(OD)))/(2))-(LEAD)), rfvlsi_ORIENT_MY), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MY),_
		((((((OD)/(2))+(LEAD))-(4.0))-(W))-((2)*(MinMetSpacing(8)))), W, 9, GND_ME, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((W)+((SS_Gap1)/(2)))+(SG_Gap1)), ((((-(OD)))/(2))-(LEAD)), rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((W)+((SS_Gap1)/(2)))+(SG_Gap1)), ((((-(OD)))/(2))-(LEAD)), rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		((((((OD)/(2))+(LEAD))-(4.0))-(W))-((2)*(MinMetSpacing(8)))), W, 9, GND_ME, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((-(W)))-((SS_Gap2)/(2)))-(SG_Gap2)), (((OD)/(2))+(LEAD)), rfvlsi_ORIENT_R180), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, ((((-(W)))-((SS_Gap2)/(2)))-(SG_Gap2)), (((OD)/(2))+(LEAD)), rfvlsi_ORIENT_R180), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R180),_
		((((((OD)/(2))+(LEAD))-(4.0))-(W))-((2)*(MinMetSpacing(8)))), W, 9, GND_ME, True, True, False, False
	rfvlsiHFSS_Create_vias rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((W)+((SS_Gap2)/(2)))+(SG_Gap2)), (((OD)/(2))+(LEAD)), rfvlsi_ORIENT_MX), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, (((W)+((SS_Gap2)/(2)))+(SG_Gap2)), (((OD)/(2))+(LEAD)), rfvlsi_ORIENT_MX), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_MX),_
		((((((OD)/(2))+(LEAD))-(4.0))-(W))-((2)*(MinMetSpacing(8)))), W, 9, GND_ME, True, True, False, False
	' Not using MetalVec/ViaVec, thus ignored in translation
	' Not using MetalVec/ViaVec, thus ignored in translation
	rfvlsiHFSS_Create_base_em_bc rfvlsi_newOriginX(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _
		rfvlsi_newOriginY(rfvlsi_pcellOffsetX0, rfvlsi_pcellOffsetY0, rfvlsi_pcellOffsetORIENT, 0, 0, rfvlsi_ORIENT_R0), _	
		rfvlsi_newORIENT(rfvlsi_pcellOffsetORIENT, rfvlsi_ORIENT_R0),_
		(((((2)*(OD))+((2)*(LEAD)))+((2)*(MinMetSpacing(8))))+((2)*(max(SS_Gap1, SS_Gap2)))), (((OD)+((2)*(LEAD)))-(4)), 2.0, 10.0, 3
	'Adding a vertical lumped port.
	CVport "N1",((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))),4.0,((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))),((4.0)+(W)),(((4.0)+(W)))-(4.0),"X",2,8,2
	'Adding a vertical lumped port.
	CVport "P1",((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))),((-(4.0))),((((-(W)))-(max(SG_Gap1, SG_Gap2)))-((max(SS_Gap1, SS_Gap2))/(2))),(((-(4.0)))-(W)),((((-(4.0)))-(W)))-(((-(4.0)))),"X",2,8,2
	'Adding a vertical lumped port.
	CVport "N2",(((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))),4.0,(((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))),((4.0)+(W)),(((4.0)+(W)))-(4.0),"X",2,8,2
	'Adding a vertical lumped port.
	CVport "P2",(((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))),((-(4.0))),(((W)+(max(SG_Gap1, SG_Gap2)))+((max(SS_Gap1, SS_Gap2))/(2))),(((-(4.0)))-(W)),((((-(4.0)))-(W)))-(((-(4.0)))),"X",2,8,2
End Sub
'Generating topcell
rfvlsiHFSS_Create_ind_dual 0.0, 0.0, rfvlsi_ORIENT_R0, <OD>, <W>, 3.0, 3.0, 3.0, 3.0, 10.0, <S>, 2, "ind_dual", False, False, False, False, False, False, False, 3 
' End Invoking topcell .... 
oProject.Save
'Merging metals & Vias
If (rfvlsi_totoal_PO_ModelerObjects>=2) Then' If there are more than two objects of PO , we merge them.
    A = oEditor.GetMatchedObjectName("PO*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_CO_ModelerObjects>=2) Then' If there are more than two objects of CO , we merge them.
    A = oEditor.GetMatchedObjectName("CO*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL1_ModelerObjects>=2) Then' If there are more than two objects of METAL1 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL1*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via1_ModelerObjects>=2) Then' If there are more than two objects of Via1 , we merge them.
    A = oEditor.GetMatchedObjectName("Via1*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL2_ModelerObjects>=2) Then' If there are more than two objects of METAL2 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL2*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via2_ModelerObjects>=2) Then' If there are more than two objects of Via2 , we merge them.
    A = oEditor.GetMatchedObjectName("Via2*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL3_ModelerObjects>=2) Then' If there are more than two objects of METAL3 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL3*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via3_ModelerObjects>=2) Then' If there are more than two objects of Via3 , we merge them.
    A = oEditor.GetMatchedObjectName("Via3*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL4_ModelerObjects>=2) Then' If there are more than two objects of METAL4 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL4*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via4_ModelerObjects>=2) Then' If there are more than two objects of Via4 , we merge them.
    A = oEditor.GetMatchedObjectName("Via4*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL5_ModelerObjects>=2) Then' If there are more than two objects of METAL5 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL5*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via5_ModelerObjects>=2) Then' If there are more than two objects of Via5 , we merge them.
    A = oEditor.GetMatchedObjectName("Via5*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL6_ModelerObjects>=2) Then' If there are more than two objects of METAL6 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL6*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via6_ModelerObjects>=2) Then' If there are more than two objects of Via6 , we merge them.
    A = oEditor.GetMatchedObjectName("Via6*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL7_ModelerObjects>=2) Then' If there are more than two objects of METAL7 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL7*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via7_ModelerObjects>=2) Then' If there are more than two objects of Via7 , we merge them.
    A = oEditor.GetMatchedObjectName("Via7*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL8_ModelerObjects>=2) Then' If there are more than two objects of METAL8 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL8*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via8_ModelerObjects>=2) Then' If there are more than two objects of Via8 , we merge them.
    A = oEditor.GetMatchedObjectName("Via8*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL9_ModelerObjects>=2) Then' If there are more than two objects of METAL9 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL9*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_Via9_ModelerObjects>=2) Then' If there are more than two objects of Via9 , we merge them.
    A = oEditor.GetMatchedObjectName("Via9*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

If (rfvlsi_totoal_METAL10_ModelerObjects>=2) Then' If there are more than two objects of METAL10 , we merge them.
    A = oEditor.GetMatchedObjectName("METAL10*")
    oEditor.Unite Array("NAME:Selections", "Selections:=",  Join(A,",")), Array("NAME:UniteParameters", "KeepOriginals:=",  false)
End If

oProject.Save
If (rfvlsi_print_DIE) Then
    'Substract Vias/Metals from Deielectric
    If (rfvlsi_totoal_PO_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("PO*")
    End If    

    If (rfvlsi_totoal_CO_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("CO*")
    End If    

    If (rfvlsi_totoal_METAL1_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL1*")
    End If    

    If (rfvlsi_totoal_Via1_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via1*")
    End If    

    If (rfvlsi_totoal_METAL2_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL2*")
    End If    

    If (rfvlsi_totoal_Via2_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via2*")
    End If    

    If (rfvlsi_totoal_METAL3_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL3*")
    End If    

    If (rfvlsi_totoal_Via3_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via3*")
    End If    

    If (rfvlsi_totoal_METAL4_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL4*")
    End If    

    If (rfvlsi_totoal_Via4_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via4*")
    End If    

    If (rfvlsi_totoal_METAL5_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL5*")
    End If    

    If (rfvlsi_totoal_Via5_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via5*")
    End If    

    If (rfvlsi_totoal_METAL6_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL6*")
    End If    

    If (rfvlsi_totoal_Via6_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via6*")
    End If    

    If (rfvlsi_totoal_METAL7_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL7*")
        oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "FOX", "Tool Parts:=", Join(A,",")), Array("NAME:SubtractParameters", "KeepOriginals:=", true)
        oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "IMD_7c", "Tool Parts:=", Join(A,",")), Array("NAME:SubtractParameters", "KeepOriginals:=", true)
    End If    

    If (rfvlsi_totoal_Via7_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via7*")
        oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "FOX", "Tool Parts:=", Join(A,",")), Array("NAME:SubtractParameters", "KeepOriginals:=", true)
        oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "IMD_7c", "Tool Parts:=", Join(A,",")), Array("NAME:SubtractParameters", "KeepOriginals:=", true)
    End If    

    If (rfvlsi_totoal_METAL8_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL8*")
    End If    

    If (rfvlsi_totoal_Via8_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via8*")
    End If    

    If (rfvlsi_totoal_METAL9_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL9*")
    End If    

    If (rfvlsi_totoal_Via9_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("Via9*")
    End If    

    If (rfvlsi_totoal_METAL10_ModelerObjects>=1) Then
        A = oEditor.GetMatchedObjectName("METAL10*")
        oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "IMD_7c", "Tool Parts:=", Join(A,",")), Array("NAME:SubtractParameters", "KeepOriginals:=", true)
    End If    
    oProject.Save
End If
Set oModule = oDesign.GetModule("AnalysisSetup")
' Setup Interpolating Sweep :
oModule.InsertSetup "HfssDriven", Array("NAME:SP_Sim", "Frequency:=", "50GHz", "PortsOnly:=",  _
  false, "MaxDeltaS:=", 0.02, "UseMatrixConv:=", false, "MaximumPasses:=", 20, "MinimumPasses:=",  _
  1, "MinimumConvergedPasses:=", 1, "PercentRefinement:=", 30, "IsEnabled:=",  _
  true, "BasisOrder:=", -1, "UseIterativeSolver:=", true,"IterativeResidual:=", _
  0.0001, "DoLambdaRefine:=", true, "DoMaterialLambda:=", true, "SetLambdaTarget:=", false, "Target:=",  _
  0.3333, "UseMaxTetIncrease:=", false, "PortAccuracy:=", 2, "UseABCOnPort:=",  _
  false, "SetPortMinMaxTri:=", false, "EnableSolverDomains:=", false, "ThermalFeedback:=",  _
  false, "NoAdditionalRefinementOnImport:=", false)

oModule.InsertFrequencySweep "SP_Sim", Array("NAME:SP_Sim_Sweep", "IsEnabled:=", true, "SetupType:=",  _
  "LinearStep", "StartValue:=", Cstr(1)&"GHz", "StopValue:=", Cstr(60)&"GHz", "StepSize:=",  _
  "0.1GHz", "Type:=", "Interpolating", "SaveFields:=", false, "InterpTolerance:=",  _
  0.5, "InterpMaxSolns:=", 250, "InterpMinSolns:=", 0, "InterpMinSubranges:=", 1, "ExtrapToDC:=",  _
  false, "InterpUseS:=", true, "InterpUsePortImped:=", true, "InterpUsePropConst:=",  _
  true, "UseDerivativeConvergence:=", false, "InterpDerivTolerance:=", 0.2, "UseFullBasis:=",  _
  true)

oProject.Save ' Ready for simulation

