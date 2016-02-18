class ItemsController < ApplicationController

  def index
    render locals: { items: all_items, properties: properties }
  end

  def add_item
    CreateItem.call(item_name, item_description, item_states)
    list_filtered_items
  end

  def list_filtered_items
    filtered_items = FilterItems.call(all_items, given_states, filter_type)
    
    respond_to do |format|
      format.js { 
        render partial: "list", locals: { items: filtered_items, properties: properties }
      }
    end
  end

  private

  def given_states
    params[:filter]
  end

  def filter_type
    params[:filtertype].try(:to_sym)
  end

  def properties
    Property.fetch_all.map{|p| PropertyPresenter.call(p)}
  end

  def all_items
    Item.fetch_all.map{|i| ItemPresenter.call(i)}
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
