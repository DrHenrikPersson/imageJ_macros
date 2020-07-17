# imageJ_macros
Miscellanous macros I use in my work.  

## markTrackingArrow.ijm
Draw an arrow with the head pointing at a spot defined by results table.
Track cells or similar in time lapse data using the Manual Tracking plugin in Fiji.  
(Any plugin works but the column names are based on the Manual Tracking plugin.)  
Can do multiple tracks.  
*Required:* Rename Results table to "Results".  
Uses foregorund colour for arrow, draws onto slices (not overlay).

## oirToTif.ijm
Convert all oir files in single folder to tif files.  
Split stacks  to single images.  
.oir is Olympus' image format.  
*Requires:* [bioformats importer](https://www.openmicroscopy.org/bio-formats/downloads)

## openToMontage.ijm
Create composite image and montage of all open images.  
Set scale, LUT and contrast of images before running macro.  
Autosaves to same location.  
