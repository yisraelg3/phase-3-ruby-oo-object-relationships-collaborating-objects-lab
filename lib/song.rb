class Song
    @@all = []

    attr_accessor :name, :artist
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        file = file.split(' - ')
        new_song = Song.new(file[1])
        new_song.artist_name=(file[0])
        new_song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end
end