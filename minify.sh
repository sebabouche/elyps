#!/bin/bash
rm -rf build/
mkdir build
mkdir build/assets/
mkdir build/assets/bootstrap/
mkdir build/assets/bootstrap/css/
mkdir build/assets/bootstrap/fonts/
mkdir build/assets/bootstrap/js/
mkdir build/assets/css/
mkdir build/assets/fonts/
mkdir build/assets/images/
mkdir build/assets/js

cp -R assets/bootstrap/fonts/ build/assets/bootstrap/fonts/
cp -R assets/images/ build/assets/images
cp -R assets/fonts/ build/assets/fonts
cp favicon.ico build/favicon.ico

echo "build folder reset"

echo "`tput setaf 5`Minifying html index.html...`tput op`"
html-minifier --collapse-whitespace --remove-comments --remove-optional-tags --remove-redundant-attributes --remove-script-type-attributes --remove-tag-whitespace --use-short-doctype index.html -o build/index.html

echo "`tput setaf 5`Minifying css bootstrap...`tput op`"
postcss assets/bootstrap/css/bootstrap.min.css > build/assets/bootstrap/css/bootstrap.min.css

echo "`tput setaf 5`Minifying css font awesome...`tput op`"
postcss assets/fonts/font-awesome.min.css > build/assets/fonts/font-awesome.min.css

echo "`tput setaf 5`Minifying css linear fonts...`tput op`"
postcss assets/fonts/linear-fonts.css > build/assets/fonts/linear-fonts.css

echo "`tput setaf 5`Minifying css animate...`tput op`"
postcss assets/css/animate.min.css > build/assets/css/animate.min.css

echo "`tput setaf 5`Minifying css custom styles...`tput op`"
postcss assets/css/style.css > build/assets/css/style.css

echo "`tput setaf 5`Minifying css responsive...`tput op`"
postcss assets/css/responsive.css > build/assets/css/responsive.css

echo "`tput setaf 5`Minifying css cookie consent...`tput op`"
postcss assets/css/cookieconsent.min.css > build/assets/css/cookieconsent.min.css

echo "`tput setaf 5`Minifying js jquery...`tput op`"
uglifyjs --compress --mangle -o build/assets/js/jquery.min.js -- assets/js/jquery.min.js

echo "`tput setaf 5`Minifying js jquery bootstrap...`tput op`"
uglifyjs --compress --mangle -o build/assets/bootstrap/js/bootstrap.min.js -- assets/bootstrap/js/bootstrap.min.js

echo "`tput setaf 5`Minifying js jquery mixitup...`tput op`"
uglifyjs --compress --mangle -o build/assets/js/jquery.mixitup.js -- assets/js/jquery.mixitup.js

echo "`tput setaf 5`Minifying js jquery wow...`tput op`"
uglifyjs --compress --mangle -o build/assets/js/wow.min.js -- assets/js/wow.min.js

echo "`tput setaf 5`Minifying js custom scripts...`tput op`"
uglifyjs --compress --mangle -o build/assets/js/scripts.js -- assets/js/scripts.js

echo "`tput setaf 5`Minifying js cookie consent...`tput op`"
uglifyjs --compress --mangle -o build/assets/js/cookieconsent.min.js -- assets/js/cookieconsent.min.js

echo "`tput setaf 2`Project minified in dicrectory build!`tput op`"
