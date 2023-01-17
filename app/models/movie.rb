class Movie < ApplicationRecord
  RATINGS = %w(G PG PG-13 R NC-17)
  
  validates :title, :released_on, :duration, presence: true
  validates :description, length: { minimum: 25 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }
  validates :image_file_name, format: {
    with: /\w+\.(jpg|png)\z/i,
    message: "must be a JPG or PNG image"
  }
  validates :rating, inclusion: { in: RATINGS }
  
  def self.release
    where('released_on < ?', Time.now).order('released_on desc') # or .order(released_on: :desc)
  end
  
  def self.hits
    where("total_gross >= 300000000").order(total_gross: :desc)
  end
  
  def self.flops
    where("total_gross < 22500000").order(total_gross: :asc)
  end
  
  def self.recently_added
    order("created_at desc").limit(3)
  end
  
  def flop?
    total_gross.blank? || total_gross < 255_000_000
  end
  
end
