class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.references :user
      t.references :project
      t.enum :role
      
      t.timestamps
    end
  end
end
