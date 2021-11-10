# DistributedVideoConvertScript
Let your every computer (or Raspberry pi) to compress your videos on NAS to H265. Useful if you have tons of video to convert.
## Usage
1. Install FFmpeg on your computers.
2. Put the shell script on your NAS, along with your videos.
3. Run the script with every computer you have.

## Algorithm
Use the existence of generated .mkv video as a mutex. Not perfect, but useful.
