// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Structs {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public {
        /********** 3 ways to initialize a struct *********/

        // 1 - calling it like a function
        todos.push(Todo(_text, false));

        // 2 - key valu mapping
        todos.push(Todo({text: _text, completed: false}));

        // 3 - initialize an empty struct and then update it
        Todo memory todo;
        todo.text = _text;
        todo.completed = false;

        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function.
    function get(uint256 _index)
        public
        view
        returns (string memory text, bool completed)
    {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateText(uint256 _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update toggle completed
    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
