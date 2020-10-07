/*
* Save all open images as colour images (based on current LUT)
* To not use scalebar, change the addScale parameter to 'false' on line 11. 
* Set it to 'true' to use a scalebar
* 
* WARNING: overwrites original file, use on copied folder
*
* Updated 2020-07-10
* Author: Henrik Persson
*/

addScale = true; //set to false not to use scalebar, true to use scalebar
scaleWidth = 250; //width of scalebar in um

while(nImages>0){
	run("RGB Color");
	if(addScale){
		run("Scale Bar...", "width="+ scaleWidth + " height=30 font=36 color=White background=None location=[Lower Right] bold");
	}
	run("Save");
	close();
}
