# Releasing this Plugin on GitHub

### Overview

Releases are created using GitHub releases. Creating a release trigger the wo

Artifacts will be a new Branch using the relase number
A new tag usinf the release number


 We always work in the master branch.


1. Add your ACF Pro Key as a Secret to your github repository:
   
https://[your repository url]/settings/secrets/actions

    > Name: ACF_PRO_KEY
    > 
    > Value: [Your ACF Pro Key]

2. Ask lead developer to add public key the SSH_PRIVATE_KEY secret for SSH access to the Wit Plugin Server

3. Update the version number in the main plugin file along with any other chamges to required versions or tested versions.
4. Update the changelog in readme.txt be sure to use the samse version number.
5. Commit uses the version number as the message for example "v1.0.1"
6. Push to GitHub
3. On git hub Create the Release

https://[your repository url]/releases/new

> Create a Tag with the Release Version number
> 
> Release title is the same release version number
> The description is optional for minor versions


3. Check the Actions to watch the release as it is created.

https://[your repository url]/actions


You can check that the plugin has been updated to the server here:

https://plugins.witdigital.com/wp-update-server/?action=get_metadata&slug=[YOUR PLUGIN SLUG]

The latest release is always at:  https://[your repository url]/releases/latest
/releases/latest/download/wit-quick-promo.zip

