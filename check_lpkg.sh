#!/bin/bash

unzip -B '*.lpkg'
wait
find . -type f -iname \*.jar -delete
wait
grep 'title=\|version=\|icon-url=\|remote-app-id=' *liferay-marketplace* >> lpkg_details.txt
find . -type f -iname \*.properties\* -delete
wait
sed -i 's/liferay-marketplace\.properties.*=/|/' "lpkg_details.txt"
wait
tr -d '\n' < "lpkg_details.txt" > "lpkg_details.tmp" && mv "lpkg_details.tmp" "lpkg_details.txt"
wait
printf "Jobs done!";