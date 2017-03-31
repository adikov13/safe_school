class MessagesController < ApplicationController
	before_action :set_params, only: [:show, :edit, :update, :destroy]

	def index
		@messages = Message.all
	end

	def show
		@message = Message.find(params[:id])
	end

	def new
		@message = Message.new()
	end

	def edit
	end

	def create
		@message = Message.new(message_params)
		unless @message.save!
			flash[:error] = "Message hasn't been delivered"
		else
			redirect_to message_path(@message.conversation)
		end
	end

	def update
	end

	private

	def set_params
		@message = Message.find(params[:id])
	end

	def message_params
		params.require(:message).permit(:title, :body, :conversation_id, :teacher_id, :read)
	end
end
