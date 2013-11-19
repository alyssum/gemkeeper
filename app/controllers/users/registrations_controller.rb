class Users::RegistrationsController < Devise::RegistrationsController
  
  # POST /users
  def create
    # Associate existing player if there is one to user
    super do |resource|
      puts "Finding existing player with same email address"
      @player =  Player.find_by(email: params[resource_name][:email])
      resource.player = @player if @player
    end
  end

  # PUT /users
  def update
    super do |resource|
      resource.player.name = params[:player][:name]
      resource.player.email = params[resource_name][:email]
      resource.player.save
    end
  end

  # The path used after editing user.
  def after_update_path_for(resource)
    player_path(resource.player)
  end

  # The path used after sign up. 
  def after_sign_up_path_for(resource)
    puts "Redirecting to edit associated player or create a new one"
    if resource.player
      edit_player_path(resource.player)
    else
      new_player_path
    end 
  end

  # The path used after sign up for inactive accounts. 
  def after_inactive_sign_up_path_for(resource)
    respond_to?(:root_path) ? root_path : "/"
  end

  private

    def sign_up_params
      allow = [:email, :password, :password_confirmation, players_attributes: [:name] ]
      params.require(resource_name).permit(allow)
    end
end
