require 'rails_helper'

RSpec.describe "responses/show", :type => :view do
  before(:each) do
    @response = assign(:response, Response.create!(
      :party_size => 1,
      :comment => "MyText",
      :food_restrictions => "MyText",
      :responded_with => "Responded With",
      :invitations => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Responded With/)
    expect(rendered).to match(//)
  end
end
