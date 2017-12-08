module Goodreads
  module Shelves
    # Get books from a user's shelf
    def shelf(user_id, shelf_name, options = {})
      options = options.merge(shelf: shelf_name, v: 2)
      data = request("/review/list/#{user_id}.xml", options)
      reviews = data["reviews"]["review"]

      books = []
      unless reviews.nil?
        # one-book results come back as a single hash
        books = [reviews] unless reviews.instance_of?(Array)
      end

      {
        start: data["reviews"]["start"].to_i,
        end: data["reviews"]["end"].to_i,
        total: data["reviews"]["total"].to_i,
        books: books
      }
    end
  end
end
