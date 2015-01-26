require 'rails_helper'

RSpec.describe "invitations/new", :type => :view do
  before(:each) do
    assign(:invitation, Invitation.new(
      :name => "MyString",
      :party_size => 1,
      :email => "MyString"
    ))
  end

  it "renders new invitation form" do
    render

    assert_select "form[action=?][method=?]", invitations_path, "post" do

      assert_select "input#invitation_name[name=?]", "invitation[name]"

      assert_select "input#invitation_party_size[name=?]", "invitation[party_size]"

      assert_select "input#invitation_email[name=?]", "invitation[email]"
    end
  end
end
