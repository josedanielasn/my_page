class Quote < ApplicationRecord
belongs_to :author
has_many :quote_tags , dependent: :destroy
has_many :tags, through: :quote_tags , dependent: :destroy
validates :quote, presence: true, uniqueness:true, length: {minimum:10, maximum:200}
validates :author_id, presence: true
end

