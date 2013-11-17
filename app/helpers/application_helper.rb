module ApplicationHelper
  def is_sessions_section?
    (controller.controller_name == 'sessions' || controller.controller_name == 'participations')
  end

  def is_games_section?
    (controller.controller_name == 'games' || controller.controller_name == 'roles')
  end

  def is_friends_section?
    (controller.controller_name == 'players')
  end

  def is_users_section?
    (controller.controller_name == 'registrations')
  end
end
