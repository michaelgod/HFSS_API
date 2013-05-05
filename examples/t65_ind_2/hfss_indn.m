function serial = hfss_indn(fid,X, Y, Z, OD, S, NT, W, lead, serial)
        hfssCreateVar(fid, 'M9_P',  strcat(W, '+', S));
        hfssCreateVar(fid, 'VIA_W', [num2str(2)  'um']);
        hfssCreateVar(fid, 'VIA_ENC', '($M9_W - $VIA_W)/2');        
        if(NT>1)                  
            serial = hfss_ind(fid, X, Y, Z, W, S, OD, '$NT', '$M9_T', lead, '0', serial, 'ME0d005');
                hfssBoxN(fid, 'under_1', ...
                        {strcat(OD, '-', W, '-($NT-1)*$M9_P'), S ,'$M8_Z'}, {strcat('$NT*$M9_P+', W), W, '$M8_T'},'ME0d022' ); % under pass
                hfssBoxN(fid, 'via_1', ...
                        {strcat(OD, '-', W, '-($NT-1)*$M9_P'), S,'$VIA10_Z'}, {W, W, '$VIA10_T'},'ME0d022' ); % via 1
                hfssBoxN(fid, 'via_2', ...
                       {strcat(OD, '+', S), S,'$VIA10_Z'}, {W, W, '$VIA10_T'},'ME0d022' ); % via 2
                hfssSubtract(fid, {'IMD_9a'},  {'under_1', 'via_1', 'via_2'},1);    
                hfssSubtract(fid, {'IMD_8gEQ'},  {'via_1', 'via_2'},1);                        
        else % if NT = 1, single turn
            serial = hfss_ind(fid, X, Y, Z, W, S, OD, '$NT', '$M9_T', lead, '0', serial, 'ME0d005');           
        end        
        hfssCreateVar(fid, 'PORT_H', '$M9_T');
        % port        
        posi = {strcat(OD,'+$LEAD+$M9_P'),'0','$M9_Z'};
        hfssRectangleN(fid, 'P1', 'x', posi , S, '$PORT_H');
        hfssAssignLumpedPortDTerm(fid, 'P1', posi, '', '1');
        hfssDeleteBoundaries(fid, 'L0_T1');       
        hfssSubtract(fid, {'IMD_9a','IMD_9b','IMD_9c'}, {'L0'},1);
        hfssHeal(fid, {'IMD_9a','IMD_9b','IMD_9c','PASS1EQ','L0','P1'});