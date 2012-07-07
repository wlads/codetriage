class UserMailer < ActionMailer::Base
  # default from: "from@example.com"


  def send_triage(options = {})
    @user   = options[:user]
    @repo   = options[:repo]
    @issue  = options[:issue]
    mail(:to => @user.email, :reply_to => "noreply", :subject => "Time to help Triage a Github Issue")
  end


  class Preview < MailView
    # Pull data from existing fixtures
    def send_triage
      user  = User.last
      repo  = Repo.last
      issue = Issue.open.last
      UserMailer.send_triage(:user => user, :repo => repo, :issue => issue)
    end
  end

end