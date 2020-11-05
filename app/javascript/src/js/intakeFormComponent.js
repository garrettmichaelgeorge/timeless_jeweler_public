import { show, hide } from './helpers/DOMHelpers'

export default function initIntakeFormComponent() {
  const form = document.querySelector('form#new_product')
  const productCategorySelectors = form.querySelectorAll('input[name="product[category]"]')
  const currentCategoryEl = form.querySelector('#currentCategory')
  const jewelryFieldset = form.querySelector('#jewelry_product_fields')
  const gemstoneFieldset = form.querySelector('#gemstone_product_fields')
  const miscellaneousFieldset = form.querySelector('#miscellaneous_product_fields')

  const fieldsets = {
    jewelry: jewelryFieldset,
    gemstone: gemstoneFieldset,
    miscellaneous: miscellaneousFieldset
  }

  const state = {
    currentCategory: ''
  }

  productCategorySelectors.forEach(sel => {
    sel.addEventListener('click', e => handleChange(e))
  })

  render()

  function render() {
    Object.values(fieldsets).forEach(fieldset => hide(fieldset))
    show(fieldsets[state.currentCategory])
  }

  function handleChange(e) {
    state.currentCategory = e.target.value.toLowerCase()
    render()
  }

  function renderFieldsFor(productCategory) {
    console.log(`Rendering fields for ${productCategory}`)
    switch(productCategory) {
      case 'JEWELRY':
        const jewelryProductFieldset = form.querySelector('#jewelry_product_fields')
        jewelryProductFieldset.classList.remove('d-none')
        break;
      default:
        return
    }
  }

  function fieldsetFor(currentCategory) {
    return form.querySelector(`#${currentCategory}_product_fields`)
  }
}

