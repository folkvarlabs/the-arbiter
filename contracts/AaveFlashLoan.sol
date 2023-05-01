pragma solidity ^0.8.0;

import "https://github.com/aave/protocol-v2/blob/master/contracts/interfaces/ILendingPool.sol";
import "https://github.com/aave/protocol-v2/blob/master/contracts/interfaces/ILendingPoolAddressesProvider.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract AaveFlashLoanExample {
    ILendingPoolAddressesProvider public provider;
    address public owner;

    constructor(address _provider) {
        owner = msg.sender;
        provider = ILendingPoolAddressesProvider(_provider);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function.");
        _;
    }

    function executeFlashLoan(address asset, uint256 amount) external onlyOwner {
        ILendingPool lendingPool = ILendingPool(provider.getLendingPool());
        lendingPool.flashLoan(address(this), asset, amount, "");
    }

    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    ) external returns (bool) {
        require(msg.sender == provider.getLendingPool(), "Invalid caller.");

        // Implement your custom logic here, such as arbitrage or leveraging the borrowed assets

        uint256 totalDebt = amount + premium;
        IERC20(asset).approve(msg.sender, totalDebt);
        return true;
    }
}
