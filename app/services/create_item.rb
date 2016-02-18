class CreateItem

  def self.call(name, description, states)
    new_item = Item.new(name: name, description: description)

    states.each do |state_name|
      next unless (state = State.find_by_name(state_name))

      new_item.properties << state.property
      new_item.states << state
    end

    if contains_all_given_states(new_item, states)
      new_item.save
      new_item
    else
      nil
    end
  end

  private

  def self.contains_all_given_states(new_item, states)
    new_item.states.size == states.size
  end
end
