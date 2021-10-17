require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validates" do
    it "should have a title" do
      p = FactoryBot.build(:post, title: nil)
      p.valid?
      expect(p.errors.messages).to(have_key(:title))
    end
  end
end
