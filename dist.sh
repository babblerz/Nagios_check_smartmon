#!/bin/sh

set -e

sh make.sh

version=`git tag -l|tail -n1`
name=playbeing-check-smartmon
distros="buster bionic focal"
for distro in $distros
do
	scp ${name}_${version}_all.deb repo@repo.playbeing.org:incoming/${distro}/main/.
done
ssh repo@repo.playbeing.org perl process-reprepro-incoming.pl
