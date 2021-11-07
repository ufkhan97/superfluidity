//ganache-cli --fork https://mainnet.infura.io/v3/23b1b337c10147208b4cf43ebfd3c2e7
//Error.stackTraceLimit = Infinity;
import {
    Pool,
    Position,
    NonfungiblePositionManager,
    nearestUsableTick
  } from '@uniswap/v3-sdk/'

import  { hexToNumberString }  from 'web3-utils'
import { ethers } from "ethers";
import { Percent, Token, CurrencyAmount, BigintIsh } from "@uniswap/sdk-core";
import { abi as IUniswapV3PoolABI } from "@uniswap/v3-core/artifacts/contracts/interfaces/IUniswapV3Pool.sol/IUniswapV3Pool.json";


// default uses “http://localhost:8545”
// can also input your own connection with "https://mainnet.infura.io/v3/<YOUR-ENDPOINT-HERE>" as an input
const ganache = require("ganache-cli");
const provider = new ethers.providers.Web3Provider(ganache.provider());
//const provider = new ethers.providers.JsonRpcProvider("https://rinkeby.infura.io/v3/23b1b337c10147208b4cf43ebfd3c2e7");

// pool address for WETH/DAI 1.0% rinkeby testnet
 //const poolAddress = "0xAD24b6AC28bF47A04a72952945E2Ff486C0D6C7A";

 //factory contract address 
//const poolAddress = "0x1F98431c8aD98523631AE4a59f267346ea31F984";

// pool address for mainnet WETH USDC
const poolAddress = "0x8ad599c3A0ff1De082011EFDDc58f1908eb6e6D8";

const poolContract = new ethers.Contract(
  poolAddress,
  IUniswapV3PoolABI,
  provider
);

interface Immutables {
  factory: string;
  token0: string;
  token1: string;
  fee: number;
  tickSpacing: number;
  maxLiquidityPerTick: ethers.BigNumber;
}

interface State {
  liquidity: ethers.BigNumber;
  sqrtPriceX96: ethers.BigNumber;
  tick: number;
  observationIndex: number;
  observationCardinality: number;
  observationCardinalityNext: number;
  feeProtocol: number;
  unlocked: boolean;
}

async function getPoolImmutables() {
  const immutables: Immutables = {
    factory: await poolContract.factory(),
    token0: await poolContract.token0(),
    token1: await poolContract.token1(),
    fee: await poolContract.fee(),
    tickSpacing: await poolContract.tickSpacing(),
    maxLiquidityPerTick: await poolContract.maxLiquidityPerTick(),
  };
  return immutables;
}

async function getPoolState() {
  const slot = await poolContract.slot0();
  const PoolState: State = {
    liquidity: await poolContract.liquidity(),
    sqrtPriceX96: slot[0],
    tick: slot[1],
    observationIndex: slot[2],
    observationCardinality: slot[3],
    observationCardinalityNext: slot[4],
    feeProtocol: slot[5],
    unlocked: slot[6],
  };
  return PoolState;
}


async function mintNewLiquidityPosition(sender: string, usdc_amount: BigintIsh, weth_amount: BigintIsh, lowerTick: number, upperTick: number)  {  
  const immutables = await getPoolImmutables();
  const state = await getPoolState();
  const USDC = new Token(1, immutables.token0, 18, "USDC", "USD Coin");
  const WETH = new Token(1, immutables.token1, 18, "WETH", "Wrapped Ether");
  const block = await provider.getBlock(provider.getBlockNumber());
  const deadline = block.timestamp + 200;

  //create a pool
  const USDC_WETH_POOL = new Pool(
    USDC,
    WETH,
    immutables.fee,
    state.sqrtPriceX96.toString(),
    state.liquidity.toString(),
    state.tick
  );
    const token0price = USDC_WETH_POOL.token0Price;
    const token1price = USDC_WETH_POOL.token1Price;
    console.log("token0price: " + token0price);
    console.log("token1price: " + token1price);
  // create a position with the pool
  // the position is in-range, specified by the lower and upper tick
  // in this example, we will set the liquidity parameter to a small percentage of the current liquidity
  const position = Position.fromAmounts({
    pool: USDC_WETH_POOL, 
    tickLower: lowerTick,
    tickUpper: upperTick,
    amount0: usdc_amount,
    amount1: weth_amount,
    useFullPrecision: true
  })

  
    const { calldata, value } = NonfungiblePositionManager.addCallParameters(position, {
        slippageTolerance: new Percent(50, 10_000),
        recipient: sender,
        deadline: deadline
        });
    console.log(`${sender} is adding a position with ${value} ETH`);
    console.log( value);
    console.log(hexToNumberString(calldata));

    //console.log(calldata);
  
  }

  async function main() {
    
    const sender = "0x616caD18642F45d3fa5FCaaD0a2d81764A9cBa84";
    const usdc_amount = "1000000000000000000";
    const weth_amount = "1000000000000000000";
    const lowerTick = 0;
    const upperTick = 0;
    await mintNewLiquidityPosition(sender, usdc_amount, weth_amount, lowerTick, upperTick);
  }
  
  main();