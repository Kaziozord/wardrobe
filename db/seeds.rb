seed_data = {
  properties: [
    { name: "color", description: "color of item", states: [
      { name: "black" },
      { name: "white" },
      { name: "brown" },
      { name: "green" },
      { name: "blue"  },
      { name: "gray"  }
    ]},
    { name: "wear level", description: "describes wear level of item", states: [
      { name: "new" },
      { name: "slightly used" },
      { name: "weared" },
      { name: "wasted" }
    ]},
    { name: "type", description: "specifies type of the item", states: [
      { name: "shoes" },
      { name: "shirt" },
      { name: "pants" }
    ]}
  ],
  items: [
    { name: "Brown pants", description: "Nice, casual pants", states: ["pants", "slightly used", "brown"]},
    { name: "Levis Jeans", description: "Good looking pair", states: ["pants", "weared", "blue"]},
    { name: "Nike AF1 Baroque Brown", description: "Nice shoes", states: ["shoes", "weared", "brown"]},
    { name: "Rebook Shoes", description: "For running, too big", states: ["wasted", "white"]},
    { name: "Rebook Hoodie", description: "Black hoodie", states: ["weared", "black"]},
    { name: "T-shirt Ortofon", description: "Good looking pair", states: ["shirt", "slightly used", "gray"]},
    { name: "Green T-shirt with IPods", description: "Funny, too big t-shirt", states: ["shirt", "new", "green"]},
    { name: "Trekking shoes", description: "Wasted, but still to use", states: ["shoes", "wasted", "brown"]},
    { name: "Black scarf", description: "Long and warm scarf", states: ["weared", "black"]}
  ],
  items_sets: [
    { name: "home" },
    { name: "work" },
    { name: "casual" },
    { name: "party" }
  ]
}

seed_data[:properties].each do |seed|
  Property.where(name: seed[:name], description: seed[:description]).first_or_create
    .states.create(seed[:states])
end

seed_data[:items].each do |seed|
  item = Item.where(name: seed[:name], description: seed[:description]).first_or_create
  item.states << seed[:states].map{|name| State.where(name: name)} if item.states.size == 0
  item.properties << seed[:states].map{|name| State.find_by(name: name).property} if item.properties.size ==0
end

seed_data[:items_sets].each do |seed|
  ItemSet.where(name: seed[:name]).first_or_create
end

ItemSet.find(1).items << Item.find(1)
ItemSet.find(1).items << Item.find(2)
ItemSet.find(2).items << Item.find(2)
ItemSet.find(2).items << Item.find(3)

ap Item.map_all{|i| ItemPresenter.call(i)}
