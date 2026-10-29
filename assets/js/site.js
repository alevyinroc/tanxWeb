// Small enhancements. The site still works if this file doesn't load.

// Tabs: turns each `.tabs` block's `.tab-panel` children (each with a
// data-title attribute) into a tab bar like the original Team Information page.
document.querySelectorAll('.tabs').forEach(function (tabs) {
  var panels = Array.prototype.slice.call(tabs.querySelectorAll(':scope > .tab-panel'));
  if (!panels.length) return;

  var bar = document.createElement('div');
  bar.className = 'tabs-bar';
  bar.setAttribute('role', 'tablist');

  var buttons = panels.map(function (panel, i) {
    var id = panel.id || 'tab-panel-' + i;
    panel.id = id;
    panel.setAttribute('role', 'tabpanel');

    var button = document.createElement('button');
    button.type = 'button';
    button.textContent = panel.getAttribute('data-title');
    button.setAttribute('role', 'tab');
    button.setAttribute('aria-controls', id);
    button.addEventListener('click', function () { select(i); });
    bar.appendChild(button);
    return button;
  });

  function select(index) {
    panels.forEach(function (panel, i) {
      panel.hidden = i !== index;
      buttons[i].classList.toggle('active', i === index);
      buttons[i].setAttribute('aria-selected', i === index ? 'true' : 'false');
    });
  }

  tabs.insertBefore(bar, panels[0]);
  tabs.classList.add('tabs-ready');

  // Open the tab named in the URL (e.g. #sub-teams), otherwise the first one.
  var start = panels.findIndex(function (p) { return '#' + p.id === location.hash; });
  select(start >= 0 ? start : 0);
});
