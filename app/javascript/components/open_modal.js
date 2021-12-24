const openModal = () => {
  const slotTags = document.querySelectorAll('.slot-info')
  const modalTag = document.querySelector('.modal-inner')
  const closeTag = document.querySelector('.close-btn')
  const tableTag = document.querySelector('.to-blur')
  const weekTag = document.querySelector('.week-menu')

  slotTags.forEach((slot) => {
    slot.addEventListener('click', () => {
      closeTag.classList.add('modal-on')
      modalTag.classList.add('modal-on')
      tableTag.classList.add('blur')
      weekTag.classList.add('opacity')
    })
  })

    closeTag.addEventListener('click', () => {
      closeTag.classList.remove('modal-on')
      modalTag.classList.remove('modal-on')
      tableTag.classList.remove('blur')
      weekTag.classList.remove('opacity')
    })

}

export { openModal }
