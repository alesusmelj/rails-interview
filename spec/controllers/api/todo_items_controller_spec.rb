require 'rails_helper'

describe Api::TodoItemsController do

  describe 'PATCH #complete' do
  
    context 'when id is ok' do
      it 'updates the completed attribute to true' do

        todo_list = TodoList.new(name: 'todo_list_test')
        todo_list.save

        todo_item = TodoItem.new(name: 'todo_item_test', todo_list_id: todo_list.id)
        todo_item.save

        patch :complete, params: { todo_list_id: todo_list.id, id: todo_item.id }, format: :json

        expect(response.status).to eq(200)
      end
    end
  end
end
