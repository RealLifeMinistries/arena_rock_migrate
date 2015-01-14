class CreateArenaProfileMembers < ActiveRecord::Migration
  def up
    unless ActiveRecord::Base.connection.tables.include? 'arena_profile_members'
      execute <<-EOS
        CREATE TABLE arena_profile_members (
          profile_id integer NOT NULL,
          person_id integer NOT NULL,
          date_created timestamp without time zone  NOT NULL,
          date_modified timestamp without time zone NOT NULL,
          created_by character varying NOT NULL,
          modified_by character varying NOT NULL,
          source_luid integer,
          status_luid integer,
          notes character varying NOT NULL,
          date_pending timestamp without time zone,
          date_active timestamp without time zone,
          date_dormant timestamp without time zone,
          PRIMARY KEY(profile_id,person_id)
        )
      EOS
    end
  end
end
