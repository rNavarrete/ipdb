class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :podcasts, :Name, :name
  	rename_column :podcasts, :Episodes, :episodes
  end
end
