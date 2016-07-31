class TextsController < ApplicationController
  def index
    @texts = Text.all
  end

  def new
    @text = Text.new
  end

  def create
      @text = Text.new(text_params)
      if @text.save
account_sid = "ACbe95e0c8b33619f598ca30a821589482"
auth_token = "7b6e9c649fee4d05570ea197ee3fc06e"
client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create(
    :from => +17819545246,
    :to => text_params[:number],
    :body => text_params[:message]
  )
        flash[:notice] = "Text Success! You have definitely earned a nap!"
        redirect_to texts_path
      else
        flash[:error] = "Text Failed! You MUST enter a VALID phone number AND a message. Please try again!!!"
        render 'new'
      end
  end

  private

  def text_params
    params.require(:text).permit(:number,:message)
  end
end
