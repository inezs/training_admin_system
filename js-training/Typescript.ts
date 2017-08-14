class Greeter {
    user: string;
    constructor(name: string) {
        this.user = name;
    }
    greet() {
        return "Hello, " + this.user;
    }
}

let greeter;

let input = document.createElement('input');
document.body.appendChild(input);
input.setAttribute("id", "input1");

let InputButton = document.createElement('button');
InputButton.textContent = "Ok"
document.body.appendChild(InputButton);

let button = document.createElement('button');
button.textContent = "Say Hello";
document.body.appendChild(button);

InputButton.onclick = function () {
    let content = input.value;
    greeter = new Greeter(content);
}

button.onclick = function() {
    alert(greeter.greet());
}