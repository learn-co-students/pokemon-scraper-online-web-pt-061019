require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = DB.execute("SELECT * FROM pokemon;")

# test out your code here!
