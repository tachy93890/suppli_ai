# app/services/ai_recommender.rb
class AiRecommender
  def initialize(user)
    @user = user
  end

  # Returns an array of recommended Product records for the user
  def recommended_products(limit: 5)
    # Placeholder logic: for now, recommend recent active products not belonging to the user
    # In a real scenario, this could call an AI API or use machine learning model predictions.
    Product.active.where.not(user_id: @user.id).order("RANDOM()").limit(limit)
  end
end
