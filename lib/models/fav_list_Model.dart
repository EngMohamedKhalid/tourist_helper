 class FavouriteListModel{
  static List <String> itemNames=[
    'Eiffel Tower, Paris',
    'The Colosseum, Rome',
    'Statue of Liberty, New York City',
    'Machu Picchu, Peru',
    'The Acropolis, Athens',
    'The Taj Mahal, India',
    'Pyramids of Giza, Egypt',
    'Great Wall of China',
    'Angkor Wat, Cambodia',
    'Petra, Jordan',
    'Grand Canyon, USA',
    'Stonehenge, England',
    'Borobudur, Indonesia',
    'Niagara Falls, Canada & USA',
    'Bagan, Myanmar',
    'Sydney Opera House',
    'Mount Kilimanjaro',
    'The Louvre, Paris',
    'Forbidden City, China',
    'Prague Castle, Czech Republic',
    'Chichen Itza, Mexico',
    'Corcovado and Cristo Redentor, Rio de Janeiro',
    'Château de Versailles, France',
    'Mount Fuji',
    'Central Park, New York City',
  ];
  static List <String> itemSubtitle=[
     'The symbol of Paris and one of the most photographed structures in the world',
    'called Flavian Amphitheatre in Rome',
    'symbol of freedom in New York City',
    ' the most impressive ruined city ',
    'Views out over the city are incredible',
    'the one sight travelers need to see',
    'built over 4,500 years ago.',
    ' provides an incredible view of the structure',
    ' impressive site in Southeast Asia',
    'just begging to be explored and photographed.',
    'greatest natural attraction in the USA',
    'It is long been a mystery to historians',
    'Indonesias top tourist attraction.',
    'At night, see the falls lit in different colors',
     'the real beauty is the sheer in the landscape.',
    'unique shape the exceptional acoustics',
    'The highest peak in all of Africa',
    'the most famous painting in the world',
    'the city is the massive Tiananmen square.',
    'The castle is an incredible building',
    'one of the top tourist attractions in Mexico',
    'Rio top attractions site',
    'the most impressive sights is (Les Jardins)',
    'Mount Fuji is the most well-known mountain in Japan',
    'one of the most famous public spaces',
  ];
  
  static List <String> itemImages=[
    ('images/Eiffel Tower , Paris.jpg'),
    ('images/italy-rome-colosseum.jpg'),
    ('images/new-york-statue-of-liberty.jpg'),
    ('images/peru-machu-picchu-overview.jpg'),
    ('images/greece-athens-acropolis-moon.jpg'),
    ('images/india-taj-mahal.jpg'),
    ('images/egypt-pyramids-giza.jpg'),
    ('images/china-great-wall.jpg'),
    ('images/cambodia-angkor-wat-stone-faces.jpg'),
    ('images/jordan-petra.jpg'),
    ('images/arizona-grand-canyon.jpg'),
    ('images/england-stonehenge.jpg'),
    ('images/indonesia-borobudur.jpg'),
    ('images/canada-united-states-niagara-falls.jpg'),
    ('images/myanmar-bagan.jpg'),
    ('images/sydney-opera-house.jpg'),
    ('images/tanzania-mt-kilimanjaro.jpg'),
    ('images/the-louvre-paris.jpg'),
    ('images/china-forbidden-city.jpg'),
    ('images/czech-republic-prague-castle.jpg'),
    ('images/chichen-itza-mexico.jpg'),
    ('images/corcovado-cristo-redentor-rio-de-janeiro.jpg'),
    ('images/chateau-versailles-france.jpg'),
    ('images/mount-fuji.jpg'),
    ('images/central-park-new-york-city.jpg'),
  ];
  Item getById(int id)=>Item (
    id,
    itemNames[id % itemNames.length],
    itemSubtitle[id % itemSubtitle.length],
    itemImages[id % itemImages.length],

  );
Item getByPosition(int position){
  return getById(position);
}
}


class Item{

  final int id;
  final String name;
  final String subtitle;
  final String Image;

   const Item(

       this.id,
       this.name,
       this.subtitle,
       this.Image,
       );

   @override
  int get hashCode => id;

   @override
  bool operator==(Object other)=> other is Item && other.id==id;
}