clc
clear
% Input video file path
inputVideoPath = 'input_video.mp4';

% Output video file path
outputVideoPath = 'output_video.mp4';

% Create a VideoReader object
videoObj = VideoReader(inputVideoPath);

% Initialize VideoWriter for output video using H.264 compression
outputVideo = VideoWriter(outputVideoPath, 'MPEG-4');
outputVideo.FrameRate = videoObj.FrameRate;
open(outputVideo);

% Process frames while reading the input video
while hasFrame(videoObj)

    frame = readFrame(videoObj);
    
    % Process the frame (you can add your processing code here)
    
    [r,t]=Bounding_function(frame,4);
    processedFrame = r; % Replace with your processing logic
    
    % Write the processed frame to the output video
    writeVideo(outputVideo, processedFrame);
end

% Close the output video
close(outputVideo);

% Display completion message
fprintf('Video processing complete. Output saved to "%s".\n', outputVideoPath);
