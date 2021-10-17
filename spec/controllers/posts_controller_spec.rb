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
end
