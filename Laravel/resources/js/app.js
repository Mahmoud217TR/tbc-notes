require('./bootstrap');
window.Vue = require('vue').default;
import { createApp } from 'vue';

let app=createApp({})
app.component('example-component', require('./components/ExampleComponent.vue').default);
app.mount("#app");