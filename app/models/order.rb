class Order < ApplicationRecord
  acts_as_paranoid

  has_many  :order_details

  enum status: %w[unpaid paid shipped completed cancel]

  def self.generate_number
    initial = 'CA'
    number = format(initial + '%s%s', Date.today.strftime('%y%m%d'), SecureRandom.hex.slice(0, 4).upcase)
    number.upcase!

    find_by(number: number) ? generate_number : number
  end
end
