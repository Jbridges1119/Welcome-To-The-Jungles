class CreateFirsts < ActiveRecord::Migration[6.1]
  def change
    create_table :firsts do |t|
      t.string :last
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
