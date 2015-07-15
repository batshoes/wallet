class User < ActiveRecord::Base
  has_many :usercards 
  has_many :cards, through: :usercards

  validates_presence_of :fname, :lname, :email

  validates_uniqueness_of :email, :username

  validates_format_of :phone, with: /\d{3}-\d{3}-\d{4}/
  
  validates_numericality_of :balance, {greater_than_or_equal_to: 0}
  
  # validates :password, confirmation: true, presence: true
  def full_name
    fname + ' ' + lname
  end

end
