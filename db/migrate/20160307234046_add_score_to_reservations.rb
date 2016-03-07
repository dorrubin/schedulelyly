class AddScoreToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :score, :integer
  end
end
