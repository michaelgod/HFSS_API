function [tmpDataFiles replot] = t40xfmmam9_wh(tmpScriptFile, fid, OD, M11_W, M11_S)
        outdir = 'G:\HFSS_SIMULATIONS\t40xfmmam9\';
        param = ['D' num2str(OD) 'W' num2str(M11_W) 'S' num2str(M11_S)];
        tmpDataFiles = [outdir 'XFM-' param '.s4p'];
        tmpDataFilem = [outdir 'XFM-' param '.mat'];
    if(~exist(tmpDataFiles,'file'))
        var_fp =  [num2str(OD) ',' num2str(M11_W) ',' num2str(M11_S) ];
        param = hfssProcess(fid,'./t40me6X2Z.csv','./t40imd6X2Z.csv' ,'6X2Z', 'var_T40_xfm', var_fp);
        hfssCreateVar(fid, 'L_OP', [num2str(10) 'um']);
        hfssCreateVar(fid, 'R_OP', [num2str(22) 'um']);
        disp(['Creating the Script File ...@ ' tmpScriptFile ]);       
        % function hfss_xfm_halfud(fid,X , Y, Z, W, R_OP,L_OP, OD,Thickness)
        % serial = hfss_xfmN(fid,X , Y, Z, Z2, WI, WO, S, R_OP,L_OP, OD,Thickness,serial)
        serial = 0;
        hfss_xfmmam9N(fid,'0' ,'0' ,'$M11_Z','$M9_Z', '$WI', '$WO', '$M11_S', '$R_OP','$L_OP', '$OD','$M9_T','$M11_T', '$VIA9_T', serial);
        projectname = [outdir param '.hfss'];
        
        hfssInsertSolution(fid, 'Setup30G', 24, 0.02, 25);
        hfssEditSolution(fid, 'Setup30G', '-1');
        hfssInterpolatingSweep(fid, 'SWP30G', 'Setup30G', 0.1, 30, 512, 30, 0.2);
        hfssSaveProject(fid, projectname, true);
        hfssSolveSetup(fid, 'Setup30G'); 
        hfssSaveProject(fid, projectname, true);
        disp(['Project saved to ' projectname]);        
        % Export the Network data as an m-file.
        hfssExportNetworkData(fid, tmpDataFiles, 'Setup30G', 'SWP30G','s');
        hfssExportNetworkData(fid, tmpDataFilem, 'Setup30G', 'SWP30G');    
        replot = 1;
    else
        disp(['Solution data ' tmpDataFiles ' exists, skipping.']);
        replot = 0;
    end
end