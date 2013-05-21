class PostMailer < ActionMailer::Base
  default from: "cdbaumg@gmail.com"
  
  def post_subscribe(user, post)
    @user = user
    @post = post
    mail( to: user.email, :subject => "A New Blog Post Has Been Made")
  end
end
