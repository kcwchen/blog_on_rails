require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validates" do
    describe "title" do
      it "should have a title" do
        p = FactoryBot.build(:post, title: nil)
        p.valid?
        expect(p.errors.messages).to(have_key(:title))
      end
      it "should be unique" do
        persisted_p = FactoryBot.create(:post)
        p = FactoryBot.build(:post, title: persisted_p.title)
        p.valid?
        expect(p.errors.messages).to(have_key(:title))
      end
    end
    describe "body" do
      it "should have at least 50 characters" do
        p = FactoryBot.build(:post, body: "a")
        p.valid?
        expect(p.errors.messages).to(have_key(:body))
      end
    end
  end
end
