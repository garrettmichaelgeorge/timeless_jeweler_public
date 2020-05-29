import tippy from "tippy.js";
import 'tippy.js/animations/scale.css'

const template = document.getElementById('tippy-template-sidebar')

tippy.setDefaultProps(
  {delay: [50, 50]},
)

tippy('#tippy-sidebar-new', {
  content: template.innerHTML,
  animation: 'scale',
  allowHTML: true,
  interactive: true,
  inertia: true,
  arrow: true,
});

