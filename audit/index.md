# Solo Audit Report

## Project Name: Birds of Space Proxy

### Introduction

Birds of Space Proxy is a project aimed at introducing smart proxy within the Birds of Space ecosystem. This project is designed to enhance the flexibility, security, and overall performance of the Birds of Space application by using smart contracts that act as intermediaries between users and critical functions within the platform.

### Audit Overview

This audit report aims to provide a comprehensive review of the security and reliability of the smart contracts in the Birds of Space Proxy project. Evaluation will be conducted on the smart contract code, identifying potential vulnerabilities, and assessing compliance with best practices in smart contract development. The audit will also discuss the structure and architecture of the Birds of Space Proxy and provide recommendations to improve the security and overall quality of the project.

### Conclusion

As a result of this audit, stakeholders are expected to gain a better understanding of the security level and readiness of the Birds of Space Proxy project. Recommendations generated from this audit will assist in enhancing the reliability and security of the proxy, strengthening the overall foundation of the Birds of Space application.

# Summary of Code Compilation and Quality Analysis

![flow.png](https://raw.githubusercontent.com/birdsofspace/independent-contract-assessment/main/flow/proxy-contract-flow.png)

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


