import { debounce, request } from 'helpers'

export default class extends ApplicationController {
  static targets = [ 'input', 'results' ]

  initialize() {
    this.performSearch = debounce(this.performSearch.bind(this), 300)
  }

  // Actions

  async performSearch({ target: { value } }) {
    if (value.length > 1) {
      this.abortController = new AbortController
      const { signal } = this.abortController

      try {
        this.resultsTarget.innerHTML = await request.get(this.buildSearchURL(value), { signal })
        this.resultsTarget.classList.remove('hidden')
      } catch (error) {
        if (error.name != 'AbortError') throw error
      }
    } else {
      this.resetSearch()
    }
  }

  // Private

  resetSearch() {
    console.log('reseet')
    this.abortPendingSearch()
    this.resultsTarget.innerHTML = ''
    this.resultsTarget.classList.add('hidden')
  }

  buildSearchURL(query) {
    const url = new URL(this.data.get('url'))
    url.searchParams.set('query', query)
    return url
  }

  abortPendingSearch() {
    this.abortController?.abort()
  }
}
