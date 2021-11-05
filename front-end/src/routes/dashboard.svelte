<!-- src/routes/about.svelte -->
<svelte:head>
	<title>Holdings Dashboard</title>
</svelte:head>

<script>
    import { writable } from "svelte/store";
    import Dialog from "../components/Dialog.svelte";
    import Position from "../components/Position.svelte";
	import { storeFE, idIncrement } from '../components/store.js';

    let positionsContainer;

	let wallet_address = '0x01234567890abcdef';

    function getPositions(){
        return [
        {
            "id": 0,
            "positionA": "ETH",
            "positionB": "DAI",
            "positionAValue": 1.031,
            "positionBValue": 4023.82,
            "feesAccrued": 231.11,
            "profitsAccrued": 2.71,
            "initialInvestmentValue": 0.00,
            "currentInvestmentEquivalentValue": 0.00,
        },
        {
            "id": 1,
            "positionA": "BTC",
            "positionB": "DAI",
            "positionAValue": 0.56,
            "positionBValue": 8023.82,
            "feesAccrued": 7593.08,
            "profitsAccrued": 18.00,
            "initialInvestmentValue": 0.00,
            "currentInvestmentEquivalentValue": 0.00,
        }
    ]
    }

    // these are our 'items' saved to our Svelte store
    $storeFE = getPositions();
</script>

<!-- <div class="row"></div> -->
<body>
	<div class="container">
		<div class="row justify-content-center section-1">
			<div class="col-md-10 box">
				<div class="row buttons-row">
					<div class="col-md-6 action-area">
						<!-- <p style="text-align: center;">test</p> -->
						<a href="" data-toggle="modal" data-target="#exampleModal" class="button button-1">+ New Position</a>
                        <!-- <a href="" on:click={addItem} class="button button-1">+</a> -->

                        <Dialog></Dialog>

					</div>
					<div class="col-md-6 action-area">
						<!-- <p style="text-align: center;">test</p> -->
						<a href="" class="button button-1">Pool Rankings</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center section-1">
			<div class="col-md-10 box">
                <div class="row buttons-row">
                    <div bind:this={positionsContainer} class="col-md-12" id="positions">
                        <h4>Superfluidity Positions for {wallet_address}</h4>
                        <hr/>
                        {#each $storeFE as position}
                        <Position position={position}></Position>
                        {/each}
                    </div>
                </div>
                
            </div>
		</div>
	</div>
</body>

<style>
    body{
        background-color: #1E162B;
        min-height: 100%;
    }

    .box{
        background: #170D26;
        color: #ccc;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        /* box-shadow: 1px 1px 5px rgba(255, 255, 255, .2); */
        box-shadow: 1px 1px 5px rgba(0, 0, 0, .2);
    }

    :root{
        background: #1E162B;
        height: 100vh;
    }

    .buttons-row{
        padding: 25px;
    }

    .button-1{
        background: #1E162B;
        color: #ccc;
        -webkit-border-radius: .24em;
        -moz-border-radius: .24em;
        border-radius: .24em;
    }

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
    @media all and (max-width:30em){
        .button-1{
        display:block;
        margin:0.4em auto;
        }
    }

    .action-area{
        /* padding: 25px; */
        text-align: center;
    }

    .section-1{
        margin: 25px;
    }
    
    hr {
        /* margin-top: 1rem; */
        /* margin-bottom: 1rem; */
        border: 0;
        border-top: 1px solid #382a4b;
        }
</style>
