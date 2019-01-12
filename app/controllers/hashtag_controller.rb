class HashtagController < ApplicationController
    def hashtags
        @hashtags = Hashtag.all.distinct
        @hashtags_count = Hashtag.group(:name).count(:post_id)
        render template: "pages/hashtags_all"
    end

    def hashtagposts
        @hashtag_posts = Array.new
        @hashtag = Hashtag.select(:post_id).where(name: params[:name]).find_all
        @hashtag.each do |h|
            @hashtag_posts.push(Post.find(h.post_id))
        end
        render template: "pages/hashtags_posts"
    end
end