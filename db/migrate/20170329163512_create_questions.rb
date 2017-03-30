#the migration file gives instructions to rails to change the structure of
#the database. by structure we mean things like: tables(creating/deleting),
#indexes, constraints, etc..
#note that the migration itself is not the database, rather an instruction set
#to change the database. it will execute a query once you run:
#rails db:migrate
#or
#rails db:rollback


class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    #`create_table` will create a table when you run `rails db:migrate`
    #every created table will have a primary key called `id`
    #integer autoincrement
    create_table :questions do |t|
      t.string :title
      t.text :body
      #this will create two datetime fields `created_at` and `updated_at`
      #ActiveRecord will automatically set those fields for you when you create
      #a record or update a record
      t.timestamps
    end
  end
end

#you can use rails db:rollback to revert a migration. Rails will automatically
#guess what reverting migration the migration is. For example if you did create
#table, Rails will do `drop_table`. if you did `add_column`, rails will do
#`remove_column`.
#note that rollback is likely going to be a destructive command, so if you drop
# a table, all the data in the table will be gone.
# you should only use rollback if you discovered the error right away. you
#shouldn't use rollback if you already pushed to production or if you share
# your code with other devs on git. instead you can create another migration
#that fixes the mistake you made in the previous migration.
