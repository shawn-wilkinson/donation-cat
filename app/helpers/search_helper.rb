module SearchHelper

  def find_charity(query_string)
    Charity.find_by(name: query_string)
  end

  def perform_charity_name_search(term)
    Charity.where('downcase_name like ?', "%#{term}%").order(:name)
  end

  def perform_category_name_search(term)
    Category.where('downcase_name like ?', "%#{term}%").order(:name)
  end

  def search_charity_names(search_terms)
    results = []
    search_terms.each do |term|
      results << perform_charity_name_search(term)
    end
    results.flatten.uniq
  end

  def search_charity_categories(search_terms)
    results = []
    search_terms.each do |term|
      results << perform_category_name_search(term)
    end
    results.flatten.uniq
  end

  def define_search_terms(query_string)
    query_string.downcase.split(' ')
  end

end
