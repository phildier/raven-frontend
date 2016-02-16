#!/bin/bash

mkdir -p cache

deploy_dir='/vagrant'
chefdk_url='https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.4.0-1.x86_64.rpm'
chefdk_filename="$deploy_dir/cache/"`basename $chefdk_url`

# install chef dev kit. (includes berkshelf, needed below)
rpm -q chefdk &> /dev/null
if [ $? -ne 0 ]; then

	# download chefdk rpm
	if [ ! -f $chefdk_filename ]; then
		wget -qO "$chefdk_filename" "$chefdk_url"
	fi

	rpm --install "$chefdk_filename"
fi

# install git client
rpm -q git &> /dev/null
if [ $? -ne 0 ]; then
	yum -y install git
fi

# install 3rd party cookbooks
cd $deploy_dir
berks vendor --except site
