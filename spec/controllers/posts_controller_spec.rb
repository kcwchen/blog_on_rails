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
    context "with valid parameters" do
      it "should add a record to the posts table" do
        before_count = Post.all.count
        post(:create, params: { post: FactoryBot.attributes_for(:post) })
        after_count = Post.all.count
        expect(after_count).to(eq(before_count + 1))
      end
      it "should redirect to the show page for the created post" do
        post(:create, params: { post: FactoryBot.attributes_for(:post) })
        p = Post.last
        expect(response).to(redirect_to(p))
      end
    end
    context "with invalid parameters" do
      it "should not add a record to the posts table" do
        before_count = Post.all.count
        post(:create, params: { post: { title: nil, body: "abc" } })
        after_count = Post.all.count
        expect(after_count).to(eq(before_count))
      end
      it "should render the new template" do
        post(:create, params: { post: { title: nil, body: "abc" } })
        expect(response).to(render_template(:new))
      end
    end
  end
  describe "show" do
    it "should render the show template" do
      p = FactoryBot.create(:post)
      get(:show, params: { id: p.id })
      expect(response).to(render_template(:show))
    end
  end
end
