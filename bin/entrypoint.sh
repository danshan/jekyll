#!/bin/bash

service nginx start

/bin/bash /tmp/qshell/qshell account $QINIU_ACCESS_KEY $QINIU_SECRET_KEY
/bin/bash /tmp/qshell/qshell qupload /jekyll/qiniu/qupload_assets.json
/bin/bash /tmp/qshell/qshell qupload /jekyll/qiniu/qupload_files.json

# jekyll build
jekyll serve
