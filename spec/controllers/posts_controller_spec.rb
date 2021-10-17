require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "new" do
    it "should render the new template" do
      get(:new)
      expect(response).to(render_template(:new))
    end
  end
end
