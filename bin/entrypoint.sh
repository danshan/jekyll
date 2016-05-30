#!/bin/bash

service nginx start
bundle exec jekyll build
bundle exec jekyll serve
