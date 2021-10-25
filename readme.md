# WordPress Project Wizards

Interactive shell scripts for setting up common WordPress projects. 

_These scripts use project structure, functions, libraries and packages that are used by my development team. Documentation is lacking as this is mostly for our own use. 
Feel free to use as is or tweak for your own needs. Suggestions and collaboration are welcome._

> Currently working wizards:
> * Create Plugin
> * Create ACF Block

## Usage
In your terminal cd into ./project_wizards and run the appropriate script.

## Wizards

### Create Plugin
Creates a WordPress plugin within a directory to be moved into a WordPress installation for development.

```sh create_plugin.sh```

Creates a complete WordPress plugin within a directory. Move this into a WordPress installation for development.


### Create ACF Block
Create an ACF block directory inside an app/ directory. 

Move to your project and include the index.php file in your plugin or theme. 

Basic Instructions are provided as the script runs.

```sh create_acf_block.sh```



# Projects Used:

[ACF Composer Bridge](https://github.com/pivvenit/acf-composer-bridge) - Allows composer to install ACF pro. 


Fr Deployment you must add Keys to Repo

ACF_PRO_KEY
SSH_PRIVATE_KEY in my case pbcopy <  .ssh/id_rsa_ryanmitchell2021
