class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

  validates :nickname, :password, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true
  
  validates :password, length: { minimum: 6 }

  validates :password,format: { with: /\A[a-zA-Z0-9]+\z/ }


  with_options presence: true, format: { with:/\A[ァ-ヶー－]+\z/, message: '全角カタカナで入力してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
