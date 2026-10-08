<script>
const event_l = events.list;
for (let event of event_l) {
    window.addEventListener(event, () => localStorage.setItem('window-listener-' + event, true));
    document.addEventListener(event, () => localStorage.setItem('document-listener-' + event, true));
}

const event_attr_l = event_attrs.list;
for (let event_attr of event_attr_l) {
    window[event_attr] = () => localStorage.setItem('window-attribute-' + event_attr, true);
    document[event_attr] = () => localStorage.setItem('document-attribute-' + event_attr, true);
}
</script>