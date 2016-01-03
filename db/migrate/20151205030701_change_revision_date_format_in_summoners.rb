class ChangeRevisionDateFormatInSummoners < ActiveRecord::Migration
  def change
      change_column :summoners, :revisionDate, :integer, limit: 8
  end
end
