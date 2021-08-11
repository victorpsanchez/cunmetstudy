% Calculate the correlation matrix for the 200 Schaefer

subjs = [1001, 1003, 1004, 1006, 1007, 1009, 1010, 1011, 1012, 1013, ...
1014, 1015, 1016, 1017, 1018, 1019, 1020, 1021, 2002, 2003, 2004, ...
2005, 2006, 2007, 2008, 2010, 2011, 2012, 2013, 2014, 2015, 2016, ...
2017, 2018, 2020, 2021, 4001, 4002, 4003, 4004, 4005, 4006, 4007, ...
4009, 4010, 4012, 4013, 4014, 4015, 4016, 4017, 4018, 4020, 4021, ...
4022, 4023];

r_all = [];
z_all = [];


for ii = 1:length(subjs)
   timeseries =  dlmread(['timeseries/sub-' num2str(subjs(ii)) '_ses-01_Schaefer200.1D']);
      
   r = corr(timeseries);
   % r to z
   z =  0.5*(log(1+r) - log(1-r));
 
   dlmwrite(['correlations_tsv_z/sub-' num2str(subjs(ii)) '_ses-01.Schaefer200_CORR_Z_tsv.txt'],z,'delimiter','\t','precision','%.6f')
    
   r_all(:,:,ii) = [r];
   z_all(:,:,ii) = [z]; 
end

