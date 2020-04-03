require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'creating an article' do
    it 'validates the title is present' do
      expect { Article.create!(title: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
