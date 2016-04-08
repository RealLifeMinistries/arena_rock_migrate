# module ActiveRecord
#   module ConnectionAdapters
#     class SQLServerAdapter < AbstractAdapter
#       SUPPORTED_VERSIONS << 2014
#       # === SQLServer Specific (DB Reflection) ======================== #
#
#       def sqlserver_2014?
#         @database_year = 2014
#       end
#     end
#   end
# end

# SEE https://github.com/rails-sqlserver/activerecord-sqlserver-adapter/issues/381
ActiveRecord::ConnectionAdapters::SQLServerAdapter.use_output_inserted = false
