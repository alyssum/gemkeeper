class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  before_action :set_game_from_url, only: [:index, :create, :new]
  before_action :set_game_from_object, only: [:destroy, :edit, :update]

  # GET /roles/new
  def new
    @role = Role.new
    @role.game_id = @game.id 
    @path = [@game, @role]
  end

  # GET /roles/1/edit
  def edit
    @path = @role
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)
    @path = [@game, @role]

    respond_to do |format|
      if @role.save
        format.html { redirect_to game_url(@game), notice: 'Role was successfully created.' }
        format.json { render action: 'show', status: :created, location: @role }
      else
        format.html { render action: 'new' }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @game, notice: 'Role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to game_url(@game) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    def set_game_from_url
      @game = Game.find(params[:game_id])
    end

    def set_game_from_object
      @game = Game.find(@role.game_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:name, :game_id)
    end
end
