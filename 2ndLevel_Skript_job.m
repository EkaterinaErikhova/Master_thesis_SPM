%-----------------------------------------------------------------------
% Job saved on 16-Feb-2022 10:37:34 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------

# Creating dummy variables for scans, as it is one of the covariate variables
C = [
    %Controls BL
    repmat([1,0,0,0,0,0,0,0], 22, 1); %Berlin
    repmat([0,1,0,0,0,0,0,0], 33, 1); %Dresden
    repmat([0,0,1,0,0,0,0,0], 9, 1); %Dublin
    repmat([0,0,0,1,0,0,0,0], 27, 1); %Hamburg
    repmat([0,0,0,0,1,0,0,0], 34, 1); %London
    repmat([0,0,0,0,0,1,0,0], 21, 1); %Mannheim
    repmat([0,0,0,0,0,0,1,0], 21, 1); %Nottingham
    repmat([0,0,0,0,0,0,0,0], 17, 1); %Paris
    %Controls FU3
    repmat([1,0,0,0,0,0,0,0], 22, 1); %Berlin
    repmat([0,1,0,0,0,0,0,0], 33, 1); %Dresden
    repmat([0,0,1,0,0,0,0,0], 9, 1); %Dublin
    repmat([0,0,0,1,0,0,0,0], 27, 1); %Hamburg
    repmat([0,0,0,0,1,0,0,0], 34, 1); %London
    repmat([0,0,0,0,0,1,0,0], 21, 1); %Mannheim
    repmat([0,0,0,0,0,0,1,0], 21, 1); %Nottingham
    repmat([0,0,0,0,0,0,0,0], 17, 1); %Paris
    %Smokers BL
    repmat([1,0,0,0,0,0,0,0], 17, 1); %Berlin
    repmat([0,1,0,0,0,0,0,0], 16, 1); %Dresden
    repmat([0,0,1,0,0,0,0,0], 20, 1); %Dublin
    repmat([0,0,0,1,0,0,0,0], 22, 1); %Hamburg
    repmat([0,0,0,0,1,0,0,0], 13, 1); %London
    repmat([0,0,0,0,0,1,0,0], 15, 1); %Mannheim
    repmat([0,0,0,0,0,0,1,0], 16, 1); %Nottingham
    repmat([0,0,0,0,0,0,0,0], 12, 1); %Paris
    %Smokers FU3
    repmat([1,0,0,0,0,0,0,0], 17, 1); %Berlin
    repmat([0,1,0,0,0,0,0,0], 16, 1); %Dresden
    repmat([0,0,1,0,0,0,0,0], 20, 1); %Dublin
    repmat([0,0,0,1,0,0,0,0], 22, 1); %Hamburg
    repmat([0,0,0,0,1,0,0,0], 13, 1); %London
    repmat([0,0,0,0,0,1,0,0], 15, 1); %Mannheim
    repmat([0,0,0,0,0,0,1,0], 16, 1); %Nottingham
    repmat([0,0,0,0,0,0,0,0], 12, 1); %Paris
    ];


matlabbatch{1}.spm.stats.factorial_design.dir = {'./Results_2ndLevel'};
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).name = 'Group';
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).levels = 2;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).name = 'Timepoint';
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).levels = 2;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(2).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).levels = [1
                                                                    1];
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).scans = {}; #enter your beta_0001.nii,1 data
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).levels = [1
                                                                    2];
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).scans = {}; #enter your beta_0001.nii,1 data
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).levels = [2
                                                                    1];
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).scans = {}; #enter your beta_0001.nii,1 data
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).levels = [2
                                                                    2];
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).scans = {}; #enter your beta_0001.nii,1 data
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.contrasts = 1;
%%
matlabbatch{1}.spm.stats.factorial_design.cov(1).c = [C(:,1)];
%%
matlabbatch{1}.spm.stats.factorial_design.cov(1).cname = 'SitesBerlin';
matlabbatch{1}.spm.stats.factorial_design.cov(1).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(1).iCC = 1;
%%
matlabbatch{1}.spm.stats.factorial_design.cov(2).c = [C(:,2)];
%%
matlabbatch{1}.spm.stats.factorial_design.cov(2).cname = 'SitesDresden';
matlabbatch{1}.spm.stats.factorial_design.cov(2).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(2).iCC = 1;
%%
matlabbatch{1}.spm.stats.factorial_design.cov(3).c = [C(:,3)];
%%
matlabbatch{1}.spm.stats.factorial_design.cov(3).cname = 'SitesDublin';
matlabbatch{1}.spm.stats.factorial_design.cov(3).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(3).iCC = 1;
%%
matlabbatch{1}.spm.stats.factorial_design.cov(4).c = [C(:,4)];
%%
matlabbatch{1}.spm.stats.factorial_design.cov(4).cname = 'SitesHamburg';
matlabbatch{1}.spm.stats.factorial_design.cov(4).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(4).iCC = 1;
%%
matlabbatch{1}.spm.stats.factorial_design.cov(5).c = [C(:,5)];
%%
matlabbatch{1}.spm.stats.factorial_design.cov(5).cname = 'SitesLondon';
matlabbatch{1}.spm.stats.factorial_design.cov(5).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(5).iCC = 1;
%%
matlabbatch{1}.spm.stats.factorial_design.cov(6).c = [C(:,6)];
%%
matlabbatch{1}.spm.stats.factorial_design.cov(6).cname = 'SitesMannheim';
matlabbatch{1}.spm.stats.factorial_design.cov(6).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(6).iCC = 1;
%%
matlabbatch{1}.spm.stats.factorial_design.cov(7).c = [C(:,7)];
%%
matlabbatch{1}.spm.stats.factorial_design.cov(7).cname = 'SitesNottingham';
matlabbatch{1}.spm.stats.factorial_design.cov(7).iCFI = 1;
matlabbatch{1}.spm.stats.factorial_design.cov(7).iCC = 1;
%%
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;

spm_jobman('run',matlabbatch);
