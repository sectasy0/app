class Order < ApplicationRecord
  belongs_to :client

  enum status: { new_order: 0, sended: 1 }
  
  has_and_belongs_to_many :products, dependent: :destroy

  accepts_nested_attributes_for :products,
                            :reject_if => lambda { |attributes| attributes.blank? },
                            :allow_destroy => true

  validates :products, length: { minimum: 1 }

  def total_price
    products.sum(:price)
  end

  def product_count
    products.count
  end
end
