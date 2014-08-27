class AddTimeToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :start_date, :date
  end
end
