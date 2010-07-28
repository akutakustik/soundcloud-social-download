class PostsController < ApplicationController
  
  def new
    
    #sc_consumer = Soundcloud.consumer('J8aFr3h5xyOSkYxsJMYXQ','cCysasMDFSo8ErnCaAJQzpl8LUrkoziAVSTvzOhJWc')
    #access_token = OAuth::AccessToken.new(sc_consumer, Settings.token, Settings.secret)
    #sc_client = Soundcloud.register({:access_token => access_token})
    
    #user = sc_client.User.find_me
    
    #downloaded_file = open sc_client.Track.find(4254552).download_url
    
    #logger.info user.tracks.inspect
    
    #4254552
    
    #puts sc_client.Track.find(:first).inspect

  end

  def create
    
    @post = params[:post]
    
    if @post["service"] == "facebook"
      
      Facebook.new(session[:user][:token]).class.post('/me/feed', :query => {:message => @post["text"], :link => root_url})
      
    elsif @post["service"] == "twitter"
      
      oauth("twitter", session[:user][:token], session[:user][:secret]).post('/statuses/update.json', {:status => @post["text"]})
      
    end
    
    session[:download] = true
    
    redirect_to root_path
    
  end
  
  def download
    
    if session[:download]
      #puts oauth("soundcloud", Settings.token, Settings.secret).get("/resolve?url=http://soundcloud.com/scars-on-broadway/fucking")
      #puts oauth("soundcloud", Settings.token, Settings.secret).get("http://soundcloud.com/track/4254552").inspect
      location = oauth("soundcloud", Settings.token, Settings.secret).get("#{SETTINGS["track"]}/download")["location"]
      redirect_to location
    else
      redirect_to root_path
    end
    
  end

end