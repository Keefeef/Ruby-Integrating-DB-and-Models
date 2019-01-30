require('pry')
require_relative("../models/album")
require_relative("../models/artist")



artist1 = Artist.new({
  'name' => 'Infected Mushroom'
  })



artist1.save


# artist1.name = 'President T'
# artist1.update()

artist2 = Artist.new({
  'name' => 'Baby Metal'
  })

  artist2.save




album1 = Album.new ({
  'name' => 'Converting Vegetarians',
  'genre' => 'Psytrance',
  'artist_id' => artist1.id
  })



  album1.save

  # album1.update()

album2 = Album.new ({
  'name' => 'Give me Chocolate',
  'genre' => 'Metal',
  'artist_id' => artist2.id
})

  album2.save





  binding.pry
  nil
