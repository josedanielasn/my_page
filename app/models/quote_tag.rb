class QuoteTag < ApplicationRecord
  belongs_to :quote
  belongs_to :tag
  # validates :quote_id, presence: true
  # validates :tag_id, presence: true
end
