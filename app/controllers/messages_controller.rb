class MessagesController < ApplicationController
  before_action :authenticate_user!, only: %i{index create}
  before_action do 
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index 
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = Message.where(id: @messages[-10..-1].pluck(:id))
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    if @messages.last
      @messages.where.not(user_id: current_user.id).update_all(read: true)
    end

    @messages = @messages.order(created_at: :desc).page(params[:page]).per(11)
    @message = @conversation.messages.build
    @recipient_user = User.find_by(id: @conversation.recipient_id)
  end

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    else
      render 'index'
    end
  end

  private 
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
