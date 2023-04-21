# Run import job every day at 2am
# I believe that 2am is a good time to run because of the low volume of requests

every :day, at: '2:00am' do
  rake "launchers:import_data"
end
