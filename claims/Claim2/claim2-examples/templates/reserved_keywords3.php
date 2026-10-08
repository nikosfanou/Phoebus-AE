<script>
const event_l = events.list;
for (let event of event_l) {
    window.addEventListener(ev, () => localStorage.setItem('window-' + ev, true));
    document.addEventListener(ev, () => localStorage.setItem('document-' + ev, true));
}
</script>