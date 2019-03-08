%     NeuroSLAM System Copyright (C) 2018-2019 
%     NeuroSLAM: A Brain inspired SLAM System for 3D Environments
%
%     Fangwen Yu (www.yufangwen.com), Jianga Shang, Youjian Hu, Michael Milford(www.michaelmilford.com) 
%
%     The NeuroSLAM V1.0 (MATLAB) was developed based on the OpenRatSLAM (David et al. 2013). 
%     The RatSLAM V0.3 (MATLAB) developed by David Ball, Michael Milford and Gordon Wyeth in 2008.
% 
%     Reference:
%     Ball, David, Scott Heath, Janet Wiles, Gordon Wyeth, Peter Corke, and Michael Milford.
%     "OpenRatSLAM: an open source brain-based SLAM system." Autonomous Robots 34, no. 3 (2013): 149-176.
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <http://www.gnu.org/licenses/>.

clear workspace

visual_odo_initial( ...
    'ODO_IMG_TRANS_Y_RANGE', 1:270, ...
    'ODO_IMG_TRANS_X_RANGE', 1:480, ...
    'ODO_IMG_HEIGHT_V_Y_RANGE', 1:270, ...
    'ODO_IMG_HEIGHT_V_X_RANGE', 1:480, ...
    'ODO_IMG_YAW_ROT_Y_RANGE', 1:270, ...
    'ODO_IMG_YAW_ROT_X_RANGE', 1:480, ...
    'ODO_IMG_TRANS_RESIZE_RANGE', [130, 240], ...
    'ODO_IMG_YAW_ROT_RESIZE_RANGE', [130, 240], ...
    'ODO_IMG_HEIGHT_V_RESIZE_RANGE', [130, 240], ...
    'ODO_TRANS_V_SCALE', 30, ...
    'ODO_YAW_ROT_V_SCALE', 1, ...
    'ODO_HEIGHT_V_SCALE', 5, ...
    'MAX_TRANS_V_THRESHOLD', 0.4, ...
    'MAX_YAW_ROT_V_THRESHOLD', 4.2, ...
    'MAX_HEIGHT_V_THRESHOLD', 0.4, ... 
    'ODO_SHIFT_MATCH_HORI', 30, ...
    'ODO_SHIFT_MATCH_VERT', 30, ...
    'FOV_HORI_DEGREE', 75, ...
    'FOV_VERT_DEGREE', 20, ...
    'KEY_POINT_SET', [3750, 4700, 8193, 9210], ...
    'ODO_STEP', 5);


% vt initial               
vt_image_initial('*.png', ...
    'VT_MATCH_THRESHOLD', 3.4, ...
    'VT_IMG_CROP_Y_RANGE', 1:270, ...
    'VT_IMG_CROP_X_RANGE', 1:480, ...
    'VT_IMG_RESIZE_X_RANGE', 48, ...
    'VT_IMG_RESIZE_Y_RANGE', 27, ...
    'VT_IMG_X_SHIFT', 5, ...
    'VT_IMG_Y_SHIFT', 3, ...
    'VT_GLOBAL_DECAY', 0.5, ...
    'VT_ACTIVE_DECAY', 0.5, ...
    'PATCH_SIZE_Y_K', 5, ...
    'PATCH_SIZE_X_K', 5, ...
    'VT_PANORAMIC', 0, ...
    'VT_STEP', 1);


% yaw_height_hdc initial 
yaw_height_hdc_initial( ...
    'YAW_HEIGHT_HDC_Y_DIM', 36, ...
    'YAW_HEIGHT_HDC_H_DIM', 36, ...
    'YAW_HEIGHT_HDC_EXCIT_Y_DIM', 8, ...
    'YAW_HEIGHT_HDC_EXCIT_H_DIM', 8, ...
    'YAW_HEIGHT_HDC_INHIB_Y_DIM', 5, ...
    'YAW_HEIGHT_HDC_INHIB_H_DIM', 5, ...
    'YAW_HEIGHT_HDC_EXCIT_Y_VAR', 1.9, ...
    'YAW_HEIGHT_HDC_EXCIT_H_VAR', 1.9, ...
    'YAW_HEIGHT_HDC_INHIB_Y_VAR', 3.1, ...
    'YAW_HEIGHT_HDC_INHIB_H_VAR', 3.1, ...
    'YAW_HEIGHT_HDC_GLOBAL_INHIB', 0.0002, ...
    'YAW_HEIGHT_HDC_VT_INJECT_ENERGY', 0.1, ...
    'YAW_ROT_V_SCALE', 1, ...  
    'HEIGHT_V_SCALE', 1, ...   
    'YAW_HEIGHT_HDC_PACKET_SIZE', 5);

% 3d gc initial
gc_initial( ...
    'GC_X_DIM', 36, ...
    'GC_Y_DIM', 36, ...
    'GC_Z_DIM', 36, ...
    'GC_EXCIT_X_DIM', 7, ...
    'GC_EXCIT_Y_DIM', 7, ...
    'GC_EXCIT_Z_DIM', 7, ...
    'GC_INHIB_X_DIM', 5, ...
    'GC_INHIB_Y_DIM', 5, ...
    'GC_INHIB_Z_DIM', 5, ...
    'GC_EXCIT_X_VAR', 1.5, ...
    'GC_EXCIT_Y_VAR', 1.5, ...
    'GC_EXCIT_Z_VAR', 1.5, ...
    'GC_INHIB_X_VAR', 2, ...
    'GC_INHIB_Y_VAR', 2, ...
    'GC_INHIB_Z_VAR', 2, ...
    'GC_GLOBAL_INHIB', 0.0002, ...  
    'GC_VT_INJECT_ENERGY', 0.1, ...   
    'GC_HORI_TRANS_V_SCALE', 1, ...
    'GC_VERT_TRANS_V_SCALE', 1, ...  
    'GC_PACKET_SIZE', 4);
   
% 3d em initial 1/2/5/
exp_initial( ...
    'DELTA_EXP_GC_HDC_THRESHOLD', 30, ...
    'EXP_LOOPS', 5, ...
    'EXP_CORRECTION', 0.5 ); 
    
% main process 
% file path: visualDataFile, expMapHistoryFile, odoMapHistoryFile, groundTruthFile,vtHistoryFile, emHistoryFile, varargin

imageFolderPath = 'C:\NeuroSLAM_Datasets\01_NeuroSLAM_Datasets\03_QUTCarparkData';
SynPerDataFile = fullfile (imageFolderPath, '');

gtDataFolderPath = '';
gtDataFile = fullfile(gtDataFolderPath, '');

experiDataPath = 'C:\NeuroSLAM_Datasets\03_NeuroSLAM_Experiments_Results\QUTCarparData';
expMapFile  = fullfile(experiDataPath, '01_exp_map_ml.txt');
odoMapFile  = fullfile(experiDataPath, '02_odo_map_ml.txt');
emHisFile   = fullfile(experiDataPath, '03_em_history_ml.txt');
vtHisFile   = fullfile(experiDataPath, '04_vt_history_ml.txt');
gcTrajFile  = fullfile(experiDataPath, '05_gc_trajectory.txt');
hdcTrajFile = fullfile(experiDataPath, '06_hdc_trajectory.txt');

main(SynPerDataFile, ...
    gtDataFile, ...
    expMapFile, ...
    odoMapFile, ...
    emHisFile, ...
    vtHisFile, ...    
    gcTrajFile, ...
    hdcTrajFile, ...
    'BLOCK_READ', 50, ...
    'RENDER_RATE', 2, ...
    'GT_ODO_X_SCALING', 20, ...
    'GT_ODO_Y_SCALING', 20, ...
    'GT_ODO_Z_SCALING', 20, ...
    'GT_EXP_X_SCALING', 20, ...
    'GT_EXP_Y_SCALING', 20, ...
    'GT_EXP_Z_SCALING', 20, ...
    'ODO_MAP_X_SCALING', -0.8, ...
    'ODO_MAP_Y_SCALING', 0.8, ...
    'ODO_MAP_Z_SCALING', 0.1, ...
    'EXP_MAP_X_SCALING', 0.8, ...
    'EXP_MAP_Y_SCALING', 0.8, ...
    'EXP_MAP_Z_SCALING', 0.1);