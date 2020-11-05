function show (el) {
  if(!el) return
  el.classList.remove('d-none')
}

function hide (el) {
  if(!el) return
  el.classList.add('d-none')
}

export {
  show,
  hide
}
