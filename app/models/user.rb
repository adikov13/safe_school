class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  has_one :student
  has_one :teacher
  has_one :parent
  
  def full_name
    first_name.capitalize + ' ' + last_name.capitalize
  end

 #  validates :first_name, presence: true
	# validates :last_name, presence: true
	# validates :phone_number, presence: true
end
