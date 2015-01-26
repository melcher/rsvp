require 'rails_helper'

RSpec.describe "responses/edit", :type => :view do
  before(:each) do
    @response = assign(:response, Response.create!(
      :party_size => 1,
      :comment => "MyText",
      :food_restrictions => "MyText",
      :responded_with => "MyString",
      :invitations => nil
    ))
  end

  it "renders the edit response form" do
    render

    assert_select "form[action=?][method=?]", response_path(@response), "post" do

      assert_select "input#response_party_size[name=?]", "response[party_size]"

      assert_select "textarea#response_comment[name=?]", "response[comment]"

      assert_select "textarea#response_food_restrictions[name=?]", "response[food_restrictions]"

      assert_select "input#response_responded_with[name=?]", "response[responded_with]"

      assert_select "input#response_invitations_id[name=?]", "response[invitations_id]"
    end
  end
end
