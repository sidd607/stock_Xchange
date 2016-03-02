class PostsController < InheritedResources::Base

  private

    def post_params
      params.require(:post).permit(:name, :title, :content)
    end
end

