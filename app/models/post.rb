class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  validate :clickbait

  CLICKABLE = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def clickbait
    if CLICKABLE.none?{ |search| search.match title}
      errors.add(:title, "this is not clickbait")
    end
  end 
end

