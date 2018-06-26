document.addEventListener("DOMContentLoaded", function() {
  const closable = document.querySelectorAll('[data-closable]')

  for (let i = 0; i < closable.length; i++) {
    const self = closable[i]

    self.querySelector('.close-button')
      .addEventListener('click', function () {
        self.remove()
      })
  }
})
