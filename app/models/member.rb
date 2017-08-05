class Member < ActiveRecord::Base
  # number:空を禁止、1以上100未満の整数、重複禁止
  validates :number, presence: true,
    numericality: { only_integer: true,
      greater_than: 0, less_than: 100, allow_blank: true },
      uniqueness: true

  # name:空を禁止、半角英数字のみ、文字列の先頭はアルファベット、2文字以上20文字以下重複禁止
  validates :name, presence: true,
    format: { with: /\A[A-Za-z]\w*\Z/, allow_blank: true,
              message: :invalid_member_name },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false } # case_sensitive = 大文字と小文字の区別:false

  # full_name:20文字以下、空あり
  validates :full_name, length: { maximum: 20 }

  # email:アドレスが空でなければ書式をチェックし、正しくなければエラーを加える
  # validate :check_email

  # private
  # def check_email
  #   if email.present?
  #     errors.add(:email, :invalid) unless well_formed_as_email_address(email)
  #   end
  # end


attr_accessor :password, :password_confirmation

# paramsが存在するなら検索、存在しないなら全て表示
  class << self
    def search (query)
      rel = order("number")
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?", "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
