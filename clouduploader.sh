file_name=$1
bucket_name=$2

if test -f "file_name"; then
        echo "$file_name found, continue with upload"
else
        echo "File does not exist"
fi

upload_output=$(aws s3 cp "$file_name" s3://"$bucket_name"/ 2>&1)

upload_status=$?

if [ $upload_status -eq 0 ]; then
        echo "Upload successful!"
else
        echo "Upload failed: $upload_output."
fi
