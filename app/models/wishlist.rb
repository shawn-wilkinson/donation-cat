require 'nokogiri'
require 'open-uri'

class Wishlist < ActiveRecord::Base
  belongs_to :charity
  has_many :items

  def generate_print_friendly_url

  end

	def update_wishlist

			self.items.delete_all
			link = self.original_link

			link_array = link.split('/')
			id = link_array[6]
			destination = "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=" + id + "&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1"

			if link
				
				doc = Nokogiri::HTML(open(destination))
				track_row = doc.css("tr")
				modified_track_rows = track_row[3..-1]
				modified_track_rows.each do |track_row|

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
