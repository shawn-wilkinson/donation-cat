good_american_link = "http://www.amazon.com/gp/registry/wishlist/T8E7KL29ENDQ/?ie=UTF8&tag=childsplaycha-20&linkCode=ur2&camp=1789&creative=9325"

bad_american_link = "http://www.amazon.com/registry/wishlist/1I9RPW4H98KTH/?_encoding=UTF8&camp=1789&creative=9325&linkCode=ur2&tag=childsplaycha-20"

canadian_link = "http://www.amazon.ca/registry/wishlist/1AHKFM6B2202M?_encoding=UTF8&tag=childsplaycha-20&linkCode=ur2&camp=1789&creative=9325"


link_array = canadian_link.split('/')

# T8E7KL29ENDQ - good_american_link
# 1I9RPW4H98KTH - bad_american_link
# 1AHKFM6B2202M - canadian_link


			holding_array = []
			results = []


			if link_array[5].length > 12
				link_array[5] = link_array[5][0..12]
			end

			holding_array << link_array[5]
			holding_array << link_array[6]

			holding_array.each do |result|
				results << result if result && result.length < 20
			end

			results[-1]

