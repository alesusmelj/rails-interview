module Api
    class TodoItemsController < ApplicationController

        def create

           @todo_list = TodoList.find(params[:todo_list_id])

            puts params
        end
    end
end