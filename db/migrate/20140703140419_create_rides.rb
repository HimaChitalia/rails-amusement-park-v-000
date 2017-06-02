class CreateRides < ActiveRecord::Migration
  # Write your migrations here
  def change
    create_table :rides do |t|
      t.references :attraction, index:true, foreign_key:true
      t.references :user, index:true, foreign_key:true

      t.timestamps
    end
  end
end
