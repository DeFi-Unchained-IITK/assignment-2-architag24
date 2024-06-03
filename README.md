# Assignment-2

## Question 1 :

Description:
The contract "PrimeOwner" changes the ownership of the contract to the caller when input number is prime. It also logs an event during this.
the code starts with defining a function prime which returns true if the number is prime and false if it is not.
The state variable owner is then declared which stores the current owner of the contract.
The event ownerChange is emitted whenever the owner changes.
The function ChangeOwner:It reverts back if the input is less than 1. It then calls the function prime and changes the owner if input is a prime number.


## Question 2 :

Description:
The contract EmployeeRegistree deals with the details of employees including four functions.
The struct Employee consists of the properties: ID , name , position and salary of the employee.
The mapping EmployeeMap stores employee details by their id.
State variable NextId keeps track of the next employee to be added.
There are three events:
EmployeeAdded: Emitted when a new employee is added.
EmployeeUpdated: Emitted when an existing employee's details are updated.
EmployeeDeleted: Emitted when an employee is deleted.
Then there are four functions: 
AddEmployee: Adds a new employee to the registry.
UpdateEmployee: Updates the details of an existing employee.
GetEmployeeDetails: Retrieves the details of an employee by ID.
DeleteEmployee: Deletes an employee from the registry.

## Question 3 :

Description: 
The contract Library maintains collection of books alongwith their availability status.
Struct Book contains book's id,name,author,availability status.
First mapping books contains book details by their id and the second mapping stores the ID of the book borrowed by an address.
State variable nextId keeps track of the next book's id.
modifier checkId checks if the input book id is valid.
There are four functions:
AddBook: Adds a new book to the collection.
BorrowBook: Allows a user to borrow a book if it's available.
GetBookDetails: Retrieves the details of a book by its ID.
ReturnBook: Allows a user to return a borrowed book.











