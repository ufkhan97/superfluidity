<script>
	import {storeFE, idIncrement, address, provider} from './store.js'
	import { main as mintNewPosition } from './MintNewPosition.ts' 

	let positionA;
    let positionB;
    let positionAValue;
    let positionBValue;
    let feesAccrued;
    let profitsAccrued;
    let initialInvestmentValue;
    let currentInvestmentEquivalentValue;
	let lowerTick;
	let upperTick;

	// let mintNewPosition;

	// function getPositions(){}

	function onSubmit(){
		// $storeFE = [];
		// $storeFE = getPositions();
		var l = $storeFE.length;	// get our current items list count
		$idIncrement = l

        let newPosition = {
			"id": $idIncrement,
            "positionA": positionA,
            "positionB": positionB,
            "positionAValue" : positionAValue,
            "positionBValue" : positionBValue,
			"lowerTick" : lowerTick,
			"upperTick" : upperTick
        }

		try{ 
			mintNewPosition($address, newPosition.positionBValue, newPosition.positionAValue, newPosition.lowerTick, newPosition.upperTick, $provider).catch(function(error){
				console.log(error);
			});
			console.log("push")
			$storeFE[l] = newPosition;	// add the new item to the list
			console.log($storeFE);	
		} catch(e) {
			console.log(e);
			//alert 
		}
		 // increment our id to add additional items
    }
</script>

<div class="modal" id="exampleModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title">New Position</h5>
		  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<form class="position-form" on:submit={onSubmit}>
			<div class="modal-body" style="text-align: left;">
				Select Pair
				<div class="row">
					<div class="col-md-6"><input bind:value={positionA} placeholder="WETH"></div>
					<div class="col-md-6"><input bind:value={positionB} placeholder="USDC"></div>
				</div>

				Position Values
				<div class="row">
					<div class="col-md-6"><input bind:value={positionAValue} placeholder="1000000000000000000"></div>
					<div class="col-md-6"><input bind:value={positionBValue} placeholder="1000000000000000000"></div>
				</div>

				Ticks
				<div class="row">
					<div class="col-md-6"><input bind:value={lowerTick} placeholder="0"></div>
					<div class="col-md-6"><input bind:value={upperTick} placeholder="0"></div>
				</div>

				<!-- Fee Tier
				<div class="row">
					<div class="col-md-4"><input bind:value={feesAccrued} placeholder="0.00"></div>
					<div class="col-md-4"><input bind:value={profitsAccrued} placeholder="0.00"></div>
					<div class="col-md-4"><input bind:value={initialInvestmentValue} placeholder="0.00"></div>
				</div>

				Reinvest Fees?
				<div class="row">
					<div class="col-md-12"><input placeholder="Full Range"></div>
				</div>
				<div class="row">
					<div class="col-md-6"><input placeholder="MIN"></div>
					<div class="col-md-6"><input placeholder="MAX"></div>
				</div> -->
				<!-- <label>
					Initial Investment Value
					<input type=number bind:value={initialInvestmentValue}>
				</label>
				<label>
					Current Investment Equivalent Value
					<input type=number bind:value={currentInvestmentEquivalentValue}>
				</label> -->
			</div>
			<div class="modal-footer">
				<button on:click={onSubmit} type="submit" class="btn button-1" data-dismiss="modal">Save changes</button>
				<button type="button" class="btn button-1" data-dismiss="modal">Close</button>
			</div>
		</form>
	  </div>
	</div>
  </div>

  <style>
	.button-1{
        display: inline-block;
        padding: 0.35em 1.2em;
        border: 0.1em solid #FFFFFF;
        margin: 0 0.3em 0.3em 0;
        border-radius: 0.24em;
        box-sizing: border-box;
        text-decoration:none;
        font-family:'Roboto',sans-serif;
        font-weight:300;
        color:#FFFFFF;
        text-align:center;
        transition: all 0.2s;
    }

    .button-1:hover{
        color:#000000;
        background-color:#FFFFFF;
        box-shadow: 2px 2px 5px rgba(255, 255, 255, .5);
    }
	.modal-content{
        background-color: #170D26;
        padding: 1.5em;
        color: #ccc;
    }

    input {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 0px solid #ccc;
        border-radius: .24em;
        box-sizing: border-box;
		background-color: #382a4b;
		color: #fff;
		box-shadow: inset 1px 1px 5px rgba(0, 0, 0, .2);
        }
  </style>