class Portfolio < ApplicationRecord
  include Placeholder
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: lambda {|attrs| attrs['name'].blank?}
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle:"Angular")
  end

  scope :ruby_on_rails_portfolio_items, -> {where(subtitle:"Ruby")}

  after_initialize :set_default

  def set_default
    self.main_image ||= Placeholder.image_generator(height:'400', width:'600')
    self.thumb_image ||= Placeholder.image_generator(height:'200', width:'350')
  end

end