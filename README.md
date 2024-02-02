## 模拟合约攻击

### 1.Shield合约的approveStablecoin方法缺少权限控制
### 2.任何人都可以通过调用Shield的approveStablecoin函数去授权中Shield在其他合约的资产
### 3.转移资产

## foundry 模拟合约攻击命令
```
forge test --mc testAttack -vvvv
```

