class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, Length: { minimum: 5 }
end
