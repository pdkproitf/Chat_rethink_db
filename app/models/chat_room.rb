class ChatRoom
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps

  field :title, :type => String
  belongs_to :user
  has_many :messages
end
