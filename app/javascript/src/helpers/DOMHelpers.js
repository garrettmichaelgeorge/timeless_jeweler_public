function show (el) {
  if(!el) return
  el.classList.remove('d-none')
}

function hide (el) {
  if(!el) return
  el.classList.add('d-none')
}

function hideAll (els) {
  if(!els) return
  els.forEach(el => hide(el))
}

export {
  show,
  hide,
  hideAll
}
