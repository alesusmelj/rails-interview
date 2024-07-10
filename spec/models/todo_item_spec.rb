require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  
  describe '#save' do

    context 'when name is null' do
      it 'should not save' do
        expect(TodoItem.new(name: nil).save).to be false
      end
    end

    context 'when todo list does not exists' do
      it 'should raise an error' do
        expect(TodoItem.new(name: 'Todo item', todo_list_id: -1).save).to be false
      end
    end

    context 'when all information was given' do
      it 'creates the todo item' do
        todo_list = TodoList.new(name: 'Todo_list_test')
        todo_list.save

        expect(TodoItem.new(name: 'Todo item', todo_list_id: todo_list.id).save).to be true
      end
    end
  end

  describe '#destroy' do

    context 'when todo item id was given' do
      it 'should destroy the todo item' do
        todo_list = TodoList.new(name: 'Todo_list_test')
        todo_list.save

        todo_item = TodoItem.new(name: 'Todo item', todo_list_id: todo_list.id)
        todo_item.save

        expect(TodoItem.destroy(todo_item.id)).to be_truthy
      end
    end
  end
end
