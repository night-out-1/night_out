class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_and_belongs_to_many :events
  has_many :comments

	has_attached_file :avatar, styles: { medium: "300x300>", small: "100x100>" }, default_url: "/avatars/:style/missing.png"
	
	validates_attachment_content_type :avatar,
        :content_type => /\Aimage\/.*\Z/
end
