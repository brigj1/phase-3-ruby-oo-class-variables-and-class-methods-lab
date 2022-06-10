require 'pry'

class Song
    attr_accessor :name, :artist, :genre

    @@count = 0
    @@genres = []
    @@artists = []
    @@genre_ct = Hash.new(0)
    @@artist_ct = Hash.new(0)
    @@all = []
    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre

        @@genre_ct[genre.to_sym] += 1
        @@genres = chg_hash_keys_to_sym(@@genre_ct)

        @@artist_ct[artist.to_sym] += 1
        @@artists = chg_hash_keys_to_sym(@@artist_ct)

        @@count += 1
        @@all << self
        #binding.pry
    end

    def self.all
        @@all
    end

    # regurn e.g. 30
    def self.count
        @@count
    end

    def self.xartist_ct
        @@artist_ct
    end
    # regurn e.g. ["Jay-Z", "Drake", "Beyonce"]
    def self.artist_count
        @@artist_ct.collect{|k,v| [k.to_s, v]}.to_h
    end

    def self.artists
        @@artists
    end

    def self.xgenre_ct
        @@genre_ct
    end
    # return e.g. {"rap" => 5, "rock" => 1, "country" => 3}
    def self.genre_count
        @@genre_ct.collect{|k,v| [k.to_s, v]}.to_h
    end

    # return e.g. ["Rap", "Pop"]
    def self.genres
        @@genres
    end

    private

    # was doing:
    #@@genres = @@genre_ct.keys.map{|k| k.to_s}
    #@@artists = @@artist_ct.keys.map{|k| k.to_s}
    def chg_hash_keys_to_sym (a_hash)
        a_hash.keys.map{|k| k.to_s}
    end
end

__END__
ninety_nine_problems = Song.new("99 Problems", "Jay-Z", "Rap")
oopa = Song.new("oopad", "Jay-Z", "Rap")
moopa = Song.new("moopad", "Z", "Rock")
binding.pry