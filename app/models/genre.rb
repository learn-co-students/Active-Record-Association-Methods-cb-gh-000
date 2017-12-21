class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.size
  end

  def artist_count
    # return the number of artists associated with the genre
    self.songs.map(&:artist).uniq.size
  end

  def all_artist_names
    self.songs.map { |song| song.artist.name }.uniq
  end
end
