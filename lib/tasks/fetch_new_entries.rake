desc "Periodically update the database by fetching new entries"
task :fetch_new_entries => :environment do
  puts "Fetching new entries"
    # peter = FetchNewEntriesWorker.new
    # peter.perform
    Blog.fetch_newest_entries_for_all_blogs
  puts "done."
end