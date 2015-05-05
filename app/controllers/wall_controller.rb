class WallController < ApplicationController
  def write
		 
 end

	def write_process
		p = Post.new
    p.writer = params[:writer]
    p.content = params[:content]
    if p.save
      redirect_to "/wall/posts"
    else
      flash[:alert] = p.errors[:content][0]
      redirect_to :back
    end	
	end

	def edit
    @post = Post.find(params[:id])
  end

	def edit_process
    p = Post.find(params[:id])
    p.writer = params[:writer]
    p.content = params[:content]
    if p.save
      redirect_to "/wall/posts"
    else
      flash[:alert] = p.errors[:content][0]
      redirect_to :back
    end
  end

	def delete
    @post = Post.find(params[:id])
  end

  def delete_process
    p = Post.find(params[:id])
    p.destroy

    redirect_to "/wall/posts"
  end

	def comment
    @post = Post.find(params[:id])
  end

	def comment_process
		c = Comment.new
		c.post_id = params[:post_id]
		c.writer = params[:writer]
		c.content = params[:content]
		c.save

		redirect_to "/wall/posts"
	end
	
  def posts
		@posts = Post.all
  end
end
