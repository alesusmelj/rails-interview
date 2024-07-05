module Api
  class TodoListsController < ApplicationController
    # GET /api/todolists
    def index
      @todo_lists = TodoList.all

      respond_to :json
    end

    def show
      @todo_list = TodoList.find(params[:id])
     
      render json: @todo_list
    end
  end
end
