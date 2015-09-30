require 'nokogiri'
require 'open-uri'

class Wishlist < ActiveRecord::Base
  belongs_to :charity
  has_many :items

  def initial_regex(link)
    if ( link =~ /id=[0-9a-zA-Z]*/ )
      my_var = /id=[0-9a-zA-Z]*/.match(link)
      string = my_var[0][3..-1]
      if string.length >= 12
          string
      else
          split_array(link)
      end
    else
        split_array(link)
    end
	end

  def split_array(link)
    link_array = link.split('/')
    holding_array = []
    results = []
    holding_array << link_array[4]
    holding_array << link_array[5]
    holding_array << link_array[6]
    holding_array.each do |result|
        results << result if result && result.length < 20
    end
    results[-1]
	end


	def update_wishlist
			self.items.delete_all
			link = self.original_link
			if link
				destination = "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=" + initial_regex(link) + "&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1"

					doc = Nokogiri::HTML(open(destination)) if destination
					track_row = doc.css("tr") if doc
					modified_track_rows = track_row[3..-1] if track_row
					if modified_track_rows
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

						item = Item.new(name: name, picture_url: picture_url, current_price: current_price, priority: priority, qty_requested: qty_requested, qty_received: qty_received) if name && picture_url && current_price && priority && qty_received && qty_requested

						self.items << item
						end
					else
						@errors = "This particular Amazon wishlist page uses a less common format and is not renderable at this time."
					end
			end
	end

end
