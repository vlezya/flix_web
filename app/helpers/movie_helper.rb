module MovieHelper
  def total_gross(movie)
    return 'Flop!' if movie.flop?
    number_to_currency(movie.total_gross, precision: 0)
  end
  
  def year_of(movie)
    movie.released_on&.year
  end
  
  def nav_link_to(text, url)
    if current_page?(url)
      link_to(text, url, class: "active")
    else
      link_to(text, url)
    end
  end
end