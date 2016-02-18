class ItemsController < ApplicationController

  def index
    render locals: { items: items, properties: properties }
  end

  def add_item
    CreateItem.call(item_name, item_description, item_states)
    list_filtered_items
  end

  def list_filtered_items
    respond_to do |format|
      format.js { 
        render partial: "list", locals: { items: filtered_items, properties: properties }
      }
    end
  end

  private

  def filtered_items
    return items if given_states.blank?

    Item.all.map do |item|
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

  def given_states
    params[:filter]
  end

  def filter_type
    params[:filtertype].try(:to_sym)
  end

  def properties
    Property.all.map{|p| PropertyPresenter.call(p)}
  end

  def items
    Item.all.map{|i| ItemPresenter.call(i)}
  end

  def item_name
    params[:itemName]
  end

  def item_description
    params[:itemDescription]
  end

  def item_states
    params[:states]
  end
end
