module Goodreads
  module Users
    # Get user details
    #
    def user(id)
      request("/user/show", id: id)["user"]
    end
  end
end
