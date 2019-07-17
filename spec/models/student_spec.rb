require 'rails_helper'

RSpec.describe Student, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context 'validation tests' do 
    
    let(:student) { build(:student)}
    it 'ensures first name presence' do
       student.first_name = nil
      expect(student.save).to eq(false)
    end
    it 'ensures last name presence' do
      student.last_name = nil
      expect(student.save).to eq(false)
    end
    
    it 'should save successfully' do
      expect(student.save).to eq(false)
    end

  end
end
