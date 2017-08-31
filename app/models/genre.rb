class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    @artist_count = 0
    self.songs.each do |song|
      if song.artist
        @artist_count += 1
      end
    end
    @artist_count
  end

# return an array of strings containing every musician's name
  def all_artist_names
    self.songs.collect do |song|
      if song.artist
        song.artist.name
      end
    end
  end
  
end
