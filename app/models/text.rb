class Text < ActiveRecord::Base

  validates :number, presence: true, length: { in: 10..20, message: "wrong number." }
  validates :message, presence: true

end
