require 'rails_helper'

RSpec.describe CreateItem do
  let(:item)                { FactoryGirl.create(:item) }
  let(:property_color)      { FactoryGirl.create(:property, name: "color", description: "describes color") }
  let(:state_white)         { FactoryGirl.create(:state, name: "white") }
  let(:state_black)         { FactoryGirl.create(:state, name: "black") }
  let(:state_green)         { FactoryGirl.create(:state, name: "green") }

  let(:property_type)       { FactoryGirl.create(:property, name: "type", description: "describes type") }
  let(:state_home)          { FactoryGirl.create(:state, name: "home") }
  let(:state_work)          { FactoryGirl.create(:state, name: "work") }
  let(:state_sport)         { FactoryGirl.create(:state, name: "sport") }

  let(:states)              { ["white", "sport"] }
  let(:non_existing_states) { ["yellow", "casual"] }
  let(:name)                {"T-shirt"}
  let(:description)         {"t-shirt for running"}

  let(:color)               { property_color.name }
  let(:color_description)   { property_color.description }
  let(:type)                { property_type.name }
  let(:type_description)    { property_type.description }

  describe '#call' do
    before do
      property_color.states << [state_white, state_black, state_green]
      property_type.states << [state_home, state_work, state_sport]
    end

    context 'with valid arguments' do
      let(:subject) { described_class.call(name, description, states) }

      it 'creates new item' do
        expect{subject}.to change{Item.count}.by(1)
      end

      it 'new item has proper name and description' do
        expect(subject).to have_attributes(name: name, description: description)
      end

      it 'new item has valid properties' do
        expect(subject.properties[0]).to have_attributes(name: color, description: color_description)
        expect(subject.properties[1]).to have_attributes(name: type, description: type_description)
      end

      it 'new item has valid states' do
        expect(subject.states[0]).to have_attributes(name: states[0])
        expect(subject.states[1]).to have_attributes(name: states[1])
      end

      it 'returns new item' do
        expect(subject).to be_a Item
      end
    end

    context 'with non existing state names' do
      let(:subject) { described_class.call(name, description, non_existing_states) }

      it 'does not create an item' do
        expect{subject}.not_to change{Item.count}
      end

      it { expect(subject).to eq nil }
    end
  end
end
