require 'rails_helper'

RSpec.describe ItemSet do
  let(:subject)	{ FactoryGirl.build(:item_set) }

  describe 'associations' do
    it { expect(subject).to respond_to :items }
  end
end
