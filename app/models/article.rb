class Article < ApplicationRecord
  include Filterable

  validates :title, presence: true
end
