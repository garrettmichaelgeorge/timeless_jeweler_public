import initTippy from './tippy'
import initSelect2 from './select2'
import initIntakeFormComponent from './intakeFormComponent'

export default function initApplication () {
  console.log('Document loaded!')
  initTippy()
  // initSelect2()
  initIntakeFormComponent()
}
