require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validates" do
    describe "email" do
      it "should be unique" do
        persisted_u = FactoryBot.create(:user)
        u = FactoryBot.build(:user, email: persisted_u.email)
        u.valid?
        expect(u.errors.messages).to(have_key(:email))
      end
    end
  end
end
