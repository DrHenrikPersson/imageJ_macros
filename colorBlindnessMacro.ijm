/*
 * Apply color blindness simulation to current image
 * Apply all simulation modes on duplicate images
 * Collect in stack, create montage
 * 
 * 2020-07-20
 * @Author: Henrik Persson
 */

//Load all possbile color modes
colorModes = newArray(
		"Normal",
		"Protanopia (no red)", 
		"Deutanopia (no green)", 
		"Tritanopia (no blue)",
		"Protanomaly (low red)",
		"Deuteranomaly (low green)",
		"Tritanomaly (low blue)",
		"Typical Monochromacy",
		"Atypical Monochromacy"
		);

//get original image name
originalName = getTitle();

//create new stack to store treated images
newImage("Colorblindness simulation", "RGB black", getWidth(), getHeight(), colorModes.length);

/*
 * loop over all colorModes
 * create duplicate image and apply colormode. 
 * Copy to stack and add label
 */
for(i=0; i<colorModes.length; i++){
	selectWindow(originalName);
	run("Duplicate...", " ");
	rename(colorModes[i]);//duplicated image
	run("Simulate Color Blindness", "mode=[" + colorModes[i] + "]");
	run("Copy");
	close();//the duplicated image
	selectWindow("Colorblindness simulation");
	setSlice(i+1);
	setMetadata("Label",colorModes[i]);//add label to current slice
	run("Paste");//add duplicated, simulated image
}

run("Select None");

//Create a montage
run("Make Montage...", "columns=3 rows=3 scale=0.25 border=5 label");