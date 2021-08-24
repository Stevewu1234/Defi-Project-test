interface ITimeLock {

    function setDelay(uint delay_) external;

    function delay() external view returns (uint);
    
    function queuedTransactions(bytes32 transactionHash) external view returns (bool);

    function admin() external view returns (address);

    function pendingAdmin() external view returns (address);

    function GRACE_PERIOD() external view returns (uint);

    function MINIMUM_DELAY() external view returns (uint);

    function MAXIMUM_DELAY() external view returns (uint);

    function acceptAdmin() external;

    function setPendingAdmin(address pendingAdmin_) external;

    function queueTransaction(address target, uint value, string calldata signature, bytes calldata data, uint eta) external returns (bytes32);

    function cancelTransaction(address target, uint value, string calldata signature, bytes calldata data, uint eta) external;

    function executeTransaction(address target, uint value, string calldata signature, bytes calldata data, uint eta) external payable returns (bytes memory);

}