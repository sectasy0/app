class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :orders, dependent: :destroy

  def last_order
    Order.where(client_id: id).last
  end

  def display_name
    email
  end
end
