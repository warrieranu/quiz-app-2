class User < ApplicationRecord
    before_save { self.email = email.downcasee }
    before_save :downcase_email
    validates :name,  presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
    enum clearance_level: [:free_user, :silver_user, :gold_user, :admin]
   
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    
    def self.sign_in_from_omniauth(auth)
        find_by(provider: auth['provider'], uid: auth['uid'] || create_user_from_omniauth)
    end
    
    def create_user_from_omniauth(auth)
        create(
            provider: auth['provider'],
            uid: auth['uid'],
            name: auth['info']['name'],
            email: auth['info']['email'],
            password: SecureRandom.hex
            
            )
    end
    
end
