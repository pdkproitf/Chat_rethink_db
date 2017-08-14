class Message
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :body, :type => Text
  field :user_id, :type => Integer
  belongs_to :chat_room

  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  after_save { MessageBroadcastJob.perform_later self.to_json }

  def user
    User.find(user_id)
  end
end
