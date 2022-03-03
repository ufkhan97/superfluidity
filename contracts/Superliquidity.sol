// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Superliquidity {
  constructor() public {
  }

  function main() external {
    //Runs update functions, calculates current variables, executes transactions, and logs states
  }

  //Takes transaction data from the vault and wraps assets as super tokens
  function wrapLiquidity() external {
    //prob something like upgradeTo(address msg.sender, address vaultAddress, uint amount)
    //reserveLiquidity = ++amount
  }

  function unwrapLiquidity() external {
    //downgrade()
    //reserveLiquidity = --amount
  }

  function onSwap() external {
    //unwrap outgoing, wrap incoming, send to msg.sender
  }

  //recalculate the current capital distribution curve to determine the percentage of liquidity to be held in each position in the array
  function updateCapDistCurve() internal {
    // gaussianDistribution(VWAP last:20)
    // execute when VWAP update event occurs

  }

  //Compares the capital distribution curve array to the position array to return the difference in active liquidity and inactive liquidity, 
  function compareCapDistCurve() internal {
    //variables for inactive and active liquidity are computed here
    //for each position do
      //if positions.liquidity - capDistCurve.plot * activeLiquidity > 0 
        //++inactiveLiquidity, add.positions.outgoingLiquidity 
        //Check position against its plot, if there is excess then it is added to the total of inactiveLiquidity and saved in the position array corresponding to the outgoing amount for its CFA transaction 
        //Edge case: Need to pick a default direction to transact if the position at the mean has liquidity exceeding its plot
        //Else: If a position's liquidity is less than its plot value then its outgoing value and flowrate are 0 
          //add.positions.outgoingLiquidity == 0
  }

  //maybe not a function but this happens somewhere
  function getPositionData() internal {
    //query subgraph for realtime position liquidity, store in position array
    //positions = position[subgraph.query('address', position, depth, liquidity, upperTick, lowerTick)]
  }

  //Check change in price over time to find price velocity
  function calculateVelocity() internal {
    //listen for price update event
    //calculate price velocity, smooth average, emit event 
    //priceVelocity = vwap - oldvwap / 2 * priceVelocity[1,..,10]/10 (avg over previous epochs to smooth the avg flowrate) 
    //emit event updateVelocity
  }

  //Updates CFA array with current distribution data and flow rate
  function updateStream() internal {
    //Update sender/receiver address array, push to agreements (or make new agreement if none found)
      //
    //Calculate the position's distance from the mean, increase flowrate exponentially based on distance
    //Find tick, subtract from mean, square it, multiply distance^2 by velocity then by available inactive liquidity
    //flowrate = (mean - (position.upperTick + position.lowerTick / 2)) ** 2 * priceVelocity * (inactiveLiquidity - reserveLiquidity)
    //(might be ideal to leave some float, could modify flowrate so that there's always some left by the next epoch i.e inactiveLiquidity - inactiveLiquidity * 0.01 or use that calculation inside of reserveLiquidity)
  }

}

//Questions to be answered:
//CFA chain or Vault-in/vault-out CFA list?
//  To chain, each position needs 2 agreements (one for each position next to it) and uses an exponential flowrate curve to send it up the chain
//  
//Would an IDA be the fastest way to get funds out? When in the cycle should this occur?
//  - Check for withdrawals on update? Check to see if reserveLiquidity address contains <= reserveLiquidity variable. If less than, measure difference, update IDA with inactive liquidity positions as senders as a step function (each furthest position empties before using funds from the next, until transaction funds = difference)
//
//Is there an absolute value function in Solidity? Distance from the mean in flowrate needs to be a positive integer
//
//Does Chainlink's VWAP have a different event for heartbeat updates vs other updates?
//
//Is there a subgraph query parameter to check for non-zero entries? 
//
//Will position data need to be constructed using realtimeBalanceOf() (or get.netflow()?) from the super agreement? Or can we just query from a subgraph checking the position data
//could probably use a struct for position transaction data
//
//Would it make sense to have an "expected" value variable for the position liquidity amount? 


//**
//
// 
//
// inherits gaussianDistribution
// contract gaussianDistribution {

// struct BellCurve {
//     uint population;
//     uint total;
//     uint mean;
//     uint standardDeviation;
//     mapping(address => uint) plot;
//     mapping(address => uint) differences;
//     uint differences_squared_sum;
//     uint variance;
//     mapping(address => uint) sigma;
// }

// BellCurve bellcurve;

// function calculateMean() {
//   require(bellcurve.mean == 0);
//   bellcurve.mean = bellcurve.total / bellcurve.population;
// }

// function calculateDifference(address _node) {
//   require(bellcurve.variance == 0);
//   uint mean = bellcurve.mean;
//   require(mean != 0); // Has the mean been calculated first?
//   uint plot = bellcurve.plot[_node];
//   require(plot != 0); // Is the price in the record?
//   require(bellcurve.differences[_node] == 0); // Has this price been processed already?
//   uint difference = mean - plot;
//   bellcurve.differences[_node] = difference;
//   bellcurve.differences_squared_sum += difference^2;
// }

// function calculateVariance() {
//   uint variance = bellcurve.differences_squared_sum / bellcurve.population;
//   bellcurve.variance = variance;
// }

//   function calculateStandardDeviation() {
//     uint variance = bellcurve.variance;
//     require(variance != 0);
//     bellcurve.standardDeviation = sqrt(bellcurve.variance);
// }

// function sqrt(uint x) returns (uint y) {
//     uint z = (x + 1) / 2;
//     y = x;
//     while (z < y) {
//         y = z;
//         z = (x / z + z) / 2;
//     }
// }


// } */

//EXAMPLE

// // @dev create flow to new receiver
    //     _host.callAgreement(
    //         _cfa,
    //         abi.encodeWithSelector(
    //             _cfa.createFlow.selector,
    //             _acceptedToken,
    //             newReceivers,
    //             _cfa.getNetFlow(_acceptedToken, address(this)),
    //             new bytes(0)
    //         ),
    //         "0x"
    //     );
    //     // @dev set global receiver to new receiver
    //     _receiver = newReceivers[];

    //     emit ReceiverChanged(_receiver);
    // }


// get.netflow 
// subgraph examples
// streameduntilupdatedat
