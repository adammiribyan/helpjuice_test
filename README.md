# README
Demo on Heroku: https://helpjuice-test-project.herokuapp.com/

## Setup
Run `rails db:seed` to pre-populate the articles.

## ToDo
- [ ] Add pagination for `search/analytics#show` for better UI and performance.
- [ ] Initiate the `Search::QueryRecordingJob` only **after** the user clicks on a search result item, or leaves the search field. This way the `Search::Query` status could be utilized for `abandoned` or `engaged` searches.
- [ ] Add an integration for the whole use flow of searching an article and the underlying analytics data being recorded.
- [ ] Better mobile UI.
- [ ] Track consequitive searches.
