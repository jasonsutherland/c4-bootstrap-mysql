#c4-bootstrap-mysql

A simple way to deploy a mysql environment to replicate a channel4.com microsite, for testing your deploys.

##HOWTO c4-bootstrap

1. Start your Ubuntu 10.04 LTS Server.

2. Install git so you can clone the repository:

```bash
sudo apt-get update
sudo apt-get install git-core
```

3. Clone the c4-bootstrap-mysql repo onto your server:

```bash
git clone https://github.com/channel4/c4-bootstrap-mysql.git
```

4. Now run the bootstrap script to set up the environment:

```bash
cd c4-bootstrap-mysql
sudo ./bootstrap.sh
```

5. Now you can make changes to the system by following the working directories and scripting guides.

##HOWTO c4-repack

When your ready to commit your code to the channel4 git repo so you can either submit code to ISHosting or rebuild your server on another machine, first contact your project manager to start a conversation about getting a private github repo from us. This requires you having a github account and have your public SSH keys loaded. We'll then create a private repo for you and send you the details.

Once you've made changes to the system and created new scripts withing the bootstrap environment simply run the repack script. This will pull in files from your system into **~/c4-bootstrap-mysql/files/....** and package up any special directories like **/etc/mysql/**.

```bash
sudo ./repack.sh
```

Now upload your code to the new repo:

```bash
cd ~/c4-bootstrap.sh
git push --mirror git@github.com:channel4/MYREPO.git
```

**NOTE:** If you are making future changes to the same website on a new server make sure you bootstrap from your new repo thus avoiding having to set everything up again:

```bash
git clone https://github.com/channel4/MYREPO.git
```

##Working Directories

c4-bootstrap-mysql is set up to monitor changes you make to the following folders and helps you package up the system for delivery to channel4. If you're going to make any changes outside these directories please get in touch with the project manager and ask to set up a technical conference call.

###/etc/mysql/

This contains the default mysql settings any mysql customisations should go in here. 

