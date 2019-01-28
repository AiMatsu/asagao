class Member < ApplicationRecord

  has_secure_password
  # カラムにpassword_digestの属性が定義されている場合にのみ使える
  # これによって、Memberクラスにpasswordおよびpassword_confirmationの２つの属性が定義される
  # authenticateメソッドも追加される
  # バリデーションもデフォで設定される
  has_many :entries, dependent: :destroy

  validates :number, presence: true,
    numericality: {
      only_integer: true,
      greater_than: 0,
      less_than: 100,
      allow_blank: true,
    },
    uniqueness: true

  validates :name, presence: true,
    format: { with: /\A[A-Za-z][A-Za-z0-9]*\z/, allow_blank: true, message: :invalid_member_name},
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: {case_sensitive:false}

  validates :full_name, presence: true, length: {maximum: 20}
  validates :email, email: {allow_blank: true}

  # 現在のぱsワードに関するバリデーション
  attr_accessor :current_password
  validates :password, presence: {if: :current_password}

  class << self
    def search(query)
      rel = order("number")
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?","%#{query}%","%#{query}%")
      end
      rel
    end
  end
end
