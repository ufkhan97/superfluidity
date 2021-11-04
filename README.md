# superfluidity
Unicode 2021 Hackathon superfluidity pools

A superfluidity pool automatically streams liquidity between concentrated liquidity pools based on price velocity in order to maximize profits.

Similar to grid trading strategies, superfluidity pools take advantage of the relatively bounded liquidity during consolidation following price movements. Following the same logic as concentrated liquidity pools, relatively little capital is needed outside of the current price range in order to fulfill liquidity requirements 
during price movements. However, having liquidity within the range first is a major advantage over other liquidity providers, resulting in higher returns. 

Superfluidity pools solve this by adjusting capital concentration between multiple positions in realtime based on price data from the Uniswap V3 oracle. We utilize superfluid streaming to enable the rapid, flexible movement of liquidity with minimum gas fees.

# Code
After liquidity positions have been created, we can create streams between them. We can then adjust the flowrate between these streams to adjust where our liquidity is allocated. 

For example if we haves pools P1, P2, P3 then we can define f12 and f23 as the flowrates between pools 1 and 2 and pools 2 and 3 respectively. 




# Documentation:
https://docs.superfluid.finance/superfluid/docs/constant-flow-agreement
https://docs.uniswap.org/protocol/concepts/V3-overview/oracle
https://docs.uniswap.org/protocol/guides/providing-liquidity/the-full-contract


