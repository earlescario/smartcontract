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
