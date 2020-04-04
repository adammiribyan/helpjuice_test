import { request } from 'helpers'

export default class extends ApplicationController {
  initialize() {
    this.element.addEventListener('click', () => {
      request.get(this.data.get('url')).then((response) => {
        this.element.insertAdjacentHTML('afterend', response)
      })
    })
  }
}
