good_american_link = "http://www.amazon.com/gp/registry/wishlist/T8E7KL29ENDQ/?ie=UTF8&tag=childsplaycha-20&linkCode=ur2&camp=1789&creative=9325"

bad_american_link = "http://www.amazon.com/registry/wishlist/1I9RPW4H98KTH/?_encoding=UTF8&camp=1789&creative=9325&linkCode=ur2&tag=childsplaycha-20"

another_bad_link = "http://www.amazon.com/wishlist/10NEX224OQKF1/ref=sr_1_1_acs_wl_1?ie=UTF8&qid=1429812856&sr=8-1-acs"

super_bad_link = "http://www.amazon.com/gp/registry/registry.html?ie=UTF8&id=17Z99B5BTAL4Z&type=wishlist"

suspect_link = "http://www.amazon.com/gp/registry/registry.html?type=wishlist&id=2H9UU3LYHWISQ"


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

initial_regex(suspect_link)




destination = "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=" + initial_regex(suspect_link) + "&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1"

# good_american_link = T8E7KL29ENDQ
# bad_american_link = 1I9RPW4H98KTH
# another_bad_link = 10NEX224OQKF1
# super_bad_link = 17Z99B5BTAL4Z
# suspect_link = 2H9UU3LYHWISQ



