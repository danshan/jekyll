#!/bin/bash

service nginx start
jekyll build
jekyll serve
