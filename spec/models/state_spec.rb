require 'rails_helper'

RSpec.describe State do
  let(:subject)	{ FactoryGirl.build(:state) }

  describe 'associations' do
    it { expect(subject).to respond_to :items }
    it { expect(subject).to respond_to :property }
  end
end
