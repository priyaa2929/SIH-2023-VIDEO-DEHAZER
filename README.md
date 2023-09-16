# VideoDehazer
To dehaze the video, add a video with name input.mp4. This can be changed to read from a directory. and then run vidtoim.m


suggestions for future use:
1. you can use lower frame rate for faster processing (this will require you to explore the documentation a little)
2. this matlab code can be converted to CUDA programming in matlab so that it can be used as an executable in jetson. No need to convert it into pyhton.
3. Because of parallel proccessing of jetson, can is estimated to convert 480p videos or more in real time. I used 360p video to test it.
4. To produce a real time video, I have thought about sending origninal and dehazed frame every time it is processed and the images section is refreshed quite
   fast to produce an effect of a video display.
5. In the above case, sir's original code can be converted to output input and output frames in real time

