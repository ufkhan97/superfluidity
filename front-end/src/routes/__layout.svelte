<script>
	import { address, visible } from '../components/store.js';

	// console.log($address)

	function logout(){
		document.cookie = "address=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/dashboard;";
		$address = ""
	}
</script>
<nav>
	<span>
		<a href="/">Home</a>
		<!-- {#if $visible} -->
		{#if $address != ""}
			<a href="/dashboard" id="dashboard-link">Dashboard</a>
			<a on:click={logout} href="/"  id="logout-link">Logout</a>
		{/if}
	
	</span>
</nav>

<slot />

<!-- src/routes/__layout.svelte -->
<style>
	span {
		display: inline-block;
		vertical-align: middle;
		line-height: normal;
	}

	nav {
		text-align: right;
		height: 50px;
		line-height: 45px;
		padding-right: 50px;
        background-color: #1E162B;
	}
	
    nav a {
        color: #ccc;
        text-decoration: none;
        padding: 0 10px;
    }
</style>
