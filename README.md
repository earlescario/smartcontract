# Smart-Contract

This Solidity program demonstrates error-handling mechanisms in a relatable scenario for vehicle owners. It models a **Car Fuel Budget Tracker** to help manage monthly fuel budgets and track fuel usage. The contract utilizes `require()`, `assert()`, and `revert()` statements to validate inputs and ensure robust contract logic.

## Description

This contract, written in Solidity, provides the following functionality:

* **Track Monthly Fuel Budget:** Set and reset a fixed fuel budget for the month.
* **Fuel Usage Tracking:** Record fuel usage and ensure the remaining budget is sufficient for any usage.
* **Remaining Fuel Calculation:** Calculate how much budgeted fuel remains.
* **Error Handling:**
    * Prevents exceeding the fuel budget.
    * Validates fuel budget reset values.
    * Ensures logical consistency after operations.

This contract demonstrates how to apply `require()`, `assert()`, and `revert()` for error handling in practical scenarios while making it relevant to managing a vehicle's fuel consumption.

## Getting Started

### Executing Program

1. **To run this program**, use Remix, an online Solidity IDE. Go to the Remix website at [https://remix.ethereum.org/](https://remix.ethereum.org/).

2. **Create a New File:**
   * Click the "+" icon in the left-hand sidebar.
   * Save the file with a `.sol` extension (e.g., `CarFuelBudget.sol`).
   * Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract CarFuelBudget {
    uint public totalFuelBudget; // Total monthly fuel budget
    uint public usedFuel; // Tracks how much fuel has been used

    constructor(uint _fuelBudget) {
        require(_fuelBudget > 0, "Fuel budget must be greater than zero.");
        totalFuelBudget = _fuelBudget;
    }

    // Use a specified amount of fuel from the budget
    function useFuel(uint _amount) public {
        require(_amount > 0, "Fuel usage must be greater than zero.");
        require(_amount <= getRemainingFuel(), "Insufficient remaining fuel budget.");

        usedFuel += _amount;

        // Ensure the used fuel does not exceed the total budget
        assert(usedFuel <= totalFuelBudget);
    }

    // View the remaining fuel budget
    function getRemainingFuel() public view returns (uint) {
        return totalFuelBudget - usedFuel;
    }

    // Reset the fuel budget for a new month
    function resetFuelBudget(uint _newFuelBudget) public {
        if (_newFuelBudget <= 0) {
            revert("New fuel budget must be greater than zero.");
        }

        totalFuelBudget = _newFuelBudget;
        usedFuel = 0;
    }
}
```

3. **Compile the Contract:**
   * Navigate to the **Solidity Compiler** tab.
   * Ensure the compiler version is set to `^0.8.28` or compatible.
   * Click **Compile CarFuelBudget.sol**.

4. **Deploy the Contract:**
   * Navigate to the **Deploy & Run Transactions** tab.
   * Select `CarFuelBudget` from the dropdown.
   * Enter an initial fuel budget value (e.g., 100) in the constructor input and click **Deploy**.

5. **Interact with the Contract:**
   * Use `useFuel()` to record fuel consumption. Ensure the amount does not exceed the remaining budget.
   * Use `getRemainingFuel()` to check the remaining fuel budget.
   * Use `resetFuelBudget()` to set a new monthly fuel budget.

## Authors

Metacrafter Earl Rodney N. Escario

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
