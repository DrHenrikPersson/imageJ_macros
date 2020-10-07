/*
* Macro to add a look up table to each image in a folder based on the filename.
* Saves as an RGB TIF colour image
* WARNING Overwrites the file in the folder. Use on a copied folder
* 
* Colour mapping
* keywordin filename: LUT name
* BF: gray
* DAPI: blue
* FITC: green
* TXRed: red
*
* Option to encode scale in images based on filename
* NB: based on knowing scale for your specific setup
* 
* Updated 2020-10-06
* @Author: Henrik Persson
 */

 
//image manipulation
autocontrast = true; // use autocontrast?
autocontrastValue = 0.35; //saturation
 
 
input=getDirectory("Choose input folder");
files=getFileList(input);

//loop over all files in folder, check filename
for(i=0;i<files.length;i++){
	
	open(input + files[i]);

	if(autocontrast){
		run("Enhance Contrast", "saturated="+autocontrastValue);
	}
	
	//find colour, assign it
	if (indexOf(files[i],"DAPI")>-1){
		//DAPI filter used
		run("Blue");
	}

	if (indexOf(files[i],"FITC")>-1){
		//FITC filter used
		run("Green");
	}

	if (indexOf(files[i],"TXRed")>-1){
		//TXRed filter used
		run("Red");
	}

	if (indexOf(files[i],"BF")>-1){
		//Brightfield filter used
		run("Grays");
	}
	run("RGB Color");
	
	//find magnification, assign scale
	if (indexOf(files[i],"4x")>-1){
		//4x objective used, scale value based on Simmons lab microscope
		run("Set Scale...", "distance=1 known=1.86 unit=um");
	}
	if (indexOf(files[i],"10x")>-1){
		//10x objective used, scale value based on Simmons lab microscope
		run("Set Scale...", "distance=1 known=0.74 unit=um");
	}
	if (indexOf(files[i],"40x")>-1){
		//10x objective used, scale value based on Simmons lab microscope
		run("Set Scale...", "distance=1 known=0.18 unit=um");
	}
	
	run("Save");
	close();
}
