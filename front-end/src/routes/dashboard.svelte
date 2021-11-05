<!-- src/routes/about.svelte -->
<svelte:head>
	<title>Holdings Dashboard</title>
</svelte:head>

<script>
    let positionsContainer;

	let wallet_address = '0x01234567890abcdef';
    let positions = [
        {
            "a-position": "ETH",
            "b-position": "DAI",
            "a-position-value" : 0.00,
            "b-position-value" : 0.00,
            "fees-accrued": 0.00,
            "profits-accrued": 0.00,
            "initial-investment-value": 0.00,
            "current-investment-equivalent-value": 0.00
        },
        {
            "a-position": "DAI",
            "b-position": "BTC",
            "a-position-value" : 0.00,
            "b-position-value" : 0.00,
            "fees-accrued": 0.00,
            "profits-accrued": 0.00,
            "initial-investment-value": 0.00,
            "current-investment-equivalent-value": 0.00
        }
    ]

    let positionA = "";
    let positionB = "";
    let positionAValue = 0.00;
    let positionBValue = 0.00;
    let feesAccrued = 0.00;
    let profitsAccrued = 0.00;
    let initialInvestmentValue = 0.00;
    let currentInvestmentEquivalentValue = 0.00;

    function onSubmit(){
        // let positionA = document.getElementById("positionA").value;
        // let positionB = document.getElementById("positionB").value;
        // let positionAValue = document.getElementById("positionAValue").value;
        // let positionBValue = document.getElementById("positionBValue").value;
        // let feesAccrued = document.getElementById("feesAccrued").value;
        // let profitsAccrued = document.getElementById("profitsAccrued").value;
        // let initialInvestmentValue = document.getElementById("initialInvestmentValue").value;
        // let currentInvestmentEquivalentValue = document.getElementById("currentInvestmentEquivalentValue").value;

        let newPosition = {
            "a-position": positionA,
            "b-position": positionB,
            "a-position-value" : positionAValue,
            "b-position-value" : positionBValue,
            "fees-accrued": feesAccrued,
            "profits-accrued": profitsAccrued,
            "initial-investment-value": initialInvestmentValue,
            "current-investment-equivalent-value": currentInvestmentEquivalentValue
        }

        positions.push(newPosition);

        // append element to the DOM
        // <div class="row">
        // <div class="col-md-12 box positions">
        //                     <row class="row">
        //                         <div class="col-md-3">
        //                             {position['a-position']}/{position['b-position']}<br/>
        //                             <img src="" alt={position['a-position']} width="20px" height="20px"/> <img src="" alt={position['b-position']} width="20px" height="20px"/> 
        //                         </div>
        //                         <div class="col-md-3">
        //                             Position Value: <br/>
        //                             {position['a-position-value']} ETH / {position['b-position-value']} DAI
        //                         </div>
        //                         <div class="col-md-3">
        //                             Fees: <br/>
        //                             {position['fees-accrued']} DAI
        //                         </div>
        //                         <div class="col-md-3">
        //                             Profits: <br/>
        //                             {position['profits-accrued']} DAI
        //                         </div>
        //                     </row>
        //                 </div>
        //             </div>
        let newPositionElement = document.createElement("div");
        newPositionElement.className = "row";
        newPositionElement.innerHTML = `
                <div class="col-md-12 box positions">
                    <row class="row">
                        <div class="col-md-3">
                            ${newPosition['a-position']}/${newPosition['b-position']}<br/>
                            <img src="" alt=${newPosition['a-position']} width="20px" height="20px"/> <img src="" alt=${newPosition['b-position']} width="20px" height="20px"/> 
                        </div>
                        <div class="col-md-3">
                            Position Value: <br/>
                            ${newPosition['a-position-value']} ETH / ${newPosition['b-position-value']} DAI
                        </div>
                        <div class="col-md-3">
                            Fees: <br/>
                            ${newPosition['fees-accrued']} DAI
                        </div>
                        <div class="col-md-3">
                            Profits: <br/>
                            ${newPosition['profits-accrued']} DAI
                        </div>
                    </row>
                </div>`;
        
        positionsContainer.appendChild(newPositionElement);
    }

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

                        <div class="modal" id="exampleModal" tabindex="-1" role="dialog">
                            <div class="modal-dialog" role="document">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title">New Position</h5>
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                  </button>
                                </div>
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
                                    <button on:click={onSubmit} type="button" class="btn button-1" data-dismiss="modal">Save changes</button>
                                    <button type="button" class="btn button-1" data-dismiss="modal">Close</button>
                                </div>
                              </div>
                            </div>
                          </div>

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
                        {#each positions as position}
                        <div class="row">
                            <div class="col-md-12 box positions">
                                <row class="row">
                                    <div class="col-md-3">
                                        {position['a-position']}/{position['b-position']}<br/>
                                        <img src="" alt={position['a-position']} width="20px" height="20px"/> <img src="" alt={position['b-position']} width="20px" height="20px"/> 
                                    </div>
                                    <div class="col-md-3">
                                        Position Value: <br/>
                                        {position['a-position-value']} ETH / {position['b-position-value']} DAI
                                    </div>
                                    <div class="col-md-3">
                                        Fees: <br/>
                                        {position['fees-accrued']} DAI
                                    </div>
                                    <div class="col-md-3">
                                        Profits: <br/>
                                        {position['profits-accrued']} DAI
                                    </div>
                                </row>
                            </div>
                        </div>
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

    .positions{
        background-color: #382a4b;
        padding: 1.5em;
        margin-bottom: .75em;
        margin-top: .75em;
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
