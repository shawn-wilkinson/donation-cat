require 'faker'


#Google doc research
cat1 = Category.create(name:"Animal Advocacy")
cat2 = Category.create(name:"Arts Awareness")
cat3 = Category.create(name:"Special Needs")
cat4 = Category.create(name:"Health")
cat5 = Category.create(name:"Children")
cat6 = Category.create(name:"Social Services")
cat7 = Category.create(name:"Religious")
cat8 = Category.create(name:"International")
cat9 = Category.create(name:"Economic Empowerment")
cat10 = Category.create(name:"Human Services")
cat11 = Category.create(name:"LGBT")
cat12 = Category.create(name:"Education")


#Google doc research
char1 = Charity.create!(name: "American Lung Association in Illinois", description: "The American Lung Association is the leading organization working to save lives by improving lung health and preventing lung disease through Education, Advocacy and Research. With the generous support of the public, we are 'Fighting for Air.' When you join the American Lung Association in the fight for healthy lungs and healthy air, you help save lives today and keep America healthy tomorrow.", street_address: "55 W. Wacker Drive, Suite 1150", city: "Chicago", state: "IL", zip_code: "60601", twitter_handle: "ALAChicago", website: "http://www.lung.org/", donation_page: "http://www.lung.org/donate/", password: "password")
char1.categories << cat4
char2 = Charity.create!(name: "PAWS Chicago", description: "No-Kill Animal Shelter", contact_name: "Kaitlin Allen", contact_email: "kallen@pawschicago.org", street_address: "1997 N. Clybourn Ave", city: "Chicago", state: "IL", zip_code: "60614", twitter_handle: "PAWSchicago", website: "http://www.pawschicago.com", donation_page: "http://www.pawschicago.org/how-to-help/donate/", password: "password")
char2.categories << cat1
char2.wishlists.create!(original_link: "https://www.amazon.com/gp/registry/wishlist/A91GR1NSCYZO/ref=cm_sw_su_w")
char3 = Charity.create!(name: "Treehouse Humane Society For Cats", description: "Cageless, No-Kill Cat Shelter", street_address: "1212 W. Carmen Avenue", city: "Chicago", state: "IL", zip_code: "60640", twitter_handle: "treehousecats", website: "http://www.treehouseanimals.org/", donation_page: "https://secure3.convio.net/thhs/site/Donation2;jsessionid=A7E10EF46E1B16A5DBE6434094936007.app357a?df_id=1180&1180.donation=form1", password: "password")
char3.categories << cat1
char4 = Charity.create(name: "Tender Loving Care Animal Shelter", description: "Animal Shelter", contact_phone: "(708) 301-1594", street_address: "13016 West 151st Street", city: "Homer Glen", state: "IL", zip_code: "60491", twitter_handle: "tlcanimal", website: "http://www.tlcanimalshelter.org/", donation_page: "http://www.tlcanimalshelter.org/info/donate", password: "password")
char4.categories << cat1
# char4.wishlists.create!(original_link: "http://www.amazon.com/registry/wishlist/3QFCG8VCY7MT2/ref=cm_sw_r_tw_ws_jS69ub0W8F78")
wishlist4 = Wishlist.create!(original_link: "http://www.amazon.com/registry/wishlist/3QFCG8VCY7MT2/ref=cm_sw_r_tw_ws_jS69ub0W8F78")
char4.wishlists << wishlist4

char5 = Charity.create!(name: "Humane Society of Indianpolis", description: "Animal Shelter", street_address: "7929 Michigan Road", city: "Indianapolis", state: "IN", zip_code: "46268", twitter_handle: "indyhumane", website: "https://indyhumane.org", donation_page: "https://indyhumane.org/get_involved/donate", password: "password")
char5.categories << cat1
wishlist5 = Wishlist.create!(original_link: "http://www.amazon.com/gp/registry/wishlist/RKKRCXYF9MX7/ref=cm_sw_su_w?view=null")
char5.wishlists << wishlist5
char6 = Charity.create!(name: "About Face Theater", description: "About Face Theatre creates exceptional, innovative, and adventurous plays to advance the national dialogue on gender and sexual identity, and to challenge and entertain audiences in Chicago, across the country, and around the world. Our vision is to be Chicago’s celebrated center for lesbian, gay, bisexual, transgender, queer and ally (LGBTQA) arts and amplify the nation’s leading voices to spark social change. Enabled by broad community support, the organization thrives as an inclusive home where diverse artists, youth, audiences and community partners come together for artistic exchange and cultural dialogue.", contact_phone: "(773) 784-8565", street_address: "5252 N Broadway St", city: "Chicago", state: "IL", zip_code: "60640", twitter_handle: "aboutfacechi", website: "http://aboutfacetheatre.com/", donation_page: "https://aboutfacetheatre.secure.force.com/donate/?dfId=a0nj00000002xiwAAA", password: "password")
char6.categories << cat2
char7 = Charity.create!(name: "Chicago a cappella", description: "Chicago a cappella is a creative enterprise devoted to furthering the art of singing together without instruments.", contact_name: "Shaina Farwell", contact_email: "info@chicagoacappella.org", contact_phone: "773-281-7820", street_address: "2936 N. Southport Ave.", city: "Chicago", state: "IL", zip_code: "60657", twitter_handle: "chi_acappella", website: "http://www.chicagoacappella.org/", donation_page: "https://app.etapestry.com/hosted/ChicagoACappella8/OnlineDonation.html", password: "password")
char7.categories << cat2
char8 = Charity.create!(name: "Anxiety center", description: "Anixter Center provides an array of services and supports for individuals with disabilities and related challenges to live, learn, work and play in the community.", contact_phone: "(773) 973-7900", street_address: "2001 N. Clybourn Ave.", city: "Chicago", state: "IL", zip_code: "60614", twitter_handle: "AnixterCenter", website: "http://www.anixter.org/", donation_page: "https://www.anixter.org/donatenow/online-donation-form", password: "password")
char8.categories << cat3
char9 = Charity.create!(name: "Agentina Chicago Foundation", description: "We are a group of young Argentinean professionals residing in the city of Chicago, United States. We came together in 2003 with a common desire to help the most underprivileged children in our native country. Since each of us was blessed with an opportunity for a good education, in most cases for free, we wanted to help generate the same opportunities for Argentinean children in need.", contact_name: "Jimena Sayavedra", contact_email: "jimena@argentinachicago.com", contact_phone: "312.371.8569", street_address: "1524 S Sangamon Unit 712", city: "Chicago", state: "IL", zip_code: "60601", website: "http://www.argentinachicago.org/", donation_page: "http://www.argentinachicago.org/ways-to-help/", password: "password")
char9.categories << cat3
char10 = Charity.create!(name: "Metro Health Hospital", description: "Community Hospital", street_address: "5900 Byron Center", city: "Wyoming", state: "MI", zip_code: "49519", twitter_handle: "metrohealthgr", website: "https://metrohealth.net", donation_page: "https://metrohealth.net/about-metro-health/metro-health-hospital-foundation/make-a-gift-today/", password: "password")
char10.categories << cat4
wishlist10 = Wishlist.create!(original_link: "http://www.amazon.com/registry/wishlist/3RCREANT11LI2/?_encoding=UTF8&camp=1789&creative=9325&linkCode=ur2&tag=childsplaycha-20")
char10.wishlists << wishlist10
# char10.wishlists.create!(original_link: "http://www.amazon.com/registry/wishlist/3RCREANT11LI2/?_encoding=UTF8&camp=1789&creative=9325&linkCode=ur2&tag=childsplaycha-20")
char11 = Charity.create!(name: "Ronald McDonald House Seattle", description: "Housing for family members of sick children", contact_phone: "(206) 838-0600", street_address: "5130 40th Ave NE", city: "Seattle", state: "WA", zip_code: "98105", twitter_handle: "rmhcseattle", website: "http://www.rmhcseattle.org/", donation_page: "https://www.givedirect.org/give/givefrm.asp?CID=4574", password: "password")
char11.categories << cat4
wishlist11 = Wishlist.create!(original_link: "http://www.amazon.com/gp/registry/wishlist/QIUJKLIID4B9/ref=cm_sw_su_w")
char11.wishlists << wishlist11
# char11.wishlists.create!(original_link: "http://www.amazon.com/gp/registry/wishlist/QIUJKLIID4B9/ref=cm_sw_su_w")
char12 = Charity.create!(name: "Operation Gratitude", description: "Operation Gratitude annually sends 150,000+ care packages filled with snacks, entertainment, hygiene and hand-made items, plus personal letters of appreciation, to New Recruits, Veterans, First Responders, Wounded Warriors, Care Givers and to individually named U.S. Service Members deployed overseas.", contact_email: "info@operationgratitude.com", contact_phone: "1-800-651-8031", street_address: "P.O. Box 260257", city: "Encino", state: "CA", zip_code: "91426", twitter_handle: "OpGratitude", website: "https://www.operationgratitude.com", donation_page: "https://www.operationgratitude.com/make-donation/", password: "password")
char12.categories << cat6
wishlist12 = Wishlist.create!(original_link: "https://www.amazon.com/gp/registry/wishlist/FY2O3UG2PNSG/ref=cm_sw_su_w")
char12.wishlists << wishlist12
# char12.wishlists.create!(original_link: "https://www.amazon.com/gp/registry/wishlist/FY2O3UG2PNSG/ref=cm_sw_su_w")
char13 = Charity.create!(name: "SOME (So Others Might Eat)", description: "SOME (So Others Might Eat) is an interfaith, community-based organization that exists to help the poor and homeless of our nation’s capital. We meet the immediate daily needs of the people we serve with food, clothing, and health care. We help break the cycle of homelessness by offering services, such as affordable housing, job training, addiction treatment, and counseling, to the poor, the elderly and individuals with mental illness.", contact_phone: "202.797.8806", street_address: "71 O Street", city: "Washington", state: "DC", zip_code: "20001", twitter_handle: "SOME_DC", website: "http://some.org/", donation_page: "https://secure2.convio.net/soome/site/Donation2?idb=2138350153&df_id=2340&2340.donation=form1&idb=251029693", password: "password")
char13.categories << cat6
# char13.wishlists.create!(original_link: "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_search_2?ie=UTF8&cid=A27C6K9V8AWL1N")
wishlist13 = Wishlist.create!(original_link: "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_search_2?ie=UTF8&cid=A27C6K9V8AWL1N")
char13.wishlists << wishlist13

char14 = Charity.create!(name: "Mission of Our Lady of the Angels", description: "Mission of Our Lady of the Angels provides a Catholic presence to the poor in West Humboldt Park, Chicago.", contact_email: "olamission@gmail.com", contact_phone: "773-486-8431", street_address: "3808 W. Iowa St.", city: "Chicago", state: "IL", zip_code: "60651", website: "http://www.missionola.com/", donation_page: "http://www.missionola.com/getInvolved_DonateOnline.html", password: "password")
char14.categories << cat7
# char14.wishlists.create!(original_link: "http://www.amazon.com/gp/registry/giftlist/3MMVX0C6BKXM5/ref=topnav_lists_1")
wishlist14 = Wishlist.create!(original_link: "http://www.amazon.com/gp/registry/giftlist/3MMVX0C6BKXM5/ref=topnav_lists_1")
char14.wishlists << wishlist14

char15 = Charity.create!(name: "World Bicycle Relief - Part of Aid for Africa", description: "Provides bicycles and trains mechanics to service them in Africa to improve healthcare delivery, help children attend school, and improve economic development. Builds independence and livelihoods.", street_address: "1000 West Fulton Market, 4th Floor", city: "Chicago", state: "IL", zip_code: "60607", twitter_handle: "PowerOfBicycles", website: "http://www.worldbicyclerelief.org/", donation_page: "http://salsa3.salsalabs.com/o/50574/p/salsa/web/common/public/content?content_item_KEY=10920&_ga=1.36107680.1816289872.1439476187", password: "password")
char15.categories << cat8
char16 = Charity.create!(name: "Avenues to Independence", description: "Avenues was founded in 1953 when a group of parents believed things should be different for their sons and daughters with developmental disabilities. They wanted them to be a part of the community, close to home, among family and friends. Remaining in the community wasn’t always easy, but it was what everyone wanted. And that has made all the difference. Today, thanks to their vision, Avenues is a non-profit organization that provides homes, jobs and community living programs to Chicago area adults with physical, intellectual, and other developmental disabilities, such as Down syndrome, autism, epilepsy and cerebral palsy. It is our goal to provide work and living opportunities enabling those with disabilities to be as independent as possible.", contact_email: "avenues@avenuestoindependence.org", contact_phone: "1-847-292-0870", street_address: "515 Busse Hwy.", city: "Park Ridge", state: "IL", zip_code: "60068", website: "http://www.avenuestoindependence.org/", donation_page: "http://www.avenuestoindependence.org/contribute/donate_now/", password: "password")
char16.categories << cat10
char17 = Charity.create!(name: "Angles for Sexual Health, Identity and Education", description: "Angles works with teens and young adults in the areas of sexual health, identity, and education. Through our reproductive health care clinic, health education programs, and programs for LGBT youth, we help our clients think things through from every angle, so they can find what's right for them. Confidential services are offered in a safe and caring environment.", contact_email: "lynne@angles.org", contact_phone: "847.441.6191", street_address: "1779 Maple Street", city: "Northfield", state: "IL", zip_code: "60093", twitter_handle: "angles1779", website: "http://angles.org/", donation_page: "http://angles.org/donors-volunteers/donate/", password: "password")
char17.categories << cat10
char18 = Charity.create!(name: "Association of Horizon, Inc.", description: "Association of Horizon, Inc. provides educational and recreational services for adults with physical disabilities. Our mission is an organization of people with and without physical disabilities that provide opportunities for individuals to challenge themselves, develop responsibility and Grove through interacting and working together. Our big event is a weeklong summer camp for adults with physical disabilities which is free of charge.", contact_name: "Michael Trimpe", contact_email: "Michael.Trimpe@associationofhorizon.org", contact_phone: "773-477-5170", street_address: "3712 North Broadway # 335", city: "Chicago", state: "IL", zip_code: "60613", twitter_handle: "HorizonCamp92", website: "http://associationofhorizon.org/wordpress/", donation_page: "http://associationofhorizon.org/wordpress/fundraising/donate-now", password: "password")
char18.categories << cat10
char19 = Charity.create!(name: "Maryville Crisis Nursery", description: "The Maryville Crisis Nursery provides short-term care for children of families who are experiencing a severe disruptive crisis and/or are challenged with an urgent family matter. Children ages newborn through six years are provided with round-the-clock child care, up to 72 hours a stay, in a safe and nurturing environment designed to protect them from experiences and environments that could harm them. Families may utilize the Maryville Crisis Nursery up to 30 days in a rolling calendar year. The Maryville Crisis Nursery provides families with immediate support, counseling, and referrals to community resources for extended services. The quality services provided to both the children and families in need are FREE. The Maryville Crisis Nursery is one of six crisis nurseries located in Illinois, and is the only Crisis Nursery located in the Chicago area.", street_address: "4015 N. Oak Park Ave. Bldg. B", city: "Chicago", state: "IL", zip_code: "60634", website: "http://www.maryvilleacademy.org/programs/maryville-family-support-services/maryville-crisis-nursery/", donation_page: "https://give.maryvilleacademy.org/donatenow", password: "password")
char19.categories << cat5
# char19.wishlists.create!(original_link: "http://www.amazon.com/gp/registry/wishlist/SOXLH624LZPH/ref=cm_sw_em_r_wsl_aScFsb01MP0T3_wb")
wishlist19 = Wishlist.create!(original_link: "http://www.amazon.com/gp/registry/wishlist/SOXLH624LZPH/ref=cm_sw_em_r_wsl_aScFsb01MP0T3_wb")
char19.wishlists << wishlist19
char20 = Charity.create!(name: "DuPagePads", description: "The solution to end homelessness is more complex than providing individuals with food and shelter. Founded in 1985, DuPagePads is the largest provider of interim and permanent housing, coupled with support services in order to help individuals work toward a place to call home – DuPage Pads vital support services enable the individuals we help to receive case management and life coaching, employment support such as GED courses and job coaching, as well as engagement with employers—effectively stopping the cycle of homelessness. DuPagePads IS the solution to end homelessness — because when someone believes in you, everything can change.", contact_phone: "630-682-3846", street_address: "601 West Liberty", city: "Wheaton", state: "IL", zip_code: "60187", twitter_handle: "DuPagePads", website: "http://dupagepads.org/", donation_page: "https://dupagepads.org/donate/", password: "password")
char20.categories << cat10
# char20.wishlists.create!(original_link: "http://www.amazon.com/registry/wishlist/GO30U47N1SN1/ref=cm_wl_sb_o?reveal=unpurchased&filter=all&sort=priority&layout=standard&x=12&y=7")
wishlist20 = Wishlist.create!(original_link: "http://www.amazon.com/registry/wishlist/GO30U47N1SN1/ref=cm_wl_sb_o?reveal=unpurchased&filter=all&sort=priority&layout=standard&x=12&y=7")
char20.wishlists << wishlist20

char21 = Charity.create!(name: "Shedd Aquarium", description: "Shedd Aquarium, a not-for-profit organization, is dedicated to connecting people to the living world and inspiring them to make a difference. You can directly support our work with a tax-deductible donation. There are so many ways to show your support: through individual gifts, corporate gifts, membership, the Aquarium Council premier donor society and our Auxiliary Board. More fundraising opportunities range our formal gala to our fun golf tournament, the adopt-an-animal program, our Amazon Wish List and Amazon Smile. Even going on a travel adventure with Shedd to wonderful wild places supports our work. Another way to donate to Shedd is through the gift of time. Our volunteer force provides invaluable assistance from sharing information with guests to cleaning the animals’ habitats. One-day volunteer opportunities through our Great Lakes Action Days further Shedd’s conservation mission in the aquarium’s, and Chicago’s, back yard. Explore the different ways you can support Shedd and be a part of all that we do! Contact our donor services for more information.", street_address: "1200 S Lake Shore Drive", city: "Chicago", state: "IL", zip_code: "60605", twitter_handle: "shedd_aquarium", website: "http://www.sheddaquarium.org/", donation_page: "http://www.sheddaquarium.org/Support-Us/Donate-Online/", password: "password")
char21.categories << cat1
# char21.wishlists.create!(original_link: "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_search_1?ie=UTF8&cid=A3LXNLQYNHOJUQ")
wishlist21 = Wishlist.create!(original_link: "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_search_1?ie=UTF8&cid=A3LXNLQYNHOJUQ")
char21.wishlists << wishlist21

char22 = Charity.create!(name: "Mission of Our Lady of The Angels", description: "The Mission of Our Lady of the Angels establishes a Catholic presence in the West Humboldt Park area on Chicago’s west side. This area is presently one of the poorest neighborhoods in the City of Chicago. The purpose of the Mission is twofold:  to assist the materially poor and to share the treasure of our Catholic Faith.", contact_email: "olamission@gmail.com", contact_phone: "773-486-8431", street_address: "3808 W Iowa Street", city: "Chicago", state: "IL", zip_code: "60651", website: "http://www.missionola.com/index.html", donation_page: "http://www.missionola.com/getInvolved_DonateOnline.html", password: "password")
char22.categories << cat10
# char22.wishlists.create!(original_link: "http://www.amazon.com/gp/registry/giftlist/3MMVX0C6BKXM5/ref=topnav_lists_1")
wishlist22 = Wishlist.create!(original_link: "http://www.amazon.com/gp/registry/giftlist/3MMVX0C6BKXM5/ref=topnav_lists_1")
char22.wishlists << wishlist22

char23 = Charity.create!(name: "Furever Rescue", description: "We are a group of women dedicated to helping animals who need rescue, medical care, rehabilitation, love, and of course a Furever home. We donate our time to help make a difference in the lives of animals in the Chicagoland area and sometimes out of state. Each animal is fully vetted, up to date on vaccinations, microchipped & treated both medically and behaviorally if needed. We know we cannot save them all but we sure are going to try. Know that we are committed to the ones that we take into our care. We are a 100% volunteer run, foster based organization. We rely on donations & volunteers to keep saving animals lives.", contact_phone: "773-414-1356", street_address: "1321 N Wood Street", city: "Chicago", state: "IL", zip_code: "60622", twitter_handle: "FureverRescue", donation_page: "https://secure.squarespace.com/commerce/donate?donatePageId=52fafd18e4b09514a100ba68", password: "password")
char23.categories << cat1
# char23.wishlists.create!(original_link: "http://www.amazon.com/gp/registry/wishlist/27E115AV21HET/ref=cm_wl_rlist_go_o?ie=UTF8&layout=grid")

wishlist23 = Wishlist.create!(original_link: "http://www.amazon.com/gp/registry/wishlist/27E115AV21HET/ref=cm_wl_rlist_go_o?ie=UTF8&layout=grid")
char23.wishlists << wishlist23

char24 = Charity.create!(name: "The Night Ministry", description: "The Night Ministry needs you. Since 1976, The Night Ministry has been making a difference in the lives of thousands of adults and youth in Chicago every year.  Your support helps us transform more lives by providing vital services like outreach services, youth shelter, health care, counseling, and referrals. Volunteers groups also help us serve over 80,000 meals every year to those in need. Any donation you can make helps us provide adults and youth who are at-risk or homeless with the programs and services they so desperately need.", contact_email: "Info@thenightministry.org", contact_phone: "773-784-9000", street_address: "4711 North Ravenswood Ave", city: "Chicago", state: "IL", zip_code: "60640", twitter_handle: "NightMinistry", website: "http://www.thenightministry.org/", donation_page: "http://www.thenightministry.org/003_donate/", password: "password")
char24.categories << cat10
char25 = Charity.create!(name: "Christopher House Elementary", description: "Christopher House provides a family of schools to help low-income children and their families succeed in school, the workplace, and life. We partner with families to provide a continuum of education for students birth through high-school as well as educational resources to help parents create and foster stable, self-sufficient families.", contact_email: "info@christopherhouse.org", contact_phone: "(773) 922-7544", street_address: "5235 W Belden Ave", city: "Chicago", state: "IL", zip_code: "60639", twitter_handle: "chousechicago", donation_page: "https://christopherhouse.org/donate-now/donate2015/", password: "password")
char25.categories << cat12
# char25.wishlists.create!(original_link: "http://www.amazon.com/registry/wishlist/YEWF981BT9SU/ref=cm_wl_search_3")
wishlist25 = Wishlist.create!(original_link: "http://www.amazon.com/registry/wishlist/YEWF981BT9SU/ref=cm_wl_search_3")
char25.wishlists << wishlist25



#Charities to category
# test_category = Category.find_by(name: "Animal Advocacy")
# test_category.charities << test_charity

# char1.categories << [category]

# test_charity.wishlists.create!(name: "Our Wishlist", link: "http://www.amazon.com/gp/registry/wishlist/ref=cm_wl_act_print_v?ie=UTF8&disableNav=1&filter=all&id=3AW1BUYSY69G5&items-per-page=200&layout=standard-print&sort=date-added&visitor-view=1", original_link: "http://www.amazon.com/gp/registry/wishlist/3AW1BUYSY69G5" )


# users_array = []
# 10.times do

#   us = User.create(username:Faker::Name.name,email:Faker::Internet.email, password:"password")


#   us.categories << cat.sample(2)
#   us.charities << char.sample(2)
#   users_array << us
# end

# char.each do |ch|
#   new_wishlist = Wishlist.create(name:"Our Wishlist")
#   ch.wishlists << new_wishlist
#   ch.categories << cat.sample(2)
#   10.times do
#     it = Item.create(name:Faker::Commerce.product_name, current_price:(rand(50) + 1))
#     it.users << users_array.sample
#     new_wishlist.items << it
#   end
# end


