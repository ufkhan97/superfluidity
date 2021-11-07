<script>
import { loop_guard } from "svelte/internal";
	export let position;

    console.log('position')
    console.log(position);

    import { fade } from 'svelte/transition';
	import { storeFE } from './store.js';
	// export let objAttributes = {};
	
	function removeComponent() {
		$storeFE = $storeFE.filter(function(value, index, arr){ 
			if (value.id != position.id) return value;
		});
		console.log($storeFE);
	}
</script>

<div class="row">
	<div class="col-md-12 box positions">
		<row class="row">
			<div class="col-md-2">
				{position['positionA']}/{position['positionB']}<br />
				<img src="" alt={position['positionA']} width="20px" height="20px" />
				<img src="" alt={position['positionB']} width="20px" height="20px" />
			</div>
			<div class="col-md-2">
				Position Value: <br />
				{position['positionAValue']} {position['positionA']} / {position['positionBValue']} {position['positionB']}
			</div>
			<div class="col-md-2">
				Fees: <br />
				{position['feesAccrued']} {position['positionB']}
			</div>
			<div class="col-md-2">
				Profits: <br />
				{position['profitsAccrued']} {position['positionB']}
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-2">
				<button class="btn btn-danger" on:click={() => removeComponent()}>Remove</button>
			</div>
		</row>
	</div>
</div>

<style>
	.box {
		background: #170d26;
		color: #ccc;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		/* box-shadow: 1px 1px 5px rgba(255, 255, 255, .2); */
		box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
	}

    .positions {
		background-color: #382a4b;
		padding: 1.5em;
		margin-bottom: 0.75em;
		margin-top: 0.75em;
	}
</style>
