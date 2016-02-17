require 'rails_helper'

RSpec.describe PropertyPresenter do
  let(:property)    { FactoryGirl.create(:property) }
  let(:state_1)     { FactoryGirl.create(:state, name: "funky") }
  let(:state_2)     { FactoryGirl.create(:state, name: "old and ugly") }
  let(:state_3)     { FactoryGirl.create(:state, name: "fruity") }

  let(:name)        { property.name }
  let(:description) { property.description }
  let(:states)      { [:funky, :old_and_ugly] }
  let(:state_3_name){ [:fruity] }

  let(:subject)     { described_class.call(property) }

  describe '#call' do
    before do
      property.states << [state_1, state_2]
    end

    it { is_expected.to include(:name) }
    it { is_expected.to include(:description) }
    it { is_expected.to include(:states) }

    it { is_expected.to include(name: name) }
    it { is_expected.to include(description: description) }
    it { is_expected.to include(states: states) }
    it { is_expected.not_to include(states: state_3_name) }
  end
end
