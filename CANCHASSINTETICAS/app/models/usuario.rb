class Usuario < ApplicationRecord
  has_many :reservas, dependent: :destroy
  has_many :comentarios, dependent: :destroy

  validates :identificacion, presence: { message: "No puede ser un campo vacio" }
  validates :identificacion, numericality: { only_integer: true, message: "no valida" }
  validates :nombre, presence: { message: "No puede ser un campo vacio" }
  validates :apellido, presence: { message: "No puede ser un campo vacio" }
  validates :email, presence: { message: "No puede ser un campo vacio" }, format: { with: /\A\S+@\S+\.com\z/, message: "Formato de email no válido" }

  default_scope { order(:id) }
  
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
