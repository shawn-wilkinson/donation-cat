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
				# File.open('working.xml', 'w') { |f| f.print(doc) }

				# test = doc.css(".g-print-profile tr").text

				# p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
				# p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
				# p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
				# p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
				# p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
				# p "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
				# p test
			
				track_row = doc.css("tr")
				# p track_row
				modified_track_rows = track_row[3..-1]
				modified_track_rows.each do |track_row|


					# p current_price = track_row.css(".price-section span").first.text
					# p qty_requested = track_row.css(".g-requested").first.text

					
					name = track_row.css(".g-title").first.text
					picture_url = track_row.css("img").first["src"]
					current_price = track_row.css(".price-section").first.text
					priority = track_row.css(".g-priority").first.text
					qty_requested = (track_row.css(".g-requested").first.text).to_i
					qty_received = (track_row.css(".g-received").first.text).to_i


					if ! name.valid_encoding?
  					name = name.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
					end

	
					item = Item.new(name: name, picture_url: picture_url, current_price: current_price, priority: priority, qty_requested: qty_requested, qty_received: qty_received)

					self.items << item
				end
			end
	end

end
