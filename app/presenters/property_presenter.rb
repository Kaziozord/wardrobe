class PropertyPresenter

  def self.call(property)
    output = Hash.new
    states = Array.new

    if property.states != nil
      property.states.each {|s| states << s.name.parameterize.underscore.to_sym}
    end

    output.store(:name, property.name)
    output.store(:description, property.description)
    output.store(:states, states)

    output
  end
end
