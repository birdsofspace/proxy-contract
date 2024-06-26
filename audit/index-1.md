- Compiled with solc
- Total number of contracts in source files: 2
- Source lines of code (SLOC) in source files: 64
- Number of  assembly lines: 0
- Number of optimization issues: 2
- umber of informational issues: 15
- Number of low issues: 2
- Number of medium issues: 0
- Number of high issues: 0



| Name  | # functions | ERCS | ERC20 info | Complex code |    Features |
|-------|-------------|------|------------|--------------|-------------|
| Proxy |           7 |      |            |           No | Receive ETH |
|       |             |      |            |              |    Assembly |
|       |             |      |            |              |       Proxy |


## Contract Proxy
| Function              |     Modifiers |
|-----------------------|---------------|
| constructor           |            [] |
| listAdmin             |            [] |
| addAdmin              | ['onlyAdmin'] |
| removeAdmin           | ['onlyAdmin'] |
| upgradeImplementation | ['onlyAdmin'] |
| fallback              |            [] |
| receive               |            [] |


## Contract Proxy
- Contract vars: ['_uintStorage', '_addressStorage', '_boolStorage', '_stringStorage', '_bytesStorage', '_proxyAdmin', '_owner', '_initialized', 'functionalAddress']
- Inheritance:: ['Storage']

| Function                       | Visibility | Modifiers      | Read                                    | Write                | Internal Calls                                                                      | External Calls | Cyclomatic Complexity |
|--------------------------------|------------|----------------|-----------------------------------------|----------------------|-------------------------------------------------------------------------------------|----------------|-----------------------|
| constructor(address)           | public     | []             | ['msg.sender']                          | ['_owner', '_proxyAdmin'] | []                                                                                  | []             | 1                     |
|                                |            |                |                                         | ['functionalAddress'] |                                                                                     |                |                       |
| listAdmin()                    | internal   | []             | ['_proxyAdmin']                         | []                   | []                                                                                  | []             | 1                     |
| addAdmin(address)              | public     | ['onlyAdmin']  | []                                      | ['_proxyAdmin']      | ['onlyAdmin']                                                                       | []             | 1                     |
| removeAdmin(address)           | public     | ['onlyAdmin']  | ['_owner']                              | ['_proxyAdmin']      | ['onlyAdmin', 'require(bool,string)']                                               | []             | 1                     |
| upgradeImplementation(address) | public     | ['onlyAdmin']  | []                                      | ['functionalAddress'] | ['onlyAdmin']                                                                       | []             | 1                     |
| fallback()                     | external   | []             | ['functionalAddress', 'msg.data']       | []                   | ['delegatecall(uint256,uint256,uint256,uint256,uint256,uint256)', 'gas()', 'mload(uint256)', 'require(bool)', 'return(uint256,uint256)', 'returndatacopy(uint256,uint256,uint256)', 'returndatasize()', 'revert(uint256,uint256)'] | []             | 2                     |
| receive()                      | external   | []             | []                                      | []                   | []                                                                                  | []             | 1                     |

| Modifiers   | Visibility | Read                              | Write | Internal Calls           | External Calls | Cyclomatic Complexity |
|-------------|------------|-----------------------------------|-------|--------------------------|----------------|-----------------------|
| onlyAdmin() | internal   | ['_proxyAdmin', 'msg.sender']     | []    | ['require(bool,string)'] | []             | 1                     |

## Contract Storage
- Contract vars: ['_uintStorage', '_addressStorage', '_boolStorage', '_stringStorage', '_bytesStorage', '_proxyAdmin', '_owner', '_initialized']
- Inheritance:: []

| Function | Visibility | Modifiers | Read | Write | Internal Calls | External Calls | Cyclomatic Complexity |
|----------|------------|-----------|------|-------|----------------|----------------|-----------------------|

| Modifiers | Visibility | Read | Write | Internal Calls | External Calls | Cyclomatic Complexity |
|-----------|------------|------|-------|----------------|----------------|-----------------------|


