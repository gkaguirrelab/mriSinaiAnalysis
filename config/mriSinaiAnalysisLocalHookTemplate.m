function mriSinaiAnalysisLocalHook
% mriSinaiAnalysisLocalHook
%
% For use with the ToolboxToolbox.  If you copy this into your
% ToolboxToolbox localToolboxHooks directory (by default,
% ~/localToolboxHooks) and delete "LocalHooksTemplate" from the filename,
% this will get run when you execute tbUse({'mriSinaiAnalysisConfig'}) to set up for
% this project.  You then edit your local copy to match your local machine.
%
% The main thing that this does is define Matlab preferences that specify input and output
% directories.
%
% You will need to edit the project location and i/o directory locations
% to match what is true on your computer.

 
%% Define project
projectName = 'mriSinaiAnalysis';
 

%% Clear out old preferences
if (ispref(projectName))
    rmpref(projectName);
end


%% Paths to find DropBox directory
if ismac
    [~, userName] = system('whoami');
    userName = strtrim(userName);
elseif isunix
    userName = getenv('USER');
elseif ispc
    userName = getenv('username');
else
    disp('What are you using?')
end

dropboxBaseDir = ...
    fullfile('/Users', userName, ...
    'Dropbox (Aguirre-Brainard Lab)');

% Set pref to dropboxBaseDir
setpref(projectName,'dropboxBaseDir',dropboxBaseDir);

% Set pref to username
setpref(projectName,'userName',userName);


%% Specify and save project location
projectBaseDir = tbLocateProject(projectName);
setpref(projectName,'projectBaseDir',projectBaseDir);

%% Flywheel key preferences 
setpref(projectName, 'flywheelAPIkey', 'Enter your key here');

end
