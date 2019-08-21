class Scraper
  attr_accessor :file, :parsed_file, :all_pokemon, :db

  def initialize(db)
    self.db = db
    self.file = File.open("pokemon_index.html")   #gets html of pg
    self.parsed_file = Nokogiri::HTML.parse(file) #nokogiri doc
    self.all_pokemon = catch_em_all               #container of all pk info in doc
  end

  def catch_em_all
    self.all_pokemon = parsed_file.css(".infocard-tall")
  end

  def get_pokemon_name_from(node)
    node.css(".ent-name").text   #gets pk name
  end

  def get_pokemon_type_from(node)
    node.css(".itype").text      #gets pk type
  end

  def scrape
    all_pokemon.each do |pk_node|                #iterates through all pk info
      pk_name = get_pokemon_name_from(pk_node)   #sets pk name
      pk_type = get_pokemon_type_from(pk_node)   #sets pk type
      Pokemon.save(pk_name, pk_type, db)         #saves specific pk to db
    end
  end

end
