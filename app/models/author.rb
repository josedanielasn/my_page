class Author < ApplicationRecord
  has_many :quotes,  dependent: :destroy
  validates :author_name, presence: true, uniqueness: true
end
