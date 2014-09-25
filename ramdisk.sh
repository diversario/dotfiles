diskutil erasevolume HFS+ RAMDisk `hdiutil attach -nomount ram://409600`
mkdir -p /Volumes/RAMDisk/var/lib/mysql
mysql_install_db --user=diversario --basedir=/usr/local --ldata=/Volumes/RAMDisk/var/lib/mysql/
