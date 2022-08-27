%-----------------------------------------------------------------------
% Job saved on 17-Feb-2022 12:44:34 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
controls = [];
smokers = [];

seeds_names = {'Amygdala_Right' 'Amygdala_Left' 'Precuneus_posterior' 'Precuneus_anterior' 'Precuneus_superior' 'Precuneus_inferior' 'dmPFC' 'vmPFC'};
seeds_coord = {[25 -9 -21] [-22 -4 -20] [0 -68 43] [0 -43 54] [0 -57 52] [0 -63 29] [0 38 43] [-1 47 -13]};
cd '/data';


for ii = 1:numel(seeds_names)
    for control=controls
        subject = num2str(control, '%012d');
        cd '/seeds';

        bl_dir = strcat(pwd, '/Results_1stLevel/controls/BL/', 'Results_1stLevel_',subject);
        fu3_dir = strcat(pwd, '/Results_1stLevel/controls/FU3/', 'Results_1stLevel_',subject);

        clear matlabbatch
        display(strcat('Starting contrast manager'))

        %Contrast manager
        matlabbatch{1}.spm.stats.con.spmmat = cellstr(strcat(bl_dir, '/SPM.mat'));
        matlabbatch{1}.spm.stats.con.consess{1}.fcon.name = 'EOI';
        matlabbatch{1}.spm.stats.con.consess{1}.fcon.weights = 1;
        matlabbatch{1}.spm.stats.con.consess{1}.fcon.sessrep = 'none';
        matlabbatch{1}.spm.stats.con.delete = 0;

        clear matlabbatch
        display(strcat('Starting extracting timeseries with controls'))

        %Extracting timeseries
        matlabbatch{1}.spm.util.voi.spmmat = cellstr(strcat(bl_dir, '/SPM.mat'));
        matlabbatch{1}.spm.util.voi.adjust = 1;
        matlabbatch{1}.spm.util.voi.session = 1;
        matlabbatch{1}.spm.util.voi.name = seeds_names{ii};
        matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''};

        %Thresholded SPM
        matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 1;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
        matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});

        %Large fixed outer sphere
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.centre = seeds_coord{ii};
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.radius = 6;
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.move.fixed = 1;

        %Smaller inner sphere which jumps to the peak of the outer sphere
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 3;
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2';

        %Exression
        matlabbatch{1}.spm.util.voi.expression = 'i1 & i3';

        %Run the batch
        spm_jobman('run', matlabbatch);


        %FU3 timeseries extraction
        clear matlabbatch
        display(strcat('Starting contrast manager'))

        %Contrast manager
        matlabbatch{1}.spm.stats.con.spmmat = cellstr(strcat(fu3_dir, '/SPM.mat'));
        matlabbatch{1}.spm.stats.con.consess{1}.fcon.name = 'EOI';
        matlabbatch{1}.spm.stats.con.consess{1}.fcon.weights = 1;
        matlabbatch{1}.spm.stats.con.consess{1}.fcon.sessrep = 'none';
        matlabbatch{1}.spm.stats.con.delete = 0;

        clear matlabbatch
        display(strcat('Starting extracting timeseries'))

        %Extracting timeseries
        matlabbatch{1}.spm.util.voi.spmmat = cellstr(strcat(fu3_dir, '/SPM.mat'));
        matlabbatch{1}.spm.util.voi.adjust = 0;
        matlabbatch{1}.spm.util.voi.session = 1;
        matlabbatch{1}.spm.util.voi.name = seeds_names{ii};
        matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''};

        %Thresholded SPM
        matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 1;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
        matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});

        %Large fixed outer sphere
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.centre = seeds_coord{ii};
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.radius = 6;
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.move.fixed = 1;

        %Smaller inner sphere which jumps to the peak of the outer sphere
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 3;
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2';


        %Exression
        matlabbatch{1}.spm.util.voi.expression = 'i1 & i3';

        %Run the batch
        spm_jobman('run', matlabbatch);
    end
end


for ii = 1:numel(seeds_names)
    for smoker = smokers
        subject = num2str(smoker, '%012d');
        cd '/seeds';

        bl_dir = strcat(pwd, '/Results_1stLevel/smokers/BL/', 'Results_1stLevel_',subject);
        fu3_dir = strcat(pwd, '/Results_1stLevel/smokers/FU3/', 'Results_1stLevel_',subject);

        clear matlabbatch
        display(strcat('Starting contrast manager'))

        %Contrast manager
        matlabbatch{1}.spm.stats.con.spmmat = cellstr(strcat(bl_dir, '/SPM.mat'));
        matlabbatch{1}.spm.stats.con.consess{1}.fcon.name = 'EOI';
        matlabbatch{1}.spm.stats.con.consess{1}.fcon.weights = 1;
        matlabbatch{1}.spm.stats.con.consess{1}.fcon.sessrep = 'none';
        matlabbatch{1}.spm.stats.con.delete = 0;

        clear matlabbatch
        display(strcat('Starting extracting timeseries with smokers'))

        %Extracting timeseries
        matlabbatch{1}.spm.util.voi.spmmat = cellstr(strcat(bl_dir, '/SPM.mat'));
        matlabbatch{1}.spm.util.voi.adjust = 0;
        matlabbatch{1}.spm.util.voi.session = 1;
        matlabbatch{1}.spm.util.voi.name = seeds_names{ii};
        matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''};

        %Thresholded SPM
        matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 1;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
        matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});

        %Large fixed outer sphere
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.centre = seeds_coord{ii};
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.radius = 6;
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.move.fixed = 1;

        %Smaller inner sphere which jumps to the peak of the outer sphere
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 3;
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2';

        %Exression
        matlabbatch{1}.spm.util.voi.expression = 'i1 & i3';

        %Run the batch
        spm_jobman('run', matlabbatch);


        %FU3 timeseries extraction
        clear matlabbatch
        display(strcat('Starting contrast manager'))

        %Contrast manager
        matlabbatch{1}.spm.stats.con.spmmat = cellstr(strcat(fu3_dir, '/SPM.mat'));
        matlabbatch{1}.spm.stats.con.consess{1}.fcon.name = 'EOI';
        matlabbatch{1}.spm.stats.con.consess{1}.fcon.weights = 1;
        matlabbatch{1}.spm.stats.con.consess{1}.fcon.sessrep = 'none';
        matlabbatch{1}.spm.stats.con.delete = 0;

        clear matlabbatch
        display(strcat('Starting extracting timeseries'))

        %Extracting timeseries
        matlabbatch{1}.spm.util.voi.spmmat = cellstr(strcat(fu3_dir, '/SPM.mat'));
        matlabbatch{1}.spm.util.voi.adjust = 0;
        matlabbatch{1}.spm.util.voi.session = 1;
        matlabbatch{1}.spm.util.voi.name = seeds_names{ii};
        matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = {''};

        %Thresholded SPM
        matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 1;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
        matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
        matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});

        %Large fixed outer sphere
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.centre = seeds_coord{ii};
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.radius = 6;
        matlabbatch{1}.spm.util.voi.roi{2}.sphere.move.fixed = 1;

        %Smaller inner sphere which jumps to the peak of the outer sphere
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 3;
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
        matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2';


        %Exression
        matlabbatch{1}.spm.util.voi.expression = 'i1 & i3';

        %Run the batch
        spm_jobman('run', matlabbatch);
    end
end


