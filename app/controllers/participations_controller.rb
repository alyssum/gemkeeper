class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]
  before_action :set_session_from_url, only: [:index, :create, :new]
  before_action :set_session_from_object, only: [:destroy, :edit, :update]
  before_action :get_options, only: [:new, :edit, :create]

  # GET /participations/new
  def new
    @game_roles = @game_roles 
    @all_players = @all_players - @session.players

    @participation = Participation.new
    @participation.session_id = @session.id
    @participation.role_id = @game_roles.first.id if @game_roles.length == 1
    @participation.player_id = @all_players.first.id if @all_players.length == 1

    @path = [@session, @participation]
    @url = game_session_participations_path(@session)
  end

  # GET /participations/1/edit
  def edit
    @path = @participation
    @url = participation_path(@participation)
  end

  # POST /participations
  # POST /participations.json
  def create
    @participation = Participation.new(participation_params)
    @path = [@session, @participation]

    respond_to do |format|
      if @participation.save
        format.html { redirect_to game_session_path(@session), notice: 'Participation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @participation }
      else
        format.html { render action: 'new' }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participations/1
  # PATCH/PUT /participations/1.json
  def update
    respond_to do |format|
      if @participation.update(participation_params)
        format.html { redirect_to game_session_path(@session), notice: 'Participation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participations/1
  # DELETE /participations/1.json
  def destroy
    @participation.destroy
    respond_to do |format|
      format.html { redirect_to game_session_path(@session) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      @participation = Participation.find(params[:id])
    end

    def set_session_from_url
      @session = Session.find(params[:game_session_id])
    end

    def set_session_from_object
      @session = Session.find(@participation.session_id)
    end

    def get_options
      @game_roles = @session.game.roles.sort_by{ |r| r.name }
      @all_games = Game.order(:name)
      @all_players = Player.order(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participation_params
      params.require(:participation).permit(:session_id, :player_id, :role_id, :score)
    end
end
