class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :avatar, default: 'https://d22r54gnmuhwmk.cloudfront.net/rendr-fe/img/default-user-avatar-dc6f2da9.gif'
      t.string :quirk
      t.string :tweet_size_advice

      t.timestamps
    end
  end
end
