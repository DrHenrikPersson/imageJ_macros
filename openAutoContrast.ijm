/*
* Run individual autocontrast on all open images. Tile images.
* Gives overview of multiple files at once.
*
* Updated 2020-10-07
* Author: Henrik Persson
*/

//apply autocontrast to all open images
imageList=getList("image.titles");
for(i=0;i<imageList.length; i++){
	selectWindow(imageList[i]);
	run("Enhance Contrast", "saturated=0.35");
}

//Tile images if not too many (<=12)
if(nImages <= 12){
	run("Tile");
}
