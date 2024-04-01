PresentWD = pwd;
rtioStreamDir = fullfile(codertarget.arduinobase.internal.getSpPkgRootDir,'src');
cd(rtioStreamDir);
!rename rtiostream_wifi.cpp rtiostream_wifi.cpp.bak
cd(PresentWD);
copyfile('rtiostream_wifi.cpp',rtioStreamDir,'f');

schedulerIncludeDir = fullfile(codertarget.arduinobase.internal.getSpPkgRootDir,'scheduler','include');
cd(schedulerIncludeDir);
!rename arduinoARM_M0plusScheduler.h arduinoARM_M0plusScheduler.h.bak
cd(PresentWD);
copyfile('arduinoARM_M0plusScheduler.h',schedulerIncludeDir,'f');

schedulerDir = fullfile(codertarget.arduinobase.internal.getSpPkgRootDir,'scheduler','src');
cd(schedulerDir);
!rename arduinoARM_M0plusScheduler.cpp arduinoARM_M0plusScheduler.cpp.bak
cd(PresentWD);
copyfile('arduinoARM_M0plusScheduler.cpp',schedulerDir,'f');
clear PresentWD rtioStreamDir schedulerIncludeDir schedulerDir