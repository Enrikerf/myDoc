#!/bin/bash

pwd=$(pwd)
cd /usr/local/etc/php/7.4/conf.d
CHAR=$(head -c20 ext-xdebug.ini)
echo "current Status of file:"
echo "${CHAR}"
echo "---"
if [[ $CHAR == *"#"* ]]; then
sed -i "" "s/#zend_extension=/zend_extension=/" ext-xdebug.ini
echo "toggled to enabled"
else
sed -i "" "s/zend_extension=/#zend_extension=/" ext-xdebug.ini
echo "toggled to disabled"
fi
(brew services restart php)

cd $pwd
