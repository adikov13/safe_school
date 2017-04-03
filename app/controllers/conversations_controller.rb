class ConversationsController < ApplicationController

	def index
		@conversations = Conversation.all
	end

	def show
		@conversation = Conversation.find(params[:id])
		@message = @conversation.messages
		@m = Message.new(conversation_id: @conversation.id, teacher_id: current_user.id)
	end

	def new
	end

	def edit
	end

	def create
		params[:parent_id] = params[:conversation][:parent_id]
		@conversation = Conversation.new(teacher_id: current_user.teacher.id, parent_id: params[:parent_id])
		if @conversation.save!
			redirect_to message_path(@conversation)
		else
			flash[:error] = "Something went wrong"
		end
	end

	def update
	end

	def destroy
	end

	private


end
