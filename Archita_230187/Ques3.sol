// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Library {
    struct Book {
        uint ID;
        string name;
        string author;
        bool isAvailable;
    }

    mapping(uint => Book) public books;
    mapping(address => uint) public borrowedBooks;
    uint nextId = 1;

    modifier checkId(uint id) {
        require(id != 0 && id < nextId, "Enter a valid id");
        _;
    }

    function AddBook(string memory name, string memory author) public {
        books[nextId] = Book(nextId, name, author, true);
        nextId++;
    }

    function BorrowBook(uint id) public checkId(id) {
        require(books[id].isAvailable, "Book is not available");
        require(borrowedBooks[msg.sender] == 0, "You have already borrowed a book");

        books[id].isAvailable = false;
        borrowedBooks[msg.sender] = id;
    }

    function GetBookDetails(uint id) public view checkId(id) returns (string memory name, string memory author) {
        Book memory tempBook = books[id];
        return (tempBook.name, tempBook.author);
    }

    function ReturnBook(uint id) public checkId(id) {
        require(borrowedBooks[msg.sender] == id, "You did not borrow this book");

        books[id].isAvailable = true;
        borrowedBooks[msg.sender] = 0;
    }
}
