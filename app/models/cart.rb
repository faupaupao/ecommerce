class Cart < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_one    :store
  has_many   :cart_details

  enum status: %w[draft submitted]

end
