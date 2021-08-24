
contract LPTokenWrapper {
    using SafeERC20 for IERC20;

    IERC20 public staketoken;      //UniswapV2 LP token 

    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function stake(address account, uint256 amount) public virtual {
        _totalSupply = _totalSupply + amount;
        _balances[account] = _balances[account] + amount;
        staketoken.safeTransferFrom(account, address(this), amount);
    }

    function withdraw(address account, uint256 amount) public virtual {
        _totalSupply = _totalSupply - amount;
        _balances[account] = _balances[account] - amount;
        staketoken.safeTransfer(account, amount); 
    }
}
