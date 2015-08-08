require 'nokogiri'
require 'open-uri'

class Wishlist < ActiveRecord::Base
  belongs_to :charity
  has_many :items



	def update_wishlist

			link = self.link
			if link
				p "$$$$$$$$$$$$$$$$$$$$$$$$$"
				p link 
				doc = Nokogiri::HTML(open(link))
				p "$$$$$$$$$$$$$$$$$$$$$$$$$"
				p link 
				test = doc.css("tr")
				p "$$$$$$$$$$$$$$$$$$$$$$$$$"
				p test

				test1 = test[3..-1]
				
				test1.each do |test|
					
					name = test.css(".g-title").first.text
					picture_url = test.css("img").first["src"]
					current_price = test.css(".price-section").first.text
					priority = test.css(".g-priority").first.text
					qty_requested = (test.css(".g-requested").first.text).to_i
					qty_received = (test.css(".g-received").first.text).to_i

					item = Item.new(name: name, picture_url: picture_url, current_price: current_price, priority: priority, qty_requested: qty_requested, qty_received: qty_received)

					# results << ((test.css(".g-requested").first.text).to_i).class

					self.items << item
				end
			end
	end

end
