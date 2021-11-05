<nav>
	<span>
		<a href="/">Home</a>
		<a href="/dashboard">Dashboard</a>
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
