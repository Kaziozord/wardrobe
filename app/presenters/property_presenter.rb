class PropertyPresenter

  def self.call(property)
    states = property.states.map{ |state| state.name.parameterize.underscore.to_sym }

    {
      name: property.name,
      description: property.description,
      states: states
    }
  end
end
