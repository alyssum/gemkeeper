class Users::RegistrationsController < Devise::RegistrationsController
  
  # GET /users
  def show
  end

  # POST /users
  def create
    # Associate existing player if there is one to user
    super do |resource|
      puts "Finding existing player with same email address"
      @player =  Player.find_by(email: params[resource_name][:email])
      resource.player = @player if @player
    end
  end

  # The path used after sign up. You need to overwrite this method
  # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
    puts "Redirecting to edit associated player or create a new one"
    if resource.player
      edit_player_path(resource.player)
    else
      new_player_path
    end 
  end

  # The path used after sign up for inactive accounts. You need to overwrite
  # this method in your own RegistrationsController.
  def after_inactive_sign_up_path_for(resource)
    respond_to?(:root_path) ? root_path : "/"
  end
end
