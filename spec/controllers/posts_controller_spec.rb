require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "new" do
    it "should render the new template" do
      get(:new)
      expect(response).to(render_template(:new))
    end
    it "should assign an instance variable for a new post" do
      get(:new)
      expect(assigns(:post)).to(be_a_new(Post))
    end
  end
  describe "create" do
    it "should add a record to the posts table" do
      before_count = Post.all.count
      post(:create, params: { post: FactoryBot.attributes_for(:post) })
      after_count = Post.all.count
      expect(after_count).to(eq(before_count + 1))
    end
  end
end
