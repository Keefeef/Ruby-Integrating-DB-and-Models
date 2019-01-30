require('pg')
require_relative('../db/sql_runner.rb')
require_relative('album.rb')


class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO artist (name)
    VALUES ($1)
    RETURNING * "
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM artist'
    artist = SqlRunner.run(sql)

    return artist.map { |band| Artist.new(band) }
  end

  def album()
  sql = "SELECT * FROM albums WHERE id = $1"
  values = [@id]
  results = SqlRunner.run( sql, values )
  album_data = results[0]
  return Album.new( album_data )
end

# def update()
#   sql = "UPDATE artist SET (name)
#   = ($1)
#   WHERE id = $2"
#   values = [@name, @id]
#   results = SqlRunner.run(sql, values)
#   updated_artist = results[0]
#   return Artist.new( updated_artist )
# end






end
