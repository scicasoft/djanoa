class DjanoaMigration < ActiveRecord::Migration
  def change
    create_table :djanoa_messages do |t|
      t.string  :from
      t.string  :to
      t.string  :message

      t.timestamps
    end
  end
end