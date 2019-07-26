[['Batumi', 'Georgia', 123456789],
 ['Tbilisi', 'Georgia', 123456789],
 ['Kyiv', 'Ukraine', 123456789],
 ['Cherkasy', 'Ukraine', 123456789],
 ['Budapest', 'Hungary', 123456789],
 ['Amsterdam', 'Netherlands', 123456789],
 ['Vienna', 'Austria', 123456789],
 ['Lviv', 'Ukraine', 123456789],
 ['Moscow', 'Russia', 123456789],
 ['Odessa', 'Ukraine', 123456789]].each do |city|
  City.create!(name: city[0], description: city[1], population: city[2])
 end
