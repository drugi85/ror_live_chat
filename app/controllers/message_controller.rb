class MessageController < ApplicationController

  def add_message
    message=Message.new(
      :user_id =>params[:user_id],
      :content=>params[:message]
    )
    if message.valid?
      message.save
      render :json => message.to_json
    else
      render :json => {:errors => message.errors.full_messages.join("\n")}, :status => 403
    end



  end
end
