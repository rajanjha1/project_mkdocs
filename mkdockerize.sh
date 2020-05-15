#!/bin/bash

usage="usage : Script to first produce and later serve a website......"

if [[ "$1" = "" ]];
then
  printf "Hi there !! What do you want to do today?\ni\n" >&2
  printf "$usage\n" >&2
  exit 1
fi
if [[ "$#" -ne "1" ]]
then echo "Expecting one argument here either produce or serve........";
exit 1
fi
if [[ "$1" != "produce" && "$1" != "serve" ]];
then echo "Option would be either produce or serve........"
exit 1
fi
DIR=my_project

if [[ -d "$DIR" ]];
then rm -rf $DIR;
fi

if [[ "$1" = "produce" ]];
then
mkdocs new $DIR &>/dev/null;
cd $DIR;
cat > mkdocs.yml << EOL
site_name: rajan_jha
nav:
   - index.html
   - about_me.html
EOL
cd docs/;
echo "Hello All !! Hope you are doing well." >> about_me.html
echo "Hello There!!Hope you are doing well. This project is a demo project created by Rajan_Jha." >> index.html
rm -f index.md
cd ../..
tar -zcf $DIR.tar.gz $DIR;
rm -rf $DIR;
exit 1
fi
if [[ "$1" = "serve" ]];
then
printf "checking if website was correctly produced.....\n\n"
if [[ -f "$DIR.tar.gz" ]];
then
printf "website was produced successfully.....\n\nNow you are ready to serve the website.......\n\n"
printf "serving the website.....\n\n"
tar -xf $DIR.tar.gz && cd $DIR && mkdocs serve --dev-addr=localhost:8000
cd ..
rm -rf $DIR*
else
printf "project directory is missing.....\nplease produce the website first.....\n"
exit
fi
fi
