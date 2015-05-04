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

  def posts
		@posts = Post.all
  end
end
