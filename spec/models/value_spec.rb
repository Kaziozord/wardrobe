require 'rails_helper'

RSpec.describe Value do
  let(:subject) { FactoryGirl.build(:value) }

  describe 'associations' do
    it { expect(subject).to respond_to :property }
    it { expect(subject).to respond_to :item }
  end
end
