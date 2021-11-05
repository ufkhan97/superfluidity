<script>
	import {storeFE, idIncrement} from './store.js'

	let positionA = "";
    let positionB = "";
    let positionAValue = 0.00;
    let positionBValue = 0.00;
    let feesAccrued = 0.00;
    let profitsAccrued = 0.00;
    let initialInvestmentValue = 0.00;
    let currentInvestmentEquivalentValue = 0.00;

	function onSubmit(){
		var l = $storeFE.length;	// get our current items list count
		$idIncrement = l

        let newPosition = {
            "positionA": positionA,
            "positionB": positionB,
            "positionAValue" : positionAValue,
            "positionBValue" : positionBValue,
            "feesAccrued": feesAccrued,
            "profitsAccrued": profitsAccrued,
            "initialInvestmentValue": initialInvestmentValue,
            "currentInvestmentEquivalentValue": currentInvestmentEquivalentValue
        }

		console.log("push")
		$storeFE[l] = newPosition;	// add the new item to the list
		console.log($storeFE);	
		$idIncrement++; // increment our id to add additional items
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
				<label>
					Position A
					<input bind:value={positionA} placeholder="ETH">
				</label>
				<label>
					Position B
					<input bind:value={positionB} placeholder="ETH">
				</label>
				<label>
					Position A Value
					<input type=number bind:value={positionAValue}>   
				</label>
				<label>
					Position B Value
					<input type=number bind:value={positionBValue}>
				</label>
				<label>
					Fees Accrued
					<input type=number bind:value={feesAccrued}>
				</label>
				<label>
					Profits Accrued
					<input type=number bind:value={profitsAccrued}>
				</label>
				<label>
					Initial Investment Value
					<input type=number bind:value={initialInvestmentValue}>
				</label>
				<label>
					Current Investment Equivalent Value
					<input type=number bind:value={currentInvestmentEquivalentValue}>
				</label>
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
        }
  </style>