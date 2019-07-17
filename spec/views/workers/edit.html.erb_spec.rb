require 'rails_helper'

RSpec.describe "workers/edit", type: :view do
  before(:each) do
    @worker = assign(:worker, Worker.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :age => 1,
      :team => "MyString"
    ))
  end

  it "renders the edit worker form" do
    render

    assert_select "form[action=?][method=?]", worker_path(@worker), "post" do

      assert_select "input[name=?]", "worker[first_name]"

      assert_select "input[name=?]", "worker[last_name]"

      assert_select "input[name=?]", "worker[age]"

      assert_select "input[name=?]", "worker[team]"
    end
  end
end
