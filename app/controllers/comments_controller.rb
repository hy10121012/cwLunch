class CommentsController < ApplicationController
  skip_before_filter :authorize, only:[:register]
  protect_from_forgery :except => :create
  layout "solo_chatroom", only:[:chat_room_solo]

  def chat_room()
    @comment = Comment.new
    @comments = Comment.order('created_at ASC')

  end

  def chat_room_solo()
    @comment = Comment.new
    @comments = Comment.order('created_at ASC')
    render action: "chat_room"
  end

  def register()
    session[:user_id]=params[:id]
    redirect_to('/chatroom_solo')
  end

  def create
    respond_to do |format|
      current_user = User.find(session[:user_id])
      if current_user
        @comment = current_user.comments.build(comment_params)
        if @comment.save
          flash.now[:success] = 'Your comment was successfully posted!'
        else
          flash.now[:error] = 'Your comment cannot be saved.'
        end
        format.html {redirect_to root_url}
        format.js
      else
        format.html {redirect_to root_url}
        format.js {render nothing: true}
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
