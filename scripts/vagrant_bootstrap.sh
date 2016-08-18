#!/bin/bash

deploy_dir='/vagrant'
cd $deploy_dir
mkdir -p cache
berks vendor 
