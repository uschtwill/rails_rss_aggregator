class FetchNewEntriesWorker
  def perform
    Blog.fetch_newest_entries_for_all_blogs
  end
end