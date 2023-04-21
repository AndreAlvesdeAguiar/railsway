class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.string :key
      t.date :expiration

      t.timestamps
    end
  end
end
