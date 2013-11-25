class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]
  before_action :get_options, only: [:new, :edit, :create]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.order("date desc")
    @session_dates = @sessions.group_by {|s| s.date.to_date }
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    if @session.is_stalemate
      flash.now.notice = "This game was a stalemate."
    end
  end

  # GET /sessions/new
  def new
    @session = Session.new
    @session.date = DateTime.now
    @path = [@session, @role]
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)
    @session.created_by = current_user.id

    respond_to do |format|
      if @session.save
        format.html { redirect_to game_session_path(@session), notice: 'Session was successfully created.' }
        format.json { render action: 'show', status: :created, location: @session }
      else
        format.html { render action: 'new' }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to game_session_path(@session), notice: 'Session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    if @session.created_by == current_user.id
      @session.destroy
    else
      flash[:notice] = "Cannot delete session as you did not create it."
    end
    respond_to do |format|
      format.html { redirect_to game_sessions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    def get_options
      @all_games = Game.order(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:game_id, :date, :is_stalemate, :comments, participations_attributes: [:player_id, :role_id, :id])
    end
end
