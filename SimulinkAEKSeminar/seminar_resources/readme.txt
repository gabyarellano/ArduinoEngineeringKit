Setup Instructions
------------------

1) Change the addons location to a non-network drive by clicking on 
Preferences > AddOns (under MATLAB). Example - C:\Users\mgovinda\MATLAB. 
 
2) Close and re-open MATLAB as an administrator, by right clicking on the 
icon and selecting “Run as administrator”. Remember to open the 
SimulinkAEKSeminar project file when MATLAB reopens. 

3) Install / ensure you have the following Add-Ons.
a)	MATLAB Support Package for Arduino Hardware
b)	Simulink Support Package for Arduino Hardware

4) Type winopen('Arduino_Setup.docx') in MATLAB Command Window. 

5) Follow instructions in the Arduino setup document to move the 
sketchbook folder of Arduino to a local drive. 

6) Download third party libraries needed by following these instructions. 
a) Download the zip file from 
https://github.com/arduino-libraries/MKRMotorCarrier/archive/1.0.1.zip
b) Unpackage the zip into local directory and rename the folder to 
'MKRMotorCarrier'
c) Move the MKRMotorCarrier folder into the "libraries" folder 
inside your Arduino sketchbook folder
   On Windows, the default path is "Documents\Arduino\libraries\" 
   On Mac, the default path is "~/Documents/Arduino/libraries/" 
   On Linux, the default path is "/home/<username>/Arduino/libraries"
d) Once the libraries are installed, the folder structure should be:
   On Windows "\Documents\Arduino\libraries\MKRMotorCarrier\src"
   On Mac, "~/Documents/Arduino/libraries/MKRMotorCarrier/src"
   On Linux, "/home/<username>/Arduino/libraries/MKRMotorCarrier/src"

Project files and folders
--------------------------

models - Folder that has all the models
-- motorcycleSim.slx : Simulation model that analyzes the self-balancing motorcycle as an inverted pendulum
-- motorcycleHW.slx  : Hardware model that can be deployed on the AEK motorcycle.

patchFiles - Folder that has all the files needed to apply a patch for R2019a
-- applyPatch.m                  : MATLAB script that applies the patch necessary to enable WiFi-based external mode
-- arduinoARM_M0plusScheduler.cpp: Scheduler file that needs to be replaced
-- arduinoARM_M0plusScheduler.h  : Scheduler file's header that needs to be replaced
-- rtiostream_wifi.cpp           : WiFi file that needs to be replaced

presentation - Folder that has the presentation
-- AEK Simulink.pptx : Presentation that goes with the seminar contents.

seminar_resources - Folder that has utilities for the seminar
-- moto_geometry     : This folder has the motorcycle CAD geometry.
-- createSensorBus.m : MATLAB script that creates a Simulink bus for sensor information.
-- open_update_system.m : MATLAB function that opens and updates a model for quick demo.
-- startupDemo.m     : MATLAB script that is executed when the project starts up. Checks for required add-ons to run hardware demo.
-- shutDownDemo.m    : MATLAB script that is executed when the project shuts down.
-- demoWalkthrough.mlx: MATLAB script that can be used as a seminar ramp up document for the presenter.
-- bikeHW.png        : Image for masked subsystem for motorcycle hardware.
-- bikePlant.png     : Image for masked subsystem for motorcycle simulation/plant.
-- readme.txt        : Text file that provides setup instructions and documents the files and folders of the project.