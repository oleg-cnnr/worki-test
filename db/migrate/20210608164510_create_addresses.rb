class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :uri, null: false
      t.string :state
      t.string :result
      t.string :code
      t.string :task_id

      t.timestamps
    end
  end
end
