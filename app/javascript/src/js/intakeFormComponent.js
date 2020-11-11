import { show, hide, hideAll } from './helpers/DOMHelpers'

export default function initIntakeFormComponent() {
  const form = document.querySelector('form#new_product')
  const productCategorySelectors = form.querySelectorAll('[name="product[category]"]')
  const currentCategoryEl = form.querySelector('#currentCategory')
  const jewelryFieldset = form.querySelector('#jewelry_product_fields')
  const gemstoneFieldset = form.querySelector('#gemstone_product_fields')
  const miscellaneousFieldset = form.querySelector('#miscellaneous_product_fields')
  const addFieldsBtns = form.querySelectorAll('.add_fields')

  const fieldsets = {
    jewelry: jewelryFieldset,
    gemstone: gemstoneFieldset,
    miscellaneous: miscellaneousFieldset
  }

  const state = {
    currentCategory: ''
  }

  // Add event listeners
  productCategorySelectors.forEach(sel => {
    sel.addEventListener('click', e => handleChange(e))
  })

  addFieldsBtns.forEach(btn => {
    btn.addEventListener('click', e => handleClick(e))
  })

  render()

  // Render method
  function render() {
    hideAll(getFieldsets())
    show(fieldsets[state.currentCategory])
  }

  // Event handlers
  function handleChange(e) {
    state.currentCategory = e.target.value.toLowerCase()
    render()
  }

  function handleClick(e) {
    e.preventDefault()

    const thisEl = e.target
    const fields = fieldsFrom(thisEl)
    thisEl.insertAdjacentHTML('afterend', fields)
  }

  // Queries
  function fieldsetFor(currentCategory) {
    return form.querySelector(`#${currentCategory}_product_fields`)
  }

  function getFieldsets() {
    return Object.values(fieldsets)
  }

  function fieldsFrom(thisEl) {
    const time = new Date().getTime()
    const regExp = new RegExp(thisEl.dataset.id, 'g')
    return thisEl.dataset.fields.replace(regExp, time)
  }
}
