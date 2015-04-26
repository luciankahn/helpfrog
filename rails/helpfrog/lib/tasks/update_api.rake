desc "Populate the database with updated data from api calls by running db/update_apis.rb"
  task :update_api do
    require APP_ROOT.join('db', 'update_apis.rb')
end
