import tippy, {createSingleton} from 'tippy.js';
// import 'tippy.js/themes/light';
// import 'tippy.js/themes/light-border';

const sidebarTemplate = document.getElementById('tippyTemplateSidebar');
const tippyInstances = tippy('.tippy-instance');
const singleton = createSingleton(tippyInstances, {
  delay: [0, 500],
  duration: [400, 250],
  animation: 'shift-away',
  inertia: true,
  moveTransition: 'transform 0.2s ease-out',
});

const sidebarButton = tippy('#tippy-sidebar-new', {
  theme: 'light',
  content: sidebarTemplate.innerHTML,
  animation: 'shift-away',
  allowHTML: true,
  interactive: true,
  interactiveBorder: 20,
  inertia: true,
  delay: [0, 400]
});

tippy.setDefaultProps(
  {delay: [25, 25]},
  {duration: [400, 250]},
  {zIndex: 1060},
  {animation: 'shift-away'},
);

tippy([singleton, sidebarButton], {
});