// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract contractApi {
    struct Product {
        uint256 id;
        string name;
        uint256 price;
        uint256 quantity;
    }
    address owner;
    Product public removeMe;

    mapping (uint256 => Product) public products;
    Product[] public productArray;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function setProduct(uint256 _id, string memory _name, uint256 _price, uint256 _quantity) public onlyOwner {
        Product memory product = Product(_id, _name, _price, _quantity);
        products[_id] = product;
        productArray.push(Product(_id, _name, _price, _quantity));
    }

    function getProduct(uint _id) public view returns(string memory, uint256, uint256) {
        require(products[_id.id !=0, "product is not available"]);
        Product memory product = products[_id];
        return(product.name, product.price, product.quantity);
    }
}