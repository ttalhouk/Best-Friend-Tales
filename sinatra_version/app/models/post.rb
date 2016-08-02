class Post < ActiveRecord::Base
  belongs_to :user
  has_many :images, as: :imageable
  has_many :comments

  validates :title, presence: true, length: {in: 3..75}
  validates :description, presence: true, length: {in: 5..150}
  validates :body, presence: true, length: {in: 100..5000}

  def sentiment
    if self.comments.any?
      sum_pos = 0.0
      sum_neg = 0.0
      sum_neutral = 0.0
      self.comments.each do |comment|
        sum_pos += comment.pos
        sum_neg += comment.neg
        sum_neutral += comment.neutral
      end
      avg_pos = (sum_pos/self.comments.size.to_f)
      avg_neg = (sum_neg/self.comments.size.to_f)
      avg_neutral = (sum_neutral/self.comments.size.to_f)
      averages = [avg_pos, avg_neg, avg_neutral]
      if averages.max == avg_pos
        "Positive"
      elsif averages.max == avg_neg
        "Negative"
      elsif averages.max == avg_neutral
        "Neutral"
      else
        "N/A"
      end
    else
      "N/A"
    end
  end
end
