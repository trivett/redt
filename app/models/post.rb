class Post < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates_numericality_of :user_id, only_integer: true

  validates :link_url, presence: true, uniqueness: true




end
