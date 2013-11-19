module ApplicationHelper
  def current_player_id
    current_user.player.id.to_s
  end

  def is_sessions_section?
    (controller.controller_name == 'sessions' || controller.controller_name == 'participations')
  end

  def is_games_section?
    (controller.controller_name == 'games' || controller.controller_name == 'roles')
  end

  def is_friends_section?
    (controller.controller_name == 'players' && (action_name == :index || params[:id] != current_player_id ) )
  end

  def is_profile_section?
    (controller.controller_name == 'players' && params[:id] == current_player_id)
  end

  def is_top_level?
    (action_name == 'index' || is_profile_section?)
  end

  def is_refreshable?
    (action_name == 'index')
  end

  def is_editable?
    (action_name == 'show' && controller.controller_name != 'players')
  end

  def is_addable?
    (action_name == 'index')
  end

  def is_deletable?
    (action_name == 'edit')
  end

  def is_cancelable?
    (action_name == 'new')
  end

  def title(page_title)
    content_for(:title, page_title.to_s)
  end
end
