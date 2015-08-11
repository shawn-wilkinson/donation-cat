
link = "http://www.amazon.com/gp/registry/wishlist/3AW1BUYSY69G5/ref=cm_wl_rlist_go_v?"  # => "http://www.amazon.com/gp/registry/wishlist/3AW1BUYSY69G5/ref=cm_wl_rlist_go_v?"

link_array = link.split('/')  # => ["http:", "", "www.amazon.com", "gp", "registry", "wishlist", "3AW1BUYSY69G5", "ref=cm_wl_rlist_go_v?"]

holding_array = []  # => []
results = []        # => []

holding_array << link_array[5]  # => ["wishlist"]
holding_array << link_array[6]  # => ["wishlist", "3AW1BUYSY69G5"]

holding_array.each do |result|            # => ["wishlist", "3AW1BUYSY69G5"]
	results << result if result.length < 20  # => ["wishlist"], ["wishlist", "3AW1BUYSY69G5"]
end                                       # => ["wishlist", "3AW1BUYSY69G5"]

results[-1]  # => "3AW1BUYSY69G5"

destination = "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=" + results[0] + "&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1"  # => "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=wishlist&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1"
