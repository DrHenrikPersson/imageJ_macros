/*
* Apply all threshold methods to selected image to quickly check which is most suitable.
* Store results in labeled stack. 
* Creates 5x4 montage. 17 threshold methods available (2020-07-21)
* 
* Runs on selected image. Needs to be 8, 16, or 32 bit.
* 
* Created 2020-04-01
* Updated 2020-07-21 (added original image; added slice labels)
* @Author: Henrik Persson
 */


//setup 
orgImage=getTitle();
orgWidth=getWidth();
orgHeight=getHeight();
thresholdMethods = getList("threshold.methods");

setFont("SansSerif", 18, " antialiased");
setForegroundColor(0,0,0);
setBackgroundColor(0,0,0);

//create stack to store images
newImage("Threshold evaluation", "RGB black", orgWidth, orgHeight, thresholdMethods.length+1);

//add original image as first image in stack
selectWindow(orgImage);
run("Select All");
run("Copy");
selectWindow("Threshold evaluation");
setSlice(1);
run("Paste");
setMetadata("Label","Original");

 for(i=1;i<thresholdMethods.length+1;i++){
 	//print(thresholdMethods[i-1]);

 	//create thresholded image
	selectWindow(orgImage);
	run("Duplicate...", "title=tmpWindow");
	selectWindow("tmpWindow");
	setAutoThreshold(thresholdMethods[i-1]);
	setOption("BlackBackground", true);
	run("Convert to Mask");

	//insert into stack
	run("Select All");
	run("Copy");
	selectWindow("Threshold evaluation");
	setSlice(i+1);
	run("Paste");

	//label
	setMetadata("Label",thresholdMethods[i-1]);//add label to current slice

	//cleanup
	selectWindow("tmpWindow");
	close();
	
 }//for

//deselect
selectWindow(orgImage);
run("Select None");
selectWindow("Threshold evaluation");
run("Select None");

//create montage
run("Make Montage...", "columns=5 rows=4 scale=0.5 border=5 label");