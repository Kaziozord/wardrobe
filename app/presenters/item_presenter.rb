class ItemPresenter
  def initialize
  end

  def self.call(item)
    produce_output(
      item, get_states(item), get_sets(item), get_properties_values(item)
    )
  end

  private

  def self.get_properties_values(item)
    values = Hash.new
    item.properties.each do |property|
      next if property.states.count > 0
      values.store(
        property.name.parameterize.underscore.to_sym,
        item.get_value(property)
      )
    end
    values
  end

  def self.get_states(item)
    states = Hash.new
    item.states.each do |state|
      states.store(
        state.property.name.parameterize.underscore.to_sym,
        state.name
      )
    end
    states
  end

  def self.get_sets(item)
    item.item_sets.map{|item_set| item_set.name}
  end

  def self.produce_output(item, states, sets, values)
    output = Hash.new
    output.store(:name, item.name)
    output.store(:description, item.description)
    output.store(:items_sets, sets)
    output.store(:properties, states.merge(values))

    output
  end
end
