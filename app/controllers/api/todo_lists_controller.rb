module Api
  class TodoListsController < ApplicationController

    # GET /api/todolists
    def index
      @todo_lists = TodoList.all

      render json: @todo_lists
    end

    # GET /api/todolists/:id
    def show
      @todo_list = TodoList.find(params[:id])
     
      render json: @todo_list
    end

    # GET /api/todolists/new
    def new
      @todo_list = TodoList.new

      render json: @todo_list
    end

    # POST /api/todolists
    def create
      @todo_list = TodoList.new(todo_list_params)

      if @todo_list.save
        render json: @todo_list, status: :created
      else
        render json: @todo_list.errors, status: :unprocessable_entity
      end
    end

    # GET api/todolists/:id/edit
    def edit
      @todo_list = TodoList.find(params[:id])

      render json: @todo_list
    end

    # PATCH api/todolists/:id
    def update
      @todo_list = TodoList.find(params[:id])

      if @todo_list.update(todo_list_params)
        render json: @todo_list, status: :created
      else
        render json: @todo_list.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/todolists/:id
    def destroy
      @todo_list = TodoList.find(params[:id])

      @todo_list.destroy
    end

    private
    
    # Strong params
      def todo_list_params
        params.require(:todo_list).permit(:name)
      end
  end
end
