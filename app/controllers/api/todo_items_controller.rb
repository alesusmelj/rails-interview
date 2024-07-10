module Api
    class TodoItemsController < ApplicationController
        before_action :set_todo_list

        # POST api/todolists/:todo_list_id/todo_items
        def create
            @todo_item = TodoItem.new(todo_item_params)
            @todo_list.todo_items.push(@todo_item)

            if @todo_item.save 
                render json: @todo_item, status: :created
            else
                render json: @todo_item.errors, status: :unprocessable_entity
            end
        end

        # PATCH /api/todolists/:todo_list_id/todo_items/:id
        def update
            @todo_item = @todo_list.todo_items.find(params[:id])

            if @todo_item.update(todo_item_params)
                render json: @todo_item, status: :ok
            else
                render json: @todo_item.errors, status: :unprocessable_entity
            end
        end

        # PATCH /api/todolists/:todo_list_id/todo_items/:id/complete
        def complete        
            @todo_item = @todo_list.todo_items.find(params[:id])

            if @todo_item.update(completed: true)
                render json: @todo_item, status: :ok
            else
                render json: @todo_item.errors, status: :unprocessable_entity
            end
        end

        private

        # Strong params
        def todo_item_params
            params.require(:todo_item).permit(:name)
        end

        # Set todo list through the ID sent by params
        def set_todo_list
            @todo_list = TodoList.find(params[:todo_list_id])
        end
    end
end