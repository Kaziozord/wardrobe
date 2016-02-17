require 'rails_helper'

RSpec.describe Property do
  let(:subject)	{ FactoryGirl.build(:property) }

  describe 'associations' do
    it { expect(subject).to respond_to :values }
    it { expect(subject).to respond_to :items }
    it { expect(subject).to respond_to :states }
  end
end
