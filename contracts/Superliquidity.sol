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
    //prob something like upgradeTo(address msg.sender, address vault address, uint addActiveLiquidity)
  }

  function unwrapLiquidity() external {
    //downgrade()
  }

  function onSwap() external {
    //unwrap outgoing, wrap incoming, send to msg.sender
  }

  //recalculate the current capital distribution curve to determine the percentage of liquidity to be held in each position in the array
  function updateCapDistCurve() internal {
    // gaussianDistribution(VWAP last:20)
    // execute when VWAP update event occurs

  }

  function getPositionData() internal {
    //query subgraph for realtime position liquidity, store in position array
    // positions = position[subgraph.query('address', position, depth, liquidity)]
  }

  //Compares the capital distribution curve array to the position array to return the difference in active liquidity and inactive liquidity, 
  function compareCapDistCurve() internal {
    //variables for inactive and active liquidity are computed here
  }

  function calculateFlowRate() internal {
    //flowrate = vwap - oldvwap / 2 * flowrate[1,..,10]/10 (avg flow over previous epochs to smooth the avg flowrate) * inactiveLiquidity (might be ideal to leave some float, could modify flowrate so that there's always some left by the next epoch)
    //emit event updateFlowrate
  }

  //Updates CFA with current distribution data and flow rate
  function updateStream() internal {
    //Update sender/receiver address array, push to agreements (or make new agreement if none found)
  }

}

//Questions to be answered:
//Do streaming agreements have static addresses, or can they be updated?
//  If static, each position needs 2 agreements (one for each position next to it) and use an exponential flowrate curve to send it up the chain
//  Else, use 1 CFA containing each address pair, or put vault in the middle i.e 1 CFA for inflows, 1 CFA outflows
//
//Does Chainlink's VWAP have a different event for heartbeat updates vs other updates?
//
//Is there a subgraph query parameter to check for non-zero entries? 
//
//Will position data need to be checked using realtimeBalanceOf() from the super agreement? Or can we just query from a subgraph checking the position data
//could probably use a struct for position transaction data


//**
//
// EXAMPLE CODE
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
// the pick
// sentinels - long-tailed assets
// GDA - General distribution agreement 