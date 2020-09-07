class Tag < ApplicationRecord
validates :tag_name, presence: true, uniqueness: true, length: {minimum:2}
end
