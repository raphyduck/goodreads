module Goodreads
  module Groups
    # Get group details
    def group(group_id)
      data = request("/group/show", id: group_id)
      data["group"]
    end

    # Get list of groups a given user is a member of
    def group_list(user_id, sort = "my_activity")
      data = request("/group/list", id: user_id, sort: sort)
      data["groups"]["list"]
    end
  end
end
