require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artist')

class Album

  attr_reader :id
  attr_accessor :name, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = 'INSERT INTO albums (name,
    genre,
    artist_id
    ) VALUES
    ($1, $2, $3)
    RETURNING id'
    values = [@name, @genre, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = 'SELECT * FROM album'
    album = SqlRunner.run(sql)

    return album.map { |songs| Album.new(songs) }
  end

  def artist()
  sql = "SELECT * FROM artist WHERE id = $1"
  values = [@artist_id]
  results = SqlRunner.run( sql, values )
  artist_data = results[0]
  return Artist.new( artist_data )
end

# def update()
#   sql = 'UPDATE albums SET
#   (name, genre, artist_id)
#   = ($1, $2, $3)
#   WHERE id = $4'
#   values = [@name, @genre, @artist_id, @id]
#   results = SqlRunner.run( sql, values)
#   updated_album = results[0]
#   return Album.new( updated_album )
# end















end
