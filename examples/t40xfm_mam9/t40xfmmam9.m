% Description:
% ------------
clear all;
% add paths to the required m-files.
try
    init_hfssapi;	
	runAndExit = true ;    iconized = true ;    nowait = false; % true if your're NCHC
    serial = 0;
    % Create a new temporary HFSS script file.	
	OD = 100:5:120; M11_W = 5;  M11_S = 2;
    %dlmwrite('G:\HFSS_SIMULATIONS\t40xfmmam9\summary.csv', ...
	%	'OD, W, S, NT, L(5.8G),Q(5.8G),L(10.6G),Q(10.6G),L(24G),Q(24G)','delimiter','');
	iter = 1;
	total = length(OD)*length(M11_W)*length(M11_S);
	time = 0;
    for i=1:length(OD)
        for j=1:length(M11_W)
            for k=1:length(M11_S)
                        tic; % start stopwatch
                    fid = fopen(tmpScriptFile, 'w+');
                    disp(['---- Interation #' num2str(iter) ' of ' num2str(total) ' (' ...
                        num2str(100*iter/total) '%) Starts ----']);                
                    disp(['ETA : ' num2str(((total-iter)*time)/3600) ' hours to finish']);
                    [tmpDataFiles replot] = t40xfmmam9_wh(tmpScriptFile, fid, OD(i), M11_W(j), M11_S(k));    
                    % Close the HFSS Script File.
                    fclose(fid);
                    try
                        disp('Script received, simulation start ...');                        
                        hfssExecuteScript(hfssExePath, tmpScriptFile,iconized,runAndExit,nowait);                        
                        %plotL(tmpDataFiles,OD(i), M11_W(j), M11_S(k), NT(l), replot);
                        time = toc; % stop stopwatch
                        disp(['Time Elapsed : ' num2str(time/60) ' min.']); % report simulation time for current iter.                        
                        time = (time*iter + time)/(iter+1); % compute average simulation time
                    catch e
                        disp(['*** Iteration failed-> OD' num2str(OD(i)) 'W' num2str(M11_W(j)) 'S' num2str(M11_S(k)) 'NT' num2str(NT(l))]);
                        disp('Continuing ...');
                        time = toc; % stop stopwatch
                        disp(['Time Elapsed : ' num2str(time/60) ' min.']); % report simulation time for current iter.                        
                        time = (time*iter + time)/(iter+1); % compute average simulation time
                    end
                    iter = iter + 1;
                    fclose all;
            end
        end
    end
    % remove all the added paths.
    deinit_hfssapi;
catch exception
    disp('**** Error Caught **** Stack =');
    disp('Caller Stack =');
    err = struct2cell(exception.stack);
    % Show Caller Stack 
    disp(err(2:3,:));
    % Show the error thrown
    disp(exception.message);
    % Close file
    fclose(fid);
    % Deinitialize paths
    deinit_hfssapi;
end