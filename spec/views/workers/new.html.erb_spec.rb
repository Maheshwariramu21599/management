require 'rails_helper'

RSpec.describe "workers/new", type: :view do
  before(:each) do
    assign(:worker, Worker.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :age => 1,
      :team => "MyString"
    ))
  end

  it "renders new worker form" do
    render

    assert_select "form[action=?][method=?]", workers_path, "post" do

      assert_select "input[name=?]", "worker[first_name]"

      assert_select "input[name=?]", "worker[last_name]"

      assert_select "input[name=?]", "worker[age]"

      assert_select "input[name=?]", "worker[team]"
    end
  end
end
