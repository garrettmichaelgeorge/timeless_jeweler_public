import tippy, { createSingleton } from 'tippy.js'
import 'tippy.js/themes/light'

export default function initTippy() {
  tippy.setDefaultProps(
    {delay: [25, 25]},
    {duration: [400, 250]},
    {zIndex: 1060},
    {animation: 'shift-away'},
  )
  // Generic singleton tooltip
  const tippyInstances = tippy('.tippy-instance')
  createSingleton(tippyInstances, {
    delay: [0, 500],
    duration: [400, 250],
    animation: 'shift-away',
    inertia: true,
    moveTransition: 'transform 0.2s ease-out',
  })

  // Sidebar button "+" popover
  const sidebarTemplate = document.getElementById('tippyTemplateSidebar')
  tippy('#tippy-sidebar-new', {
    theme: 'light',
    content: sidebarTemplate.innerHTML,
    animation: 'shift-away',
    allowHTML: true,
    interactive: true,
    interactiveBorder: 20,
    inertia: true,
    delay: [0, 400]
  })
}
