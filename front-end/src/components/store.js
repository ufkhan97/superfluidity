import { writable } from 'svelte/store';
export let storeFE = writable([]);
export let idIncrement = writable(0);
export let address = writable('');
export let visible = writable(false);