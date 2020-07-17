/*
* Create composite image and montage from all open image files
* Set LUT, scale, contrast and colour manually before running macro
* Uses max projection by default
* Autosaves montage and composite to folder of selected image
* Images will be added in the order tey were opened
* Updated 2017-08-04 to include autosave in same location
* @Author: Henrik Persson
*/

//------------------------------------
//get name and path of original images 
//(assumes all are in same folder; will take path of currently selected image)

oldName=getTitle();
imagePath=getInfo("image.directory");
newName=oldName;

//strip channel info from filename. 
//Based on naming convention Author's acquisition software
if(indexOf(oldName,"_BF") >=0){
	newName=replace(oldName,"_BF","");
}
if(indexOf(oldName,"_DAPI") >=0){
	newName=replace(oldName,"_DAPI","");
}
if(indexOf(oldName,"_FITC_") >=0){
	newName=replace(oldName,"_FITC","");
}
if(indexOf(oldName,"_TXRed_") >=0){
	newName=replace(oldName,"_TXRed","");
}

//create new image names based on old image names
montName=replace(newName,".tif","_montage.tif");
compName=replace(newName,".tif","_composite.tif");

//Convert to colour images
for(i=1;i<=nImages;i++){
	selectImage(i);
	run("RGB Color");
}

//create stack and composite image
run("Images to Stack", "name=Stack title=[] use");
run("Z Project...", "projection=[Max Intensity]");

//Add scalebar
selectWindow("MAX_Stack");
run("Scale Bar...", "width=25 height=10 font=20 color=White background=None location=[Lower Right] bold");

//add composite to end of stack
run("Select All");
run("Copy");
run("Select None");

selectWindow("Stack");
setSlice(nSlices);
run("Add Slice");
run("Paste");

//create montage
if(nSlices >= 4){
	run("Make Montage...", "columns=2 rows=2 scale=1 first=1 last=4 increment=1 border=5 font=12");
}
if(nSlices == 3){
	run("Make Montage...", "columns=3 rows=1 scale=1 first=1 last=4 increment=1 border=5 font=12");
}
selectWindow("Stack");
close();


//save images in same location as raw images
selectWindow("MAX_Stack");
rename(compName);
save(imagePath+compName);

selectWindow("Montage");
rename(montName);
save(imagePath+montName);
