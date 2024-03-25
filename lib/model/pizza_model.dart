class Pizza {
  final String name;
  final String price;
  final String description;
  final String image;

  Pizza(
      {required this.name,
      required this.price,
      required this.description,
      required this.image});

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
        name: json['name'].toString(),
        price: json['price'].toString(),
        description: json['description'].toString(),
        image: json['image'].toString());
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}

final List<Pizza> pizzaList = [
  Pizza(
      name: "Chilli",
      image: "assets/images/four_chees.png",
      price: "1,890",
      description:
          "Mozzarella offers a classic Italian delight featuring a crispy crust topped with rich tomato sauce, creamy melted mozzarella cheese, and a sprinkle of aromatic herbs. This timeless favorite brings together the simplicity of fresh ingredients with the comforting familiarity of traditional pizza, making it a beloved choice for any occasion"),
  Pizza(
      name: "Classic Cheese",
      image: "assets/images/mozzarella.png",
      price: "1,599",
      description:
          "Pizza is a culinary masterpiece that brings together the rich and distinct flavors of four delectable cheeses on a golden, oven-baked crust. Indulge in the tuxunous blend of creamy mozzarella, sharp cheddar tangy Parmesan, and velvety provolone, perfectly complemented by a savory tomato sauce"),
  Pizza(
      name: "Pepperoni",
      image: "assets/images/salami.png",
      price: "2,099",
      description:
          "Pepperoni Supreme is a mouthwatering pizza delight that boasts a perfect harmony of savory flavors and zesty spices. Our signature dough is expertly crafted and baked to guiden perfection, serving as the canvas for a tantalizing combination of robust tomato sauce gooey melted cheese, and thinly sliced, savory salarms"),
  Pizza(
      name: "Capricciosa",
      image: "assets/images/capricciosa.png",
      price: "1,890",
      description:
          "CapriClassic Pizza is a culinary gem that embodies the essence of italian tradition and flavor, Crafted on a base of hand-stretched dough, this pizza is adornod with a symphony of premium ingredients including savory harm, earthy mushrooms, tangy artichowe hearts, and briny olives, all nestled atop a bed of rich tomato sauce and gooey mozzarella cheese"),
  Pizza(
      name: "Spinach Quiche",
      image: "assets/images/prosciutto.png",
      price: "2,400",
      description:
          "Spinach Quiche Bliss is an exquisite pizza creator that Celebrates the delicate yet flavorfull inssence of thinly sliced presciutto Crafted on a foundation of artisanal dough, this pizza masterpiece is adorned with luscious layer of tangy tomato sauce and creamy mozzarella cheese perfectly complementing the sarty richness of the prosciutto"),
];

final pizzaSizes = ['S', 'M', 'L'];
