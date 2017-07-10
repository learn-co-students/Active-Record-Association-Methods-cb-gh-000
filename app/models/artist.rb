class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_first_song
    self.songs[0]
  end

  def get_genre_of_first_song
    song = get_first_song
    song.genre
  end

  def song_count
    if self.songs.class == Song
      1
    else
      self.songs.length
    end
  end

  def genre_count
    self.genres.length
  end
end
