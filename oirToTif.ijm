/*
Import all *.oir files in single folder, split into individual channels and save as tif in output folder
Requires bioformats importer. Download here:
https://www.openmicroscopy.org/bio-formats/downloads/
2019-09-27, Henrik Persson
*/


//User chooses input and output folders
folder=getDirectory("Choose input folder");
output=getDirectory("Choose output folder");

//get list of files in folder
files=getFileList(folder);

//loop over files, split into channels and save channels
for (i=0; i<files.length; i++) {

	//check if this is an oir file
	if (endsWith(files[i],".oir")){
		//import image
		run("Bio-Formats Importer", "open=[" + folder+files[i] +"]autoscale color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");

		//check if image is a stack. 
		if(nSlices>1){
		//Image is a stack, split and save channels
		//Reduce image name to get rid of channel info (illegal filename)
		//substring to strip end of image name
			run("Stack to Images");
			while(nImages>0){
				//as long as there are images open: save and close
				tmpTitle =  getTitle();
				run("Save", "save=[" + output +  substring(tmpTitle,7)+ ", channel " + substring(tmpTitle,2,3)+".tif]");
				close();
			}//while nSlices
		} else {
		//not a stack, save single image
			tmpTitle =  getTitle();
			run("Save", "save=[" + output+ tmpTitle+ ".tif]");
			close();
		}//else statement
	}//if .oir file
}//for files in folder
