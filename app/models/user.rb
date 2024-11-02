class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_FULL_WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥々ー]+\z/
  VALID_FULL_WIDTH_KATAKANA_REGEX = /\A[ァ-ンヽヾ゛゜ー]+\z/

  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers.' }
  validates :lastname, presence: true
  validates :lastname, format: { with: VALID_FULL_WIDTH_REGEX, message: 'is invalid. Input full-width characters.' }
  validates :firstname, presence: true
  validates :firstname, format: { with: VALID_FULL_WIDTH_REGEX, message: 'is invalid. Input full-width characters.' }
  validates :katakana_lastname, presence: true
  validates :katakana_lastname, format: { with: VALID_FULL_WIDTH_KATAKANA_REGEX, message: 'is invalid. Input full-width katakana characters.' }
  validates :katakana_firstname, presence: true
  validates :katakana_firstname, format: { with: VALID_FULL_WIDTH_KATAKANA_REGEX, message: 'is invalid. Input full-width katakana characters.' }  

end
