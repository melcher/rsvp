require 'rails_helper'

RSpec.describe "responses/index", :type => :view do
  before(:each) do
    assign(:responses, [
      Response.create!(
        :party_size => 1,
        :comment => "MyText",
        :food_restrictions => "MyText",
        :responded_with => "Responded With",
        :invitation => nil
      ),
      Response.create!(
        :party_size => 1,
        :comment => "MyText",
        :food_restrictions => "MyText",
        :responded_with => "Responded With",
        :invitation => nil
      )
    ])
  end

  it "renders a list of responses" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Responded With".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
