
class Artist
    @@all = []
    
    attr_accessor :name
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_name)
       if @@all.find{|artist| artist_name == artist.name}
            @@all.find{|artist| artist_name == artist.name}
        else
            Artist.new(artist_name)
        end
    end

    def print_songs
        puts self.songs.map{|song| song.name}
    end
end
