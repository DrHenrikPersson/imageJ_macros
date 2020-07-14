/*
 * Macro to mark coordinates from tracking on image with an arrow
 * Data from Manual tracking plugin
 * 
 * Rename the results table to Results (otherwise ImageJ doesn't find it)
 * 
 * 2020-07-14
 * Henrik Persson
 */

//use these settings to control where the arrow starts relative to the tracked point
//the arrow will be drawn using the current foreground colour
xStart = -50;
yStart = 50;
strokeWidth = 5;

for(i=1; i<nResults; i++){
	setSlice(getResult("Slice n°", i));
	tmpX = getResult("X", i);
	tmpY = getResult("Y", i);
	makeArrow(tmpX + xStart, tmpY + yStart, tmpX, tmpY, "notched");
	Roi.setStrokeWidth(strokeWidth);
	Roi.setStrokeColor("white");
	run("Draw", "slice");
}

 