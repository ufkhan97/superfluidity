<!-- src/routes/about.svelte -->
<svelte:head>
	<title>Landing Page</title>
</svelte:head>
<script>
	import { ethers } from 'ethers';
	import { address } from '../components/store.js'

	let getAddress;

	if (typeof window !== 'undefined') {
		console.log(document.cookie)

		getAddress = async function getAddress(){
			// @ts-ignore
			const provider = new ethers.providers.Web3Provider(window.ethereum, "any")

			try {
				console.log(provider);
				await provider.send("eth_requestAccounts", []);
				const signer = provider.getSigner();
				$address = await signer.getAddress();
				console.log("Account:", $address);
				//redirect to dashboard
				document.cookie = "address="+$address+"; path=/dashboard";
				console.log("Checking Cookie:", document.cookie);
				// console.log($address)
				window.location.href = "/dashboard";
			} catch(e) {
				console.log(e);
				window.alert("Please install Metamask or sign in");
			}
			
		}
	}
	
</script>

<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-3">
				<button class="button-1" on:click={getAddress}>Sign In Using Metamask</button>
			</div>
		</div>
	</div>
	
</body>

<style>
	body{
        background-color: #1E162B;
        min-height: 100%;
    }

	:root{
        background: #1E162B;
        height: 100vh;
    }

	.container{
		height: 100vh;
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
</style>