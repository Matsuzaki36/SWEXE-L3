class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :message
      t.datetime :tdate
      t.binary :image

      t.timestamps
    end
  end
end
