% Run  NBS through the command line 
% In this script we are performing a ttest between groups 2 and 4 and using
% a FDR correction. If to test different groups or include covariate (age), 
% look at the design_matrix folder for different tests. 
% The test is performed 1000 time (might not be able to run 1000 times due
% to memory constraints 


global nbs


UI.test.ui='t-test';

% try also Intensity
UI.size.ui='Extent';
%UI.size.ui='Intensity';

UI.perms.ui='5000';
%UI.perms.ui='100';

%UI.alpha.ui='0.05';
UI.alpha.ui='0.05';

UI.exchange.ui=''; 

UI.node_coor.ui='';               
UI.node_label.ui='Schaefer_node_lable.txt';


% Test without group 1, just 2 vs 4
UI.matrices.ui='correlations_tsv_z_2and4/sub-2002_ses-01.Schaefer200_CORR_Z_tsv.txt';


%% 1)  NBS  2v4_nocov  - NBS  [-1,1]
UI.method.ui='Run FDR'; 
UI.contrast.ui='[-1,1]'; 
UI.design.ui='design_matrix/designMatrix_2v4_nocov.txt';

%threshs = (0.1:0.1:5)';
threshs = (3.1)';

jj = 1;
%net_results 
num_results = zeros(size(threshs));
%for ii = 1:length(threshs) 
for ii = 1:1000 % Looping 1000 times.     
    clear global nbs 
    clearvars -global
    global nbs
    
    %UI.thresh.ui=num2str(threshs(ii));
    UI.thresh.ui=num2str(threshs);
    NBSrun(UI)

    [m,n] = size(nbs.NBS.con_mat);
    if m>0
        num_results(ii) = nnz(nbs.NBS.con_mat{1});
        net_results{jj} = nbs.NBS.con_mat{1};
        jj = jj+1;
    else
        num_results(ii) = 0;
    end
    
    save NBS_all_comb_thr31_2vs4_FDR_1000.mat
    
end
num_results_thr31_2vs4_FDR_extent = num_results;
      


%%
save NBS_all_comb_thr31_2vs4_FDR_1000.mat



