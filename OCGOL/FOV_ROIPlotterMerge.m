function FOV_ROIPlotterMerge(template,color,rois) 
% template= 512x512 matrix representing an average of multiple imaging
% color= matrix of colors in desired plotting order - each row is an rgb code
% rois= cell array of ROI sets in desired plotting order 

FOV=template;

% Normalize FOV to [0,1] for display
FOV_norm = mat2gray(FOV);

% Create an RGroiSelected image from FOV for overlay
FOV_rgb = repmat(FOV_norm, [1 1 3]);

% Set transparency of roi masks
alpha = 0.4;

% Initialize final image with base grayscale RGB image
result = FOV_rgb;

for ii=1:length(rois)
    % Prepare the figure for displaying the overlay
    roiSelected=reshape((sum(rois{ii},2)),[512,512]);
    roiSelected=roiSelected>0;
    roiSelected=full(roiSelected);
    % Define the overlay color for roiSelected (e.g., red)
    overlayColor = color(ii,:);  
    
    % Create a 3D mask for roiSelected
    roiSelected_mask = repmat(roiSelected, [1 1 3]);
    
    % Create an empty RGroiSelected overlay image initialized to zeros
    overlay = zeros(size(FOV_rgb));
    
    % Assign the overlay color only where roiSelected==1
    for c = 1:3
        overlay(:,:,c) = roiSelected_mask(:,:,c) * overlayColor(c);
    end
    
    % Combine FOV_rgb and overlay with transparency
    result = result .* (1 - alpha * roiSelected_mask) + overlay * alpha;
end
% Display the result
imshow(result)
title('Merge')