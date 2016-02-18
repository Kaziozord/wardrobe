class ItemPresenter

  def self.call(item)
    produce_output(
      item, get_states(item), get_sets(item), get_properties_values(item)
    )
  end

  private

  def self.get_properties_values(item)
    Hash[
      item.properties.map do |property|
        [ format_name(property.name), item.get_value(property) ] if property.states.count == 0
      end.compact
    ]
  end

  def self.get_states(item)
    Hash[
      item.states.map {|state| [ format_name(state.property.name), state.name ]}
    ]
  end

  def self.get_sets(item)
    item.item_sets.map{|item_set| item_set.name}
  end

  def self.produce_output(item, states, sets, values)
    {
      name: item.name,
      description: item.description,
      items_sets: sets,
      properties: states.merge(values)
    }
  end

  def self.format_name(name)
    name.parameterize.underscore.to_sym
  end
end
