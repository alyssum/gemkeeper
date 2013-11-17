class PlayerMailer < ActionMailer::Base
  default from: Devise.mailer_sender
 
  def invite_instructions(player)
    @player = player
    @url  = new_user_registration_url 
    mail(to: @player.email, 
        subject: 'Invite to Gêmkeeper',
        template_path: 'players/mailer')
  end
end
