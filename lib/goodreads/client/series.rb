module GoodReads
  module Series
    # Get book details by Goodreads book ID
    #
    def series(id)
      request("/series/show", id: id)['series']
    end
  end
end