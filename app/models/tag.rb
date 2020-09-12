class Tag < ApplicationRecord
has_many :quote_tags
has_many :quotes, through: :quote_tags
validates :tag_name, presence: true, uniqueness: true, length: {minimum:2}
end
 
