class CreateJoke < ActiveRecord::Migration[5.2]
  def change
    create_table :jokes do |t|
      t.string :jokes
      t.string :joke_type
      t.timestamp :date
    end
  end
end
