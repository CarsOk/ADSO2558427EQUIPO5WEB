class Usuario < ApplicationRecord
  has_many :reservas
  has_and_belongs_to_many :canchas
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :check_admin

    def check_admin
      if email == 'admin@gmail.com' && password == '123456'
        self.admin = true
      else
        self.admin = false
      end
        save
    end
end
