tput clear

highlight=$(tput bold)
success=$(tput setaf 2)
normal=$(tput sgr0)



tput smso
echo "Welcome to Setting up your plugin"
tput rmso

# Get Plugin Name
read -p "Enter your plugin's name [My New Plugin]: " pluginName
pluginName=${pluginName:-My New Plugin}

# Get Plugin Folder Name
read -p "Enter your plugin's folder name [my-new-plugin]: " pluginFolderName
pluginFolderName=${pluginFolderName:-my-new-plugin}
pluginSlug=${pluginFolderName:-my-new-plugin}
pluginZipFileName=${pluginFolderName:-my-new-plugin}.zip


# Ask if should use NPM and Laravel Mix
echo "Do you want to use NPM and Laravel Mix (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo ; useLaravelMix=$(head -c 1) ; stty $old_stty_cfg # Careful playing with stty



# Get Plugin Description
read -p "Enter your plugin's Short Description [This is the plugin Short description]: " pluginShortDescription
pluginShortDescription=${pluginShortDescription:-This is the plugin description}





# Get Plugin Description
read -p "Enter your plugin's Long Description [$pluginShortDescription]: " pluginLongDescription
pluginLongDescription=${pluginLongDescription:-$pluginShortDescription}



# ACF License Key
tput setaf 6

#require input
unset AcfLicenseKey
while [ -z ${AcfLicenseKey} ]; do
  read -p "Enter your ACF Pro License Key (required):" AcfLicenseKey
done
tput sgr0
AcfLicenseKey=${AcfLicenseKey:-}

# Get Plugin Author
read -p "Enter your plugin's Author (your WordPress.org @ user name []: " pluginAuthor
pluginAuthor=${pluginAuthor:-}

# Get Plugin Author
read -p "Enter your plugin's Author's email [user@domain.com]:" pluginAuthorEmail
pluginAuthorEmail=${pluginAuthorEmail:-user@domain.com}

# Get Plugin text Domain
read -p "Enter your plugin's text domain [myplugin]: " pluginTextDomain
pluginTextDomain=${pluginTextDomain:-myplugin}


 #Require Plugin GitHub Repository
 tput setaf 6
unset pluginGitURI
while [ -z ${pluginGitURI} ]; do
  read -p "Enter your plugin's repository URI: " pluginGitURI
done
pluginGitURI=${pluginGitURI:-}
tput sgr0




 # Get Required WordPress Version
read -p "Enter your plugin's Required WordPress version [5.6]: " pluginMinWordPress
 pluginMinWordPress=${pluginMinWordPress:-5.6}

 # Get Required WordPress Tested Version
read -p "Enter your plugin's Tested up to WordPress version [5.8]: " pluginTestedUpTo
 pluginTestedUpTo=${pluginTestedUpTo:-5.8}

  # Get Required PHP Version
read -p "Enter your plugin's Required PHP version [7.4]: " pluginPHPVersion
 pluginPHPVersion=${pluginPHPVersion:-7.3}



echo ''
tput setaf 3
echo "Confirm the following settings are correct before proceeding. Some of these settings are in addition to your entries above."
tput sgr0


echo "${highlight}Plugin Name:${normal} $pluginName"
echo "${highlight}Plugin Folder Name:${normal} $pluginFolderName"
echo "${highlight}Plugin Short Description:${normal} $pluginShortDescription"
echo "${highlight}Plugin Long Description:${normal} $pluginLongDescription"
echo "${highlight}Plugin text domain:${normal} $pluginTextDomain"
echo "${highlight}Plugin Git Repo URI:${normal} $pluginGitURI"
echo "${highlight}Minimum WordPress Version:${normal} $pluginMinWordPress"
echo "${highlight}Plugin Author:${normal} $pluginAuthor"
echo "${highlight}Plugin Slug:${normal} $pluginSlug"
echo "${highlight}Plugin Zip File Name:${normal} $pluginZipFileName"
tput setaf 3
read -p "⚠️ Are you sure that you want to create a plugin with the above settings? (y/N) " -n 1 -r
tput sgr0
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then


  #create plugin folder
   mkdir ../$pluginFolderName
# Setup WordPress plugin main php file
  # Copy and rename template file

  cp file_templates/create_plugin_files/main_plugin_file.php ../$pluginFolderName/$pluginFolderName.php

  # add values to the file
  sed -i '' "s/\[pluginName\]/$pluginName/g" ../$pluginFolderName/$pluginFolderName.php
  sed -i '' "s/\[pluginShortDescription\]/$pluginShortDescription/g" ../$pluginFolderName/$pluginFolderName.php
  sed -i '' "s/\[pluginAuthor\]/$pluginAuthor/g" ../$pluginFolderName/$pluginFolderName.php
  sed -i '' "s/\[pluginTextDomain\]/$pluginTextDomain/g" ../$pluginFolderName/$pluginFolderName.php
    sed -i '' "s/\[pluginFolderName\]/$pluginFolderName/g" ../$pluginFolderName/$pluginFolderName.php
        sed -i '' "s/\[pluginSlug\]/$pluginSlug/g" ../$pluginFolderName/$pluginFolderName.php


  # Show Success Message
  echo "${success}$pluginFolderName.php file setup has completed.${normal}"



### Setup the WordPress plugin readme.txt file    ###

  #Copy and rename template file
      cp file_templates/create_plugin_files/readme.txt ../$pluginFolderName/readme.txt
  # add values to the file
      sed -i '' "s/\[pluginName\]/$pluginName/g" ../$pluginFolderName/readme.txt
      sed -i '' "s/\[pluginAuthor\]/$pluginAuthor/g" ../$pluginFolderName/readme.txt
      sed -i '' "s/\[pluginMinWordPress\]/$pluginMinWordPress/g" ../$pluginFolderName/readme.txt
      sed -i '' "s/\[pluginTestedUpTo\]/$pluginTestedUpTo/g" ../$pluginFolderName/readme.txt
      sed -i '' "s/\[pluginPHPVersion\]/$pluginPHPVersion/g" ../$pluginFolderName/readme.txt
      sed -i '' "s/\[pluginShortDescription\]/$pluginShortDescription/g" ../$pluginFolderName/readme.txt
      sed -i '' "s/\[pluginLongDescription\]/$pluginLongDescription/g" ../$pluginFolderName/readme.txt
  # show success message
  echo "${success}WordPress readme.txt file setup has completed${normal}"


### Setup the Github Release WorkFlow File    ###

  #setup Github Release WorkFlow File
  mkdir -p ../$pluginFolderName/.github
  mkdir -p ../$pluginFolderName/.github/workflows
   cp file_templates/create_plugin_files/release.yml ../$pluginFolderName/.github/workflows/release.yml
   sed -i '' "s/\[pluginZipFileName\]/$pluginZipFileName/g" ../$pluginFolderName/.github/workflows/release.yml
   echo "${success}Github Release WorkFlow File has completed${normal}"
fi


### Setup the project composer file    ###
  # Copy and rename template file
  cp file_templates/create_plugin_files/composer.json ../$pluginFolderName/composer.json

  # Add values to the file
  sed -i '' "s/\[pluginTextDomain\]/$pluginTextDomain/g" ../$pluginFolderName/composer.json
  sed -i '' "s/\[pluginSlug\]/$pluginSlug/g" ../$pluginFolderName/composer.json
  sed -i '' "s/\[pluginShortDescription\]/$pluginShortDescription/g" ../$pluginFolderName/composer.json
  sed -i '' "s/\[pluginAuthor\]/$pluginAuthor/g" ../$pluginFolderName/composer.json
  sed -i '' "s/\[pluginAuthorEmail\]/$pluginAuthorEmail/g" ../$pluginFolderName/composer.json


  ## Setup the .env file
  cp file_templates/create_plugin_files/.env ../$pluginFolderName/.env
  # Add values to the file
  sed -i '' "s/\[AcfLicenseKey\]/$AcfLicenseKey/g" ../$pluginFolderName/.env

  ## Setup the .gitignore file
  cp file_templates/create_plugin_files/.gitignore ../$pluginFolderName/.gitignore

  ## Setup the .gitignore file
  cp file_templates/create_plugin_files/releasing-a-plugin.md ../$pluginFolderName/releasing-a-plugin.md

tput smso
echo ''
tput setaf 2
echo "Setup is complete. Move the folder $pluginFolderName into your wp-content/plugins directory "
echo "Add your ACF Key as a secret to your github repository, no doing so will cause composer to fail."
echo "Secret Name: ACF_PRO_KEY"
tput sgr0
tput rmso


# Install Composer Packages
echo -n "Run composer now (y/n)? "
old_stty_cfg=$(stty -g)
stty raw -echo ; runcomposer=$(head -c 1) ; stty $old_stty_cfg # Careful playing with stty
if echo "$runcomposer" | grep -iq "^y" ;then
    cd ../$pluginFolderName/
    composer install
    cd ../project_wizards
else
    echo No Composer
fi



# Setup Laravel Mix

if echo "$useLaravelMix" | grep -iq "^y" ;then
    echo Setting up NPM and Laravel Mix
     cp file_templates/laravel_mix_setup_files/package.json ../$pluginFolderName/package.json
     cp file_templates/laravel_mix_setup_files/webpack.mix.js ../$pluginFolderName/webpack.mix.js
     cat ../webpack.mix.js >> ../$pluginFolderName/$pluginFolderName.php
else
    echo No Laravel
fi



# Do you want to initialize git?
echo -n "Do you want to initialize git? (y/n)? "
old_sttyy_cfg=$(stty -g)
stty raw -echo ; initializegit=$(head -c 1) ; stty $old_sttyy_cfg # Careful playing with stty
if echo "$initializegit" | grep -iq "^y" ;then
    cd ../$pluginFolderName/
    git init
    git add *
    git add .github/
    git add .gitignore
    git commit -m "INIT $pluginFolderName"
    git remote add origin $pluginGitURI
    git push origin master
    git status


    cd ../project_wizards





else
    echo No Composer
fi


