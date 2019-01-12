class PostController < ApplicationController
    def new
        @post = Post.new
    end

    def create
        @post = Post.create! params.require(:post).permit(:title, :body, :hashtags)
        @post.uid = current_user.uid
        @post.save
        hst = params[:post][:hashtags].gsub(/\s+/, "").split(/\#/)
        hst.each do |x| 
            if x != ''
                sh = Hashtag.new(:name => x, :post_id => @post.id)
                sh.save
            end  
        end
        #render plain: params[:post].inspect
        @post.image.attach(params[:post][:image])
        redirect_to @post
    end

    def show
        @post = Post.find(params[:id])
    end

    def destroy
        Hashtag.where(post_id: params[:id]).delete_all
        Post.destroy(params[:id])
        redirect_to root_path
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update_attributes(params.require(:post).permit(:title, :body, :hashtags))
          # Handle a successful update.
          redirect_to @post
        else
          render 'edit'
        end
      end
end