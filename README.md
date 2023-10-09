# DaoId

DaoId is a decentralized and anonymous DAO identity system focused on recognizing and encoding contributions within a DAO setup. By leveraging Ethereum smart contracts, the project aims to award tokens that capture various details about the contribution, such as roles, timeframe, role levels, and additional attributes.

## Features

- **Role-Based Tokens**: Recognize contributions based on specific roles like Founder, Recruiter, Steward, and more.
- **Timeframe Encoding**: Specify the contribution's start and end time.
- **Role Levels**: Highlight the hierarchy or significance of a contributor's role.
- **Additional Attributes**: Flag attributes like code contributions.

## Getting Started

### Prerequisites

Ensure you have [Node.js](https://nodejs.org/) and [Truffle](https://www.trufflesuite.com/) installed.

### Installation

```bash
git clone https://github.com/your-username/DAORepute.git
cd DAORepute
npm install

npx hardhat compile
npx hardhat run --network optimism_testnet YOUR_DEPLOYMENT_SCRIPT.js
```


## Usage
Use the mintWithDetails function to award tokens to DAO contributors, encoding the contribution details in the process.

Example:

```js
mintWithDetails(
    address(0xYourRecipientAddress), 
    100, 
    Role.Founder, 
    block.timestamp, 
    block.timestamp + 365 days, 
    1, 
    true
);
```

## Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss the desired change.

## License
MIT
