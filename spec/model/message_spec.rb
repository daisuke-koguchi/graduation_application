# require 'rails_helper'
# RSpec.describe 'メッセージ機能', type: :model do
#   before do 
#     @user = FactoryBot.create(:user)
#     @login_user = FactoryBot.create(:login_user)
#     @conversation = Conversation.create(sender_id: @user.id, recipient_id: @login_user.id)
#   end

#   describe 'メッセージ送信機能' do
#     context 'メッセージ未入力のままメッセージを送ると' do
#       it 'バリデーションに引っかかる' do
#         message = Message.new(
#           body: nil, 
#           conversation_id: @conversation.id, 
#           user_id: @user.id,
#         )
#         expect(message).not_to be_valid
#       end
#     end
#     context 'メッセージが入力された場合' do 
#       it 'バリデーションにかからない' do 
#           message = Message.new(
#             body: 'バリデーション通過', 
#             conversation_id: @conversation.id,
#             user_id: @user.id 
#           )
#           expect(message).to be_valid 
#       end
#     end
#   end
# end