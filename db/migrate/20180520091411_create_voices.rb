class CreateVoices < ActiveRecord::Migration[5.1]
  def change
    create_table :voices do |t|
      t.integer :score_id
      t.binary :data

      t.timestamps
    end
  end
end
