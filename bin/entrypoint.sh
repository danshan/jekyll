#!/bin/bash

service nginx start

/tmp/qshell/qshell_linux_amd64 account $QINIU_ACCESS_KEY $QINIU_SECRET_KEY

sed -i 's/QINIU_ACCESS_KEY/'"$QINIU_ACCESS_KEY"'/g' /jekyll/qiniu/qupload_*.json
sed -i 's/QINIU_SECRET_KEY/'"$QINIU_SECRET_KEY"'/g' /jekyll/qiniu/qupload_*.json
/tmp/qshell/qshell_linux_amd64 qupload /jekyll/qiniu/qupload_assets.json
/tmp/qshell/qshell_linux_amd64 qupload /jekyll/qiniu/qupload_files.json

# jekyll build
