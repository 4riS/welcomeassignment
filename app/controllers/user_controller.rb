class UserController < ApplicationController
    def users
        @users = User.all
        render template: "pages/users_all"
    end

    def userposts
        user = User.find(params[:id])
        uid = user.uid
        @userAllPosts = Post.where(uid: uid).find_all
        render template: "pages/users_posts"
    end
end