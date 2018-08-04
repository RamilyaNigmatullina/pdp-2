class CreateUserAuthentications < ActiveRecord::Migration[5.1]
  def change
    create_table :user_authentications do |t|
      t.references :user, index: true, foreign_key: true
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps
    end

    add_index(:user_authentications, %i[provider uid], unique: true)
  end
end
