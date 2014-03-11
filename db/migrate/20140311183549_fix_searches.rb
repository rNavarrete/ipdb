class FixSearches < ActiveRecord::Migration
 def up
  	ActiveRecord::Base.connection.execute <<-SQL
  		CREATE VIEW podcast_searches AS

			SELECT podcasts.id AS searchable_id, 
			'Podcast' AS searchable_type, 
			podcasts.name AS term
			FROM podcasts

			UNION 

			SELECT podcasts.id AS searchable_id, 
			'Podcast' AS searchable_type, 
			podcasts.description AS term
			FROM podcasts

	SQL
  end

def down
	ActiveRecord::Base.connection.execute <<-SQL
  	DROP VIEW podcast_searches;
  	SQL
end
end
