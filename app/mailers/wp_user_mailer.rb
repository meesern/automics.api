class WpUserMailer < ActionMailer::Base
  default :from => "no-reply@#{host}"

  def forgot_password(wp_user, key)
    @wp_user, @key = wp_user, key
    mail( :subject => "#{app_name} -- forgotten password",
          :to      => wp_user.email_address )
  end

  def invite(wp_user, key)
    @wp_user, @key = wp_user, key
    mail( :subject => "Invitation to #{app_name}",
          :to      => wp_user.email_address )
  end

end
