class Card < ActiveRecord::Base
  has_many :user_cards
  has_many :users, through: :user_cards

  validates_format_of :cc, with: /\A[345]\d{11,}\Z/

  validates :xmonth, inclusion: {in: (1..12)}
  validates :xyear, inclusion: {in: (2015..2115)}

  before_save :set_card_type, :set_expiration_date

  def set_expiration_date
    self.expiration_date = DateTime.new(self.xyear,
                                        self.xmonth,
                                        28)
  end

  validates :users, presence: true

  scope :expired, lambda { where('expiration_date < ?', Time.now) }


  def set_card_type
    first_num = self.cc[0]
    self.brand = case first_num
    when '3'
      'American Express'
    when '4'
      'Visa'
    when '5'
      'MasterCard'
    end
  end
end
