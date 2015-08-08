require 'nokogiri'
require 'open-uri'

class Wishlist < ActiveRecord::Base
  belongs_to :charity
  has_many :items

	def update_wishlist
			self.items.delete_all
			link = self.link
			if link
				
				doc = Nokogiri::HTML(open(link))
				# File.open('heythere.xml', 'w') { |f| f.print(doc) }

				# view_link = doc.css(".a-size-small").text
				# p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
				# p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
				# p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
				# p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"

				# p view_link


				track_row = doc.css("tr")
				modified_track_row = track_row[3..-1]
				modified_track_row.each do |track_row|
					
					name = track_row.css(".g-title").first.text
					picture_url = track_row.css("img").first["src"]
					current_price = track_row.css(".price-section").first.text
					priority = track_row.css(".g-priority").first.text
					qty_requested = (track_row.css(".g-requested").first.text).to_i
					qty_received = (track_row.css(".g-received").first.text).to_i

					item = Item.new(name: name, picture_url: picture_url, current_price: current_price, priority: priority, qty_requested: qty_requested, qty_received: qty_received)

					self.items << item
				end
			end
	end

end
