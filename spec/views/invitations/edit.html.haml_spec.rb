require 'rails_helper'

RSpec.describe "invitations/edit", :type => :view do
  before(:each) do
    @invitation = assign(:invitation, Invitation.create!(
      :name => "MyString",
      :party_size => 1,
      :email => "MyString"
    ))
  end

  it "renders the edit invitation form" do
    render

    assert_select "form[action=?][method=?]", invitation_path(@invitation), "post" do

      assert_select "input#invitation_name[name=?]", "invitation[name]"

      assert_select "input#invitation_party_size[name=?]", "invitation[party_size]"

      assert_select "input#invitation_email[name=?]", "invitation[email]"
    end
  end
end
