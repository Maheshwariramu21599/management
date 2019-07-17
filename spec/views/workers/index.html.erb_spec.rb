require 'rails_helper'

RSpec.describe "workers/index", type: :view do
  before(:each) do
    assign(:workers, [
      Worker.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :age => 2,
        :team => "Team"
      ),
      Worker.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :age => 2,
        :team => "Team"
      )
    ])
  end

  it "renders a list of workers" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Team".to_s, :count => 2
  end
end
