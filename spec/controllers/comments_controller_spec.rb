require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "#create" do
    it "should add a comment record in db" do
      before_count = Comment.count
      p = FactoryBot.create(:post)
      c = FactoryBot.create(:comment, post: p)
      after_count = Comment.count
      expect(after_count).to(eq(before_count + 1))
    end
  end
end
