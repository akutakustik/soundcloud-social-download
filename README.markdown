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

### 4. Register a new Facebook application

1. [Go here](http://www.facebook.com/developers/createapp.php), name your app, agree to terms, and click `Create Application`
2. Click **Connect** in the left column and add your *Connect URL* (url where your app will live), then click `Save Changes`
3. Copy the **Application ID** and **Application Secret** to a text file for later

### 5. Register a new Twitter application

1. [Go here](http://twitter.com/apps/new)
2. *Name* your application and give it a *Description*
3. Input your *Application Website* (url where your app will live)
4. Add your artist name as *Organization* and your artist website url as *Website*
5. Make with Browser is ticked on *Application Type*
6. Input your *Callback URL* (url where your app will live)
7. Select Read & Write for *Default Access type*
8. Click `Save`
9. Finally, copy the **Consumer Key** and **Consumer Secret** to a text file for later