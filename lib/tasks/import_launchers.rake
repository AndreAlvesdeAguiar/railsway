namespace :launchers do
  desc "Routine to import launchers data"
  task import_data: :environment do
    ImportLaunchersDataRoutine.new.run
  end

  task import: [ :import_data ]
end
