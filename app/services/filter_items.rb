class FilterItems

  def self.call(all_items, given_states, filter_type)
    return all_items if given_states.blank?

    Item.map_all do |item|
      case filter_type
      when :strict
        given_states.map do |state|
          item.states.map {|s| s.name}.include?(state)
        end.include?(false) ? nil : item
      when :any
        item.states.find do |state|
          given_states.include?(state.name)
        end ? item : nil
      else
        item
      end
    end.compact.map{|i| ItemPresenter.call(i)}
  end
end
