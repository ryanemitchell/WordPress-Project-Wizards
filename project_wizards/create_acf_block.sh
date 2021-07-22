#!/bin/bash
tput clear

highlight=$(tput bold)
success=$(tput setaf 2)
normal=$(tput sgr0)


tput smso
echo "Welcome to Setting up your new ACF Block"
tput rmso
# Get Plugin Name
read -p "Enter your block name [My New Block]: " blockName
blockName=${blockName:-My New Block}

# Get Plugin Slug and create UnderSlug
read -p "Enter your block slug [my-new-block]: " blockSlug
blockSlug=${blockSlug:-my-new-block}
blockUnderSlug=$(echo $blockSlug | tr '-' '_')
blockCamelSlug=$(echo $blockSlug | perl -pe 's/-(.)/\u$1/g')

echo $blockCamelSlug

# Set Block Category
read -p "Enter your block category [wit-blocks]: " blockCategory
blockCategory=${blockCategory:-wit-blocks}

# Set Block Category
read -p "IF this block is part of a collection of blocks euner the className for the collection here  [rmm-block]: " blockClass
blockClass=${blockClass:-rmm-block}

# Set Block Category
read -p "Enter your guthub @ username [@username]: " blockAuthor
blockAuthor=${blockAuthor:-@username}

#Create the New Block
mkdir -p ../app
mkdir -p ../app/acf-blocks
cp -a file_templates/acf_block_setup_files/acf_block_template/ ../app/acf-blocks/$blockSlug/

## Customize the Block
  # add values to the register_block.php file
#sed -i '' "s/\[blockName\]/$blockName/g" ../app/acf-blocks/$blockSlug/register_block.php
#sed -i '' "s/\[blockSlug\]/$blockSlug/g" ../app/acf-blocks/$blockSlug/register_block.php
#sed -i '' "s/\[blockUnderSlug\]/$blockUnderSlug/g" ../app/acf-blocks/$blockSlug/register_block.php
#sed -i '' "s/\[blockCategory\]/$blockCategory/g" ../app/acf-blocks/$blockSlug/register_block.php
#sed -i '' "s/\[blockAuthor\]/$blockAuthor/g" ../app/acf-blocks/$blockSlug/register_block.php

# add values to the views/render_template.php file
#sed -i '' "s/\[blockName\]/$blockName/g" ../app/acf-blocks/$blockSlug/views/render_template.php
#sed -i '' "s/\[blockSlug\]/$blockSlug/g" ../app/acf-blocks/$blockSlug/views/render_template.php
#sed -i '' "s/\[blockUnderSlug\]/$blockUnderSlug/g" ../app/acf-blocks/$blockSlug/views/render_template.php
#sed -i '' "s/\[blockCamelSlug\]/$blockCamelSlug/g" ../app/acf-blocks/$blockSlug/views/render_template.php
#
#
## add values to the views/block_styling.php file
#sed -i '' "s/\[blockName\]/$blockName/g" ../app/acf-blocks/$blockSlug/views/block_styling.php
#sed -i '' "s/\[blockSlug\]/$blockSlug/g" ../app/acf-blocks/$blockSlug/views/block_styling.php
#sed -i '' "s/\[blockUnderSlug\]/$blockUnderSlug/g" ../app/acf-blocks/$blockSlug/views/block_styling.php
#sed -i '' "s/\[blockCamelSlug\]/$blockCamelSlug/g" ../app/acf-blocks/$blockSlug/views/block_styling.php


#Create the main ACF Blocks file if it does not exist
FILE=../app/acf-blocks/acf_blocks.php
if [ -f "$FILE" ]; then
    echo "${success}$FILE already exists.${normal}"
else
    echo "$FILE does not exist."
    cp -n file_templates/acf_block_setup_files/acf_blocks.php ../app/acf-blocks/acf_blocks.php
    echo "$FILE Has Been created"
    echo "Please add the following to your main php file to include all blocks added with this script."
    echo ""
    echo "if(file_exists('app/acf-blocks/acf_blocks.php')){"
    echo "\\t include 'app/acf-blocks/acf_blocks.php';"
    echo "}"
    echo ""

fi





#Link up the new Block
echo "if(file_exists('$blockSlug/register_block.php')){" >> ../app/acf-blocks/acf_blocks.php
echo "\\t include '$blockSlug/register_block.php';" >> ../app/acf-blocks/acf_blocks.php
echo "}" >> ../app/acf-blocks/acf_blocks.php



#TESTING Change All Vars in Directory
grep -rl '\[blockName\]' ../app/acf-blocks/$blockSlug/ | xargs sed -i '' "s/\[blockName\]/$blockName/g"
grep -rl '\[blockSlug\]' ../app/acf-blocks/$blockSlug/ | xargs sed -i '' "s/\[blockSlug\]/$blockSlug/g"
grep -rl '\[blockUnderSlug\]' ../app/acf-blocks/$blockSlug/ | xargs sed -i '' "s/\[blockUnderSlug\]/$blockUnderSlug/g"
grep -rl '\[blockCamelSlug\]' ../app/acf-blocks/$blockSlug/ | xargs sed -i '' "s/\[blockCamelSlug\]/$blockCamelSlug/g"
grep -rl '\[blockCategory\]' ../app/acf-blocks/$blockSlug/ | xargs sed -i '' "s/\[blockCategory\]/$blockCategory/g"
grep -rl '\[blockClass\]' ../app/acf-blocks/$blockSlug/ | xargs sed -i '' "s/\[blockClass\]/$blockClass/g"
grep -rl '\[blockAuthor\]' ../app/acf-blocks/$blockSlug/ | xargs sed -i '' "s/\[blockAuthor\]/$blockAuthor/g"

