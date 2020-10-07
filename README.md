# imageJ_macros
Miscellanous macros I use in my work.  
Repository created 2020-07-14  

## applyAllThresholdMethods.ijm
Added 2020-07-21  
Apply all threshold methods to selected image to quickly check which is most suitable.  
Store results in labeled stack.  
Creates 5x4 montage (2 blank tiles).  
17 threshold methods available (2020-07-21).  
Runs on selected image. Needs to be 8, 16, or 32 bit.  

## assignColour.ijm
Added 2020-10-07  
Assign LUT to all images in a folder based on filternames in their filenames.  
Set scale based on objective magnification in filename. Hardcoded magnification based on user's microscope.  
**WARNING:** Overwrites original files in folder, use on copied folder.  

## colorBlindnessMacro.ijm
Added 2020-07-20  
Apply color blindness simulation using built in FIJI function.  
Applies all color blindness simulation modes on selected image.  
Results collected in labeled stack and displayed as a montage.  
*Requires:* FIJI plugin "Color Blindness Simulation"  

## markTrackingArrow.ijm
Added 2020-07-14  
Draw an arrow with the head pointing at a spot defined by results table.
Track cells or similar in time lapse data using the Manual Tracking plugin in Fiji.  
(Any plugin works but the column names are based on the Manual Tracking plugin.)  
Can do multiple tracks.  
*Required:* Rename Results table to "Results".  
Uses foregorund colour for arrow, draws onto slices (not overlay).

## oirToTif.ijm
Added 2020-07-16  
Convert all oir files in single folder to tif files.  
Split stacks  to single images.  
.oir is Olympus' image format.  
*Required:* [bioformats importer](https://www.openmicroscopy.org/bio-formats/downloads)

## openAutoContrast.ijm
Added 2020-10-07  
Run individual autocontrast on all open images. Tile images.  
Gives overview of multiple files at once.  

## openToMontage.ijm
Added 2020-07-16  
Create composite image and montage of all open images.  
Set scale, LUT and contrast of images before running macro.  
Images added in the order they were opened.  
Autosaves to same location.  

## saveAsColor.ijm  
Added 2020-10-07
Save all open images as colour versions.  
Option to add scalebar.   
**WARNING:** Overwrites original files, use on copied folder.
