import tippy from "tippy.js";

const sidebarTemplate = document.getElementById('tippy-template-sidebar')

tippy.setDefaultProps(
  {delay: [50, 50]},
  {zIndex: 9999},
)

tippy('[data-tippy-content]');

tippy('#tippy-sidebar-new', {
  content: sidebarTemplate.innerHTML,
  animation: 'shift-away',
  allowHTML: true,
  interactive: true,
  inertia: true,
  arrow: true,
});
