bad = "http://www.amazon.com/registry/wishlist/1I9RPW4H98KTH/?_encoding=UTF8&camp=1789&creative=9325&linkCode=ur2&tag=childsplaycha-20"  # => "http://www.amazon.com/registry/wishlist/1I9RPW4H98KTH/?_encoding=UTF8&camp=1789&creative=9325&linkCode=ur2&tag=childsplaycha-20"

bad_p = "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=1I9RPW4H98KTH&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1"  # => "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=1I9RPW4H98KTH&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1"


good = "http://www.amazon.com/gp/registry/wishlist/3AW1BUYSY69G5/ref=cm_wl_rlist_go_v?"  # => "http://www.amazon.com/gp/registry/wishlist/3AW1BUYSY69G5/ref=cm_wl_rlist_go_v?"

good_p = "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=3AW1BUYSY69G5&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1"  # => "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=3AW1BUYSY69G5&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1"



# 1I9RPW4H98KTH

# 3AW1BUYSY69G5


link_array = good.split('/')  # => ["http:", "", "www.amazon.com", "registry", "wishlist", "1I9RPW4H98KTH", "?_encoding=UTF8&camp=1789&creative=9325&linkCode=ur2&tag=childsplaycha-20"]
			id = link_array[6]        # => "?_encoding=UTF8&camp=1789&creative=9325&linkCode=ur2&tag=childsplaycha-20"






			
			destination = "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=" + id + "&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1"  # => "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=?_encoding=UTF8&camp=1789&creative=9325&linkCode=ur2&tag=childsplaycha-20&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1"
