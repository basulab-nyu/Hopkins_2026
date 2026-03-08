function FOV_ROIPlotter(template,color,rois,sessionType)
% template= 512x512 matrix of the template FOV for the imaging session
% color= RGB code for the desired color of the ROI mask
% rois= sparse double of roi masks 
% session type= string for the session type ('RF','OCGOL-A','OCGOL-B')

FOV=template;
roiSelected=reshape((sum(rois,2)),[512,512]);
roiSelected=roiSelected>0;
roiSelected=full(roiSelected);

% Normalize FOV to [0,1] for display
FOV_norm = mat2gray(FOV);

% Create an RGBroiSelected image from FOV for overlay in grayscale
%FOV_rgb = repmat(FOV_norm, [1 1 3]);

% --- Increase brightness ---
brightnessFactor = 1.5;   % increase brightness (adjust as needed)
FOV_bright = FOV_norm * brightnessFactor;
FOV_bright(FOV_bright > 1) = 1;  % clip values to valid range [0,1]
% --- Make FOV green instead of grayscale ---
FOV_rgb = zeros([size(FOV_bright), 3]);  % initialize RGB image
FOV_rgb(:,:,2) = FOV_bright;             % assign to green channel

% Define the overlay color for roiSelected (e.g., red)
overlayColor = color;  

% Create a 3D mask for roiSelected
roiSelected_mask = repmat(roiSelected, [1 1 3]);

% Create an empty RGroiSelected overlay image initialized to zeros
overlay = zeros(size(FOV_rgb));

% Assign the overlay color only where roiSelected==1
for c = 1:3
    overlay(:,:,c) = roiSelected_mask(:,:,c) * overlayColor(c);
end

% Set the transparency (alpha) for the overlay
alpha = 1;  % adjust for desired transparency

% Combine FOV_rgb and overlay with transparency
result = FOV_rgb .* (1 - alpha * roiSelected_mask) + overlay * alpha;

% Display the result
imshow(result)
title(sessionType)