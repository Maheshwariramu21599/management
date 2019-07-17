require 'rails_helper'

RSpec.describe Advisor, type: :model do
  context 'validation tests' do 
    let(:advisor) { build(:advisor) }
    it 'ensures first name presence' do
       advisor.first_name = nil
      expect(advisor.save).to eq(false)
    end
    it 'ensures last name presence' do
      advisor.last_name = nil
      expect(advisor.save).to eq(false)
    end
    
    it 'should save successfully' do
      expect(advisor.save).to eq(true)
    end

  end
end
