require 'rails_helper'

RSpec.describe "workers/show", type: :view do
  before(:each) do
    @worker = assign(:worker, Worker.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :age => 2,
      :team => "Team"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Team/)
  end
end
