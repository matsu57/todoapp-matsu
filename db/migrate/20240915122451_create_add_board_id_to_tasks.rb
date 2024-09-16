class CreateAddBoardIdToTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :add_board_id_to_tasks do |t|
      add_reference :tasks, :board
      t.timestamps
    end
  end
end
