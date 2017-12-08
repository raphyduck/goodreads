module Goodreads
  module Reviews
    # Recent reviews from all members.
    #
    # params[:skip_cropped] - Select only non-cropped reviews
    #
    def recent_reviews(params = {})
      skip_cropped = params.delete(:skip_cropped) || false
      data = request("/review/recent_reviews", params)
      return unless data["reviews"] && data["reviews"].key?("review")
      reviews = data["reviews"]["review"]
      reviews = reviews.select { |r| !r.body.include?(r.url) } if skip_cropped
      reviews
    end

    # Get review details
    #
    def review(id)
      request("/review/show", id: id)["review"]
    end

    # Get list of reviews
    #
    def reviews(params = {})
      data = request("/review/list", params.merge(v: "2"))
      reviews = data["reviews"]["review"]
      if reviews.present?
        reviews
      else
        []
      end
    end
  end
end
