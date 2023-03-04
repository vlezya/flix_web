module FavoritesHelper
  def fave_or_unfave_button(movie, favorite)
    if favorite
      button_to('♥️ Unfavorites', movie_favorite_path(movie, favorite), method: :delete)
    else
      button_to('♥️ Favorites', movie_favorites_path(movie))
    end
  end
end
