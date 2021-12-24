const openModal = () => {
  const disponivelTags = document.querySelectorAll('.disponivel')
  const modalTag = document.querySelector('#modal-inner')
  disponivelTags.forEach((disponivel) => {
    disponivel.addEventListener('click', () => {
      modalTag.classList.add('fixed-modal')
    })
  })
}

export { openModal }
