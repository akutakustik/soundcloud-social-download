# SoundCloud-Social-Download

This app allows you to distribute a free SoundCloud track download in exchange for a social interaction, such as Sharing on Facebook and Tweeting on Twitter. Effectively creating a "Tweet/Share for Download" campaign. The default application has many customization options, but feel free to adjust and fork as needed. You can see an example of the default app running [here](http://soundcloud-social-download.heroku.com/).

# Prerequisites

### 1. Install Ruby, RubyGems, & Rails

Mac OS X: Ruby and Rails comes pre-installed on Mac OS X, but you'll want to upgrade it by [following these instructions](http://developer.apple.com/Tools/developonrailsleopard.html).

Windows: [Follow these instructions](http://wiki.rubyonrails.org/getting-started/installation/windows) to install Ruby and Rails on Windows.

### 2. Install Git & Generate SSH Key

[Git](http://git-scm.com/) is a free & open source, distributed version control system designed to handle everything from small to very large projects with speed and efficiency.

1. Install Git: [On a Mac](http://github.com/guides/get-git-on-mac), [Windows](http://code.google.com/p/msysgit/), or [UNIX/Linux](http://book.git-scm.com/2_installing_git.html) 
2. [Sign up for Github](https://github.com/signup/free)
3. [Follow these instructions](http://help.github.com/mac-key-setup/) to generate an SSH key & add the key to your Github account.
4. Set user name and email globally on git by [following these instructions](http://help.github.com/git-email-settings/)

### 3. Register a new SoundCloud application

1. Make sure you're [signed up](http://soundcloud.com/signup) for SoundCloud and logged in.
2. [Go here](http://soundcloud.com/you/apps/new), name your app, and click `Register`
3. Copy the **Consumer Key** and **Consumer Secret** to a text file for later

# Register Social Apps

You'll need to create applications for each of the social services you wish to use on your promotion and copy the given **keys** and **secrets** for later. Current services are: Twitter, Facebook, and Digg

### 1. Register a new Twitter application

1. [Go here](http://twitter.com/apps/new)
2. *Name* your application and give it a *Description*
3. Input your *Application Website* (url where your app will live)
4. Add your artist name as *Organization* and your artist website url as *Website*
5. Make sure Browser is selected on *Application Type*
6. Input your *Callback URL* (url where your app will live)
7. Select Read & Write for *Default Access type*
8. Click `Save`
9. Finally, copy the **Consumer Key** and **Consumer Secret** to a text file for later

### 2. Register a new Facebook application

1. [Go here](http://www.facebook.com/developers/createapp.php), name your app, agree to terms, and click `Create Application`
2. Click **Connect** in the left column and add your *Connect URL* (url where your app will live), then click `Save Changes`
3. Copy the **Application ID** and **Application Secret** to a text file for later

### 3. Register a new Digg application

Coming soon...

# Download

Clone the application on your local computer by running the following command in your Terminal emulator. (Terminal on Mac, Console on Windows)

     git clone git@github.com:soundcloud/soundcloud-social-download.git project_name

Now you're ready to do some configuring.

# Configuration

Configuring the application is simply done by editing the following files `auth.yml` `settings.yml` in the **config** folder.

If you're looking for a decent text editor, try [TextMate](http://macromates.com/)

### 1. Update Authentication File

1. Input the following into `config/auth.yml`
2. SoundCloud app **Consumer Key** and **Consumer Secret** into production > soundcloud > prokey & prosecret
3. Twitter app **Consumer Key** and **Consumer Secret** into production > twitter > prokey & prosecret
4. Facebook app **Application ID** and **Application Secret** into production > facebook > proappid & prosecret
5. Digg app **Consumer Key** and **Consumer Secret** into production > digg > prokey & prosecret

### 2. Update Settings File

1. Input the following into `config/settings.yml`
2. Your promotion **title**, **description**, and **track** url
3. Customize the player **params** as needed (You can view a full list of parameters [here](http://wiki.github.com/soundcloud/Widget-JS-API/widget-options))
4. You can also set your player **type**, **height**, and **width**
5. Next input the promotion **header** and **instructions**
6. Adjust the comma separated list of services to reflect which 3rd party sites you'll be using.
7. Adjust the default social language such as **button**, **header**, and **status** for each service being used.  

# Customize CSS & Images

### Replace default images

Replace the following images within the **public/images** folder with something that relates to your competition.

* `bg.jpg`: background image
* `logo.png`: logo that appears in the top center of your app. Replace with another _transparent png_ of your choosing.
* `artwork.jpg`: a square _425 x 425_ pixel image used for sharing. This should be the image associated with your track (album cover, single cover, etc).

### Adjust default CSS

You can further customize the aesthetics of your application by adjusting `application.css` found within **public/stylesheets**. Here's a few ideas:

* Change the _color_ and _font_ of text in the `body` selector
* Change the _color_ of links and their hover effect in the `a` selector
* Change the _color_ of headlines in the `h1, h2` selector
* Change the _background_ gradient and _color_ of the button in the `button` selector

# Deployment

### Deploying on Heroku

1. [Create a Heroku Account](http://heroku.com/signup)
2. [Install the Heroku Gem](http://docs.heroku.com/heroku-command)
3. And finally, [deploy it to Heroku](http://docs.heroku.com/quickstart#getting-your-app-on-heroku)

### Connect the App to Your SoundCloud Account

You must connect the app to the SoundCloud account which owns the track you are offering for download.

To do this, visit **yourapp.com/activate** and login with the appropriate SoundCloud account.

# Tips and Tricks

Coming Soon ;-)

# Copyright

**SoundCloud-Social-Download** is Copyright (c) 2010 [Lee Martin](http://Lee.Ma/rtin) and [SoundCloud](http://soundcloud.com), released under the MIT License.