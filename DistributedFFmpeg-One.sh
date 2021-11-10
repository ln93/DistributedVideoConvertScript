#! /bin/bash
function FileSuffix() {
    local filename="$1"
    if [ -n "$filename" ]; then
        echo "${filename##*.}"
    fi
}
function FilePrefix() {
    local filename="$1"
    if [ -n "$filename" ]; then
        echo "${filename%.*}"
    fi
}
function IsSuffix() {
    local filename="$1"
    local suffix="$2"
    if [ "$(FileSuffix ${filename})" = "$suffix" ]; then
        return 0
    else
        return 1
    fi
}
function read_dir(){
for file in `ls $1` 
do
 if [ -d $1"/"$file ]; 
 then
  read_dir $1"/"$file
 else
  IsSuffix ${file} "mp4"
  if [ $? -eq 0 ];
  then
   if [ ! -f $1"/"${file%%mp4}"mkv" ];
   then
    ffmpeg -threads 16 -i $1"/"$file -c:v libx265  -crf 26 $1"/"${file%%mp4}"mkv" 
    rm $1"/"$file
	exit 0
   fi
  fi
 fi
done
} 

read_dir .

