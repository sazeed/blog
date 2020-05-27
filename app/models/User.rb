class User < ApplicationRecord
    before_save { self.email = email.downcase}
    has_many :articles, dependent: :destroy
    validates :username, uniqueness: { case_sensitive: false }, presence: true, 
                    length: {minimum:3, maximum:25 }
    VALID_EMAIL_CHECK = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, 
                     length: {maximum:105 },
                     format: {with: VALID_EMAIL_CHECK}
    has_secure_password
end