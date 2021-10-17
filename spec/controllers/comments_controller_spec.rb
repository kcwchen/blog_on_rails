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
  # Need to fix
  describe "#destroy" do
    it "should remove comment record in db" do
      p = FactoryBot.create(:post)
      comment = FactoryBot.create(:comment, post_id: p.id)
      byebug
      delete(:destroy, params: {post_id: p.id, comment: FactoryBot.attributes_for(:comment, post_id: p )})
      expect(Comment.find_by(id: c.id)).to(be(nil))
    end
  end
end
