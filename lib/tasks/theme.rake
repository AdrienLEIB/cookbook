namespace :theme do
  desc "Ceci est un test"
  task test: :environment do
  	puts 'la tache commence'
  	TestJob.perform_later
  	puts 'la tache est finis'
  end

end
