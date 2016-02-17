require 'rails_helper'

RSpec.describe ItemPresenter do
  let(:item)            { FactoryGirl.create(:item) }
  let(:item_set_1)      { FactoryGirl.create(:item_set) }
  let(:item_set_2)      { FactoryGirl.create(:item_set) }

  let(:property_color)  { FactoryGirl.create(:property, name: "color", description: "describes color") }
  let(:state_white)     { FactoryGirl.create(:state, name: "white") }
  let(:state_black)     { FactoryGirl.create(:state, name: "black") }
  let(:state_green)     { FactoryGirl.create(:state, name: "green") }

  let(:property_type)   { FactoryGirl.create(:property, name: "type", description: "describes type") }
  let(:state_home)      { FactoryGirl.create(:state, name: "home") }
  let(:state_work)      { FactoryGirl.create(:state, name: "work") }
  let(:state_sport)     { FactoryGirl.create(:state, name: "sport") }

  let(:name)            { item.name }
  let(:description)     { item.description }
  let(:item_sets)       { [item_set_1.name, item_set_2.name] }
  let(:properties)      { {:color=>"white", :type=>"sport"} }

  let(:subject)         { described_class.call(item) }

  describe '#call' do
    before do
      property_color.states << [state_white, state_black, state_green]
      property_type.states << [state_home, state_work, state_sport]

      item.states << [state_white, state_sport]
      item.properties << [property_color, property_type]
      item_set_1.items << item
      item_set_2.items << item
    end

    it { is_expected.to include(:name) }
    it { is_expected.to include(:description) }
    it { is_expected.to include(:items_sets) }
    it { is_expected.to include(:properties) }

    it { is_expected.to include(name: name) }
    it { is_expected.to include(description: description) }
    it { is_expected.to include(items_sets: item_sets) }
    it { is_expected.to include(properties: properties) }
  end
end
