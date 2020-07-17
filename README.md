# imageJ_macros
Miscellanous macros I use in my work



## markTrackingArrow.ijm
Track cells or similar in time lapse data using the Manual Tracking plugin in Fiji.
This macro will draw an arrow with the head pointing at the spot you tracked. 
Can do multiple tracks.
Rename Results table to "Results".
Uses foregorund colour for arrow, draws onto slices (not overlay). 


## oirToTif.ijm
Convert all oir files in single folder to tif files.
Split stacks  to single images. 
.oir is Olympus' image format.
Requires: bioformats importer: https://www.openmicroscopy.org/bio-formats/downloads/