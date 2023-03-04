module ReviewsHelper
  def average_stars(movie)
    if movie.average_stars.zero?
      content_tag('span', 'No reviews')
    else
      '*' * movie.average_stars.round
    end
  end
end
