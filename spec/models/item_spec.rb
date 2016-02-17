require 'rails_helper'

RSpec.describe Item do
  let(:subject)	{ FactoryGirl.build(:item) }

  describe 'associations' do
    it { expect(subject).to respond_to :values }
    it { expect(subject).to respond_to :properties }
    it { expect(subject).to respond_to :states }
    it { expect(subject).to respond_to :item_sets }
  end

  describe '#set_value' do
  end

  xdescribe '#get_value' do
  end
end
