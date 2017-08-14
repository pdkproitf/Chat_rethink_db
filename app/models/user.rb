class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  # has_many :messages
  def messages
    Message.where(user_id: id).to_a
  end

  # has_many :chat_rooms
  def chat_rooms
    ChatRoom.where(user_id: id).to_a
  end
end
