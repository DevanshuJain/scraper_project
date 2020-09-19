require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
	url = "http://www.nike.com/in/w/mens-nike-by-you-lifestyle-shoes-13jrmz6ealhznik1zy7ok"
	unparsh_page = HTTParty.get(url)
	parsh_page = Nokogiri::HTML(unparsh_page)
	carts = Array.new
	product_cards = parsh_page.css('div.product-card')
	product_cards.each do |product_card|
		cart = {
			card__title: product_card.css('div.product-card__title').text,
			card__price: product_card.css('div.product-price').text,
			url: "https://www.nike.com/in/w/mens-nike-by-you-lifestyle-shoes-13jrmz6ealhznik1zy7ok"
		}
		carts << cart
	end

	file_to_save = File.new("example.txt", "w")
	# byebug
	# file_to_save.push(carts)
	file_to_save.puts(carts)
	file_to_save.close
end

scraper
