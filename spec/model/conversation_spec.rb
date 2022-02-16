require 'rails_helper'
RSpec.describe '会話機能', type: :model do
  before do
    @user = FactoryBot.create(:user)
    @login_user = FactoryBot.create(:login_user)
  end
  describe '会話機能のバリデーションテスト' do 
    context 'senderとrecipientの組み合わせが初めての場合' do
      it 'バリデーションが無くConversationが作成される' do 
      conversation = Conversation.new(
        sender_id: @user.id,
        recipient_id: @login_user.id)
      expect(conversation).to be_valid
      end
    end
    context 'senderとrexipientの組み合わせが初めて出ない場合' do 
      it 'バリデーションが発生する' do 
        conversation = Conversation.create(
        sender_id: @user.id,
        recipient_id: @login_user.id)

        conversation2 = Conversation.new(
        sender_id: conversation.sender_id,
        recipient_id: conversation.recipient_id)
        expect(conversation2.valid?).to eq false;
      end
    end
  end
end