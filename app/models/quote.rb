class Quote < ApplicationRecord
belongs_to :author
validates :quote, presence: true, uniqueness:true, length: {minimum:10, maximum:200}
validates :author_id, presence: true
end
