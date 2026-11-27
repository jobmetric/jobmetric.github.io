const filter = document.getElementById('sitemap-filter');
const rows = [...document.querySelectorAll('#sitemap-entries li')];
const sections = [...document.querySelectorAll('#sitemap-entries > section')];
const empty = document.getElementById('no-results');

filter.parentElement.hidden = false;
filter.addEventListener('input', () => {
  const query = filter.value.trim().toLowerCase();
  for (const row of rows) {
    row.hidden = !row.querySelector('a').textContent.toLowerCase().includes(query);
  }
  for (const section of sections) {
    section.hidden = !section.querySelector('li:not([hidden])');
  }
  empty.hidden = rows.some((row) => !row.hidden);
});
