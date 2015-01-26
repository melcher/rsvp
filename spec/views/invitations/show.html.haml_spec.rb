require 'rails_helper'

RSpec.describe "invitations/show", :type => :view do
  before(:each) do
    @invitation = assign(:invitation, Invitation.create!(
      :name => "Name",
      :party_size => 1,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Email/)
  end
end
