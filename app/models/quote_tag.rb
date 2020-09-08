class QuoteTag < ApplicationRecord
  belongs_to :quotes
  belongs_to :tags
  validates :quote_id, presence: true
  validates :tag_id, presence: true

end
