const openModal = () => {
  const disponivelTags = document.querySelectorAll('.slot-info')
  const modalTag = document.querySelector('.modal-inner')
  disponivelTags.forEach((disponivel) => {
    disponivel.addEventListener('click', () => {
      modalTag.classList.add('modal-on')
    })
  })
}

export { openModal }
