class WpUsersController < ApplicationController

  hobo_user_controller

  #apiify 

  auto_actions :all, :except => [ :index, :new, :create ]

  # Normally, users should be created via the user lifecycle, except
  #  for the initial user created via the form on the front screen on
  #  first run.  This method creates the initial user.
  def create
    hobo_create do
      if valid?
        self.current_user = this
        flash[:notice] = t("hobo.messages.you_are_site_admin", :default=>"You are now the site administrator")
        redirect_to home_page
      end
    end
  end

  def do_accept_invitation
    do_transition_action :accept_invitation do
      if this.valid?
        self.current_user = this
        flash[:notice] = t("hobo.messages.you_signed_up", :default=>"You have signed up")
      end
    end
  end

  #
  # Users
  #

  def api_login
    @user = WpUser.authenticate(@user,params[:password])
    if @user
      sign :user=> @user
    else

    end
  end

  ### Cut out for gem

  #Make a token from a signed array of object typed id's
  def pack(objects)
    sign(objects.map {|obj| {:class => obj.class.to_s, :id => obj.id })
  end

  def signiture(obj)
    Digest::SHA1.digest(obj.to_json + ServerSecret)
  end

  def sign(obj)
    @apisession = Base64::encode64({:data=>obj,{:sig=>signiture(obj)})
  end

  def verify(hash)
    given_sig = hash[:sig]
    obj = hash[:data]
    sig = signiture(obj)
    given_sig == sig
  end

  def recover(hash)
    unpack(hash[:data]) if verify(hash)
  end

  # unpack the token to make variables of the form
  # @user = User.find(id)
  # don't do this with the token unless it's been verified first
  def unpack(object_hashes)
    object_hashes.each do |obj_hash| 
      begin
        obj_hash = eval(obj_hash[:class]).find(obj_hash[:id])
        eval "@#{obj.class.to_s.underscore} = obj_hash"
      rescue
      end
    end
  end


  #################

  def api_logout
  end

  #List all users in the current user's group
  def api_index
  end

  #Show the details of a user iff in the current group
  def api_show
  end

  #Create a user
  def api_create
  end

  #Update a user's credentials
  def api_update
  end

  #Destroy the current user
  def api_destroy
  end


end
