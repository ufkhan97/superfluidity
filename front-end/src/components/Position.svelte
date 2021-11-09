<script>
import { namehash } from "@ethersproject/hash";
import { loop_guard } from "svelte/internal";
	export let position;

    console.log('position')
    console.log(position);

    import { fade } from 'svelte/transition';
	import { storeFE } from './store.js';
	// export let objAttributes = {};

	export let names = {
			"btc": "https://cryptologos.cc/logos/bitcoin-btc-logo.png",
			"eth": "https://cryptologos.cc/logos/ethereum-eth-logo.png",
			"weth": "https://cryptologos.cc/logos/ethereum-eth-logo.png",
			"dai": "https://cryptologos.cc/logos/multi-collateral-dai-dai-logo.png",
			"usdc": "https://cryptologos.cc/logos/usd-coin-usdc-logo.png"
		}
	
	function removeComponent() {
		$storeFE = $storeFE.filter(function(value, index, arr){ 
			if (value.id != position.id) return value;
		});
		console.log($storeFE);
	}

	// function logourl(shortname) {
		

	// 	return names[shortname];
	// }
</script>

<div class="row">
	<div class="col-md-12 box positions">
		<row class="row">
			<div class="col-md-2">
				{position['positionA']}/{position['positionB']}<br />
				<img src={names[position['positionA'].toLowerCase()]} alt={position['positionA']} width="20px" height="20px" />
				<img src={names[position['positionB'].toLowerCase()]} alt={position['positionB']} width="20px" height="20px" />
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
				<button class="btn button-2" on:click={() => removeComponent()}>Remove</button>
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

	.button-2{
        display: inline-block;
        padding: 0.35em 1.2em;
        border: 0.1em solid #8B0000;
        margin: 0 0.3em 0.3em 0;
        border-radius: 0.24em;
        box-sizing: border-box;
        text-decoration:none;
        font-family:'Roboto',sans-serif;
        font-weight:300;
        color:#ccc;
        text-align:center;
        transition: all 0.2s;
    }

    .button-2:hover{
        color:#ffffff;
        background-color:#8B0000;
        box-shadow: 2px 2px 5px rgba(139, 0, 0, .5);
    }
</style>
