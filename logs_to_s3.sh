#!/bin/bash
dir_path="/media/intel-nuc-ubuntu/Extension/new_logs"
dest_path="/media/intel-nuc-ubuntu/Extension/Wireshark_logs"
bucket_name="wireshark-logs-dump-connected-vehicle"

for file in $dir_path/*; do
  if [ -f "$file" ]; then
    echo "Uploading $file to S3..."
    aws s3 cp $file s3://$bucket_name/$(basename $file)
    mv $file $dest_path/
  fi
done

