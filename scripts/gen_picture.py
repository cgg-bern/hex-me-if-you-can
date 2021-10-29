#### import the simple module from the paraview
from paraview.simple import *
import subprocess
#import sys

def myclip(theinput, thenormal, therender, toinvert=True):
    clip = Clip(Input=theinput, Invert=toinvert)
    clip.ClipType = "Plane"
    clip.ClipType.Normal = thenormal
    clip.Crinkleclip = 1
    clipDisplay = Show(clip, therender, EdgeColor=[0,0,0])
    clipDisplay.Representation = 'Surface With Edges'
    clipDisplay.ColorArrayName = [None, '']    
    return clip
#_end of def myclip

def create_pictures_XYZ(mesh):
    if(not mesh.endswith(".vtk")):
        print("ERROR: input file must be a VTK legacy file (.vtk)")
        exit(1)

        
    #### disable automatic camera reset on 'Show'
    paraview.simple._DisableFirstRenderCameraReset()
    
    paraview.simple.Disconnect()
    paraview.simple.Connect()
    # create a new 'Legacy VTK Reader'
    data = LegacyVTKReader(FileNames=[mesh])
    
    # get active view
    rv = GetActiveViewOrCreate('RenderView')
    vtkDisplay = Show(data, rv, PointSize=10, LineWidth=5, RenderLinesAsTubes=True, RenderPointsAsSpheres=True)
    # trace defaults for the display properties.
    vtkDisplay.Representation = 'Surface'
    vtkDisplay.ColorArrayName = [None, '']
    vtkDisplay.OSPRayScaleFunction = 'PiecewiseFunction'
    vtkDisplay.SelectOrientationVectors = 'None'
    vtkDisplay.ScaleFactor = 1.8
    vtkDisplay.SelectScaleArray = 'None'
    vtkDisplay.GlyphType = 'Arrow'
    vtkDisplay.GlyphTableIndexArray = 'None'
    vtkDisplay.DataAxesGrid = 'GridAxesRepresentation'
    vtkDisplay.PolarAxes = 'PolarAxesRepresentation'
    #vtkDisplay.ScalarOpacityUnitDistance = 0.5045513280420133
    vtkDisplay.Opacity = .4
    
    # Hide orientation axes
    rv.OrientationAxesVisibility = 0
    
    # Properties modified on renderView1
    #rv.UseGradientBackground = 1
    rv.Background = [1, 1, 1] #white
    clip0 = myclip(data, [0, 0, 1], rv)
    camera=GetActiveCamera()
    # reset view to fit data
    rv.ResetCamera()
    # update the view to ensure updated data information
    rv.Update()
    # save screenshot
    SaveScreenshot(snakemake.output[2], rv, ImageResolution=[4000, 4000], CompressionLevel='0' )
    #SaveScreenshot("Z.png", rv, ImageResolution=[4000, 4000], CompressionLevel=0 )
    subprocess.call(['convert', '-trim', snakemake.output[2], snakemake.output[2]])
    Delete(clip0)
    clip0 = myclip(data, [1, 0, 0], rv)
    camera.Yaw(90)
    rv.ResetCamera()
    rv.Update()
    SaveScreenshot(snakemake.output[0], rv, ImageResolution=[4000, 4000], CompressionLevel='0' )
    #SaveScreenshot("X.png", rv, ImageResolution=[4000, 4000], CompressionLevel=0 )
    subprocess.call(['convert', '-trim', snakemake.output[0], snakemake.output[0]])
    
    Delete(clip0)
    clip0 = myclip(data, [0, -1, 0], rv)
    camera.Pitch(90)
    rv.ResetCamera()
    rv.Update()
    SaveScreenshot(snakemake.output[1], rv, ImageResolution=[4000, 4000], CompressionLevel='0' )
    #SaveScreenshot("Y.png", rv, ImageResolution=[4000, 4000], CompressionLevel=0 )
    subprocess.call(['convert', '-trim', snakemake.output[1], snakemake.output[1]])
    
    Delete(clip0)
    clip = Clip(Input=data)
    clip.ClipType = "Box"
    clip.Crinkleclip = 1
    lg = clip.ClipType.Length
    clip.ClipType.Length = [lg[0]/2., lg[1]/2., lg[2]]
    clipDisplay = Show(clip, rv, EdgeColor=[0,0,0])
    clipDisplay.Representation = 'Surface With Edges'
    clipDisplay.ColorArrayName = [None, '']  
    camera.Yaw(150)
    camera.Pitch(-30)
    rv.ResetCamera()
    rv.Update()
    SaveScreenshot(snakemake.output[3], rv, ImageResolution=[4000, 4000], CompressionLevel='0' )
    #SaveScreenshot("XYZ.png", rv, ImageResolution=[4000, 4000], CompressionLevel=0 )
    subprocess.call(['convert', '-trim', snakemake.output[3], snakemake.output[3]])
    
    Delete(data)
    del(data)
#_end def create_pictures_XYZ


mesh = snakemake.input.msh
create_pictures_XYZ(mesh)
