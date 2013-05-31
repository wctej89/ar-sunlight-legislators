

class CreatePoliticians < ActiveRecord::Migration
  def change
     create_table :politicians do |t|
      t.string :title
      t.string :firstname
      # t.string :middlename
      t.string :lastname
      # t.string :name_suffix
      # t.string :nickname
      t.string :party
      t.string :state
      # t.integer :district
      t.integer :in_office
      t.string :gender
      t.string :phone
      t.string :fax
      t.string :website
      t.string :birthdate
      t.string :twitter_id
      # t.string :facebook_id
    end
  end
end