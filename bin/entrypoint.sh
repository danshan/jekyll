#!/bin/bash

service nginx start

/bin/bash /tmp/qshell/qshell_linux_amd64 account $QINIU_ACCESS_KEY $QINIU_SECRET_KEY
/bin/bash /tmp/qshell/qshell_linux_amd64 qupload /jekyll/qiniu/qupload_assets.json
/bin/bash /tmp/qshell/qshell_linux_amd64 qupload /jekyll/qiniu/qupload_files.json

# jekyll build
jekyll serve
