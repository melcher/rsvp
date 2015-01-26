require 'rails_helper'

RSpec.describe "invitations/index", :type => :view do
  before(:each) do
    assign(:invitations, [
      Invitation.create!(
        :name => "Name",
        :party_size => 1,
        :email => "Email"
      ),
      Invitation.create!(
        :name => "Name",
        :party_size => 1,
        :email => "Email"
      )
    ])
  end

  it "renders a list of invitations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
