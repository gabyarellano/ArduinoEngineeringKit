function open_update_system(mdlName)
% Opens and updates model for faster running during demo

open_system(mdlName);
set_param(gcs,'SimulationCommand','Update');

end