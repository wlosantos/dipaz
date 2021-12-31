# frozen_string_literal: true

class User < ActiveRecord::Base
  rolify
  belongs_to :company, inverse_of: :users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  enum status: { active: 0, inactive: 1 }

  validates :name, presence: true
  validates :phone, presence: true
end
