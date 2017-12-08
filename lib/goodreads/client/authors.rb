module Goodreads
  module Authors
    # Get author details
    #
    def author(id, params = {})
      params[:id] = id
      data = request("/author/show", params)
      data["author"]
    end

    # Search for an author by name
    #
    def author_by_name(name, params = {})
      params[:id] = name
      name_encoded = URI.encode(name)
      data = request("/api/author_url/#{name_encoded}", params)
      data["author"]
    end
  end
end
