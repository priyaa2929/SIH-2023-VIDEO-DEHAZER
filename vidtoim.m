clc
clear

% Input video file path
inputVideoPath = '.\input_video.mp4';

% Output video file path
outputVideoPath = 'output_video.mp4';

% Create a VideoReader object
videoObj = VideoReader(inputVideoPath);

% Initialize VideoWriter for output video using H.264 compression
outputVideo = VideoWriter(outputVideoPath, 'MPEG-4');
outputVideo.FrameRate = videoObj.FrameRate;
open(outputVideo);

i=0;
totalSSIM = 0;

% Process frames while reading the input video
while hasFrame(videoObj)
    disp(i);
    i=i+1;
    frame = readFrame(videoObj);
    
    % Process the frame (you can add your processing code here)
    
    [r,t]=Bounding_function(frame,4);
    processedFrame = r; % Replace with your processing logic
    
    % Calculate SSIM between original and processed frame
    frame = im2double(frame);
    processedFrame = im2double(processedFrame);
    ssimValue = ssim(frame, processedFrame);
    
    % Accumulate SSIM for average calculation
    totalSSIM = totalSSIM + ssimValue;
    
    % Display SSIM for each frame
    disp(['SSIM for frame ', num2str(i), ': ', num2str(ssimValue)]);
    
    % Write the processed frame to the output video
    writeVideo(outputVideo, processedFrame);
end

% Close the output video
close(outputVideo);

% Calculate and display the average SSIM
averageSSIM = totalSSIM / i;
disp(['Average SSIM: ', num2str(averageSSIM)]);

% Display completion message
fprintf('Video processing complete. Output saved to "%s".\n', outputVideoPath);
