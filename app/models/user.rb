class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :group_users, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :checks, dependent: :destroy

    attachment :image

    validates :name, presence: true
end
