%% Check if necessary add-ons are installed
disp("Checking required Add-Ons to run hardware examples..")

isenabled1 = 1;
try
    isenabled1 = matlab.addons.isAddonEnabled("ML_ARDUINO");
    disp("MATLAB Support Package for Arduino Hardware found!")
catch ME
    isenabled1 = 0;
    warning("Required Add-On Missing. MATLAB Support Package for Arduino Hardware not installed. Use the Add-Ons button on the toolstrip to install the required add-ons");
end

isenabled2 = 1;
try
    isenabled2 = matlab.addons.isAddonEnabled("ARDUINO");
    disp("Simulink Support Package for Arduino Hardware found!")
catch ME
    isenabled2 = 0;
    warning("Required Add-On Missing. Simulink Support Package for Arduino Hardware not installed. Use the Add-Ons button on the toolstrip to install the required add-ons");
end

isenabled3 = 1;
% Use the check below for R2018b which needs an additional Arduino_Engineering_Kit_Hardware_Support_18b.
% This works with Simulink Support Package for Arduino in R2019a so additional check not needed.

% try
%     isenabled3 = matlab.addons.isAddonEnabled("5210ab38-0043-4337-8ead-85dc1dfca745");
%     disp("Arduino_Engineering_Kit_Hardware_Support_18b found!")
% catch ME
%     isenabled3 = 0;
%     warning("Required Add-On Missing. Arduino_Engineering_Kit_Hardware_Support_18b not installed. Use the Add-Ons button on the toolstrip to install the required add-ons");
% end

v = ver('matlab');
if strcmp(v.Release,'(R2019a)')
    % Check if patch has already been applied. If yes do nothing, if not
    % apply patch
    workDir = pwd;
    rtioStreamDir = fullfile(codertarget.arduinobase.internal.getSpPkgRootDir,'src');
    cd(rtioStreamDir);
    patchApplied = exist('rtiostream_wifi.cpp.bak','file');
    cd(workDir);
    if patchApplied == 2
        % Do nothing
    else
        % Apply patch
        cd ..;
        cd patchFiles/;
        applyPatch;
        cd(workDir);
    end
else
    % Do nothing
end
clear v rtioStreamDir workDir patchApplied

if (isenabled1 && isenabled2 && isenabled3)
    disp("All required Add-Ons found!")
else
    disp("Missing required Add-Ons. Hardware examples can't be run..")
end

clear isenabled1 isenabled2 isenabled3 ME
%% Open startup doc
edit('demoWalkthrough.mlx')
% Readme
edit('readme.txt')
%% Open models and update them for faster compilation during demo
% Commented for normal startup since they takes a while if you want to just
% browse the project

% disp('Loading models...');
% open_update_system('motorcycleSim.slx');
% open_update_system('motorcycleHW.slx');
% disp('Models loaded!');