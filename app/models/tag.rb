class Tag < ApplicationRecord
has_many :quotes
validates :tag_name, presence: true, uniqueness: true, length: {minimum:2}
end
