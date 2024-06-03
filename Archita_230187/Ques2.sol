// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract EmployeeRegistree {
    struct Employee {
        uint ID;
        string name;
        string position;
        uint salary;
    }
    
    mapping(uint => Employee) private EmployeeMap;
    uint private NextId = 1;

    event EmployeeAdded(uint ID, string name, string position, uint salary);
    event EmployeeUpdated(uint ID, string name, string position, uint salary);
    event EmployeeDeleted(uint ID, string name, string position, uint salary);

    function AddEmployee(string memory name, string memory position, uint salary) public {
        Employee memory newEmployee = Employee({
            ID: NextId,
            name: name,
            position: position,
            salary: salary
        });
        EmployeeMap[NextId] = newEmployee;
        emit EmployeeAdded(NextId, name, position, salary);
        NextId++;
    }

    function UpdateEmployee(uint ID, string memory name, string memory position, uint salary) public {
        require(EmployeeMap[ID].ID != 0, "Employee ID does not exist");

        Employee storage tempEmployee = EmployeeMap[ID];
        tempEmployee.name = name;
        tempEmployee.position = position;
        tempEmployee.salary = salary;

        emit EmployeeUpdated(ID, name, position, salary);
    }

    function GetEmployeeDetails(uint ID) public view returns (string memory name, string memory position, uint salary) {
        require(EmployeeMap[ID].ID != 0, "Employee ID does not exist");

        Employee memory tempEmployee = EmployeeMap[ID];
        return (tempEmployee.name, tempEmployee.position, tempEmployee.salary);
    }

    function DeleteEmployee(uint id) public {
        require(EmployeeMap[id].ID != 0, "Employee ID does not exist");

        Employee memory tempEmployee = EmployeeMap[id];
        delete EmployeeMap[id];

        emit EmployeeDeleted(id, tempEmployee.name, tempEmployee.position, tempEmployee.salary);
    }
}

