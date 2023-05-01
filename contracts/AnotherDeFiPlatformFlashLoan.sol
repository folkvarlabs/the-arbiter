pragma solidity ^0.8.0;

import "https://github.com/Uniswap/uniswap-v2-core/blob/master/contracts/interfaces/IUniswapV2Pair.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract UniswapV2FlashSwapExample {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    function executeFlashSwap(
        address pair,
        uint256 amount0,
        uint256 amount1,
        bytes calldata data
    ) external onlyOwner {
        IUniswapV2Pair(pair).swap(amount0, amount1, address(this), data);
    }

    function uniswapV2Call(
        address sender,
        uint256 amount0,
        uint256 amount1,
        bytes calldata data
    ) external {
        // Validate the caller is the Uniswap V2 pair
        require(msg.sender == address(IUniswapV2Pair(msg.sender)), "Invalid caller.");

        // Implement your custom logic here, such as arbitrage or leveraging the borrowed assets

        // Repay the borrowed amounts
        IERC20 token0 = IERC20(IUniswapV2Pair(msg.sender).token0());
        IERC20 token1 = IERC20(IUniswapV2Pair(msg.sender).token1());

        if (amount0 > 0) {
            token0.transfer(msg.sender, amount0);
        }

        if (amount1 > 0) {
            token1.transfer(msg.sender, amount1);
        }
    }
}
