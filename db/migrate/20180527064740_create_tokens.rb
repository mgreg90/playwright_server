class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.references :user, foreign_key: true
      t.string :value
      t.date :expiration

      t.timestamps
    end
  end
end
