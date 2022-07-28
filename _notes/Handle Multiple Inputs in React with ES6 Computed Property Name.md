---
title: Handle Multiple Inputs in React with ES6 Computed Property Name
tags: dev
---

[create-react-app (CRA)](https://github.com/facebook/create-react-app) was used to generate the necessary boilerplate to start this React application. If you haven't used it before, you should! There is zero configuration and you won't need to touch Webpack or Babel. 😄

Here's a great tutorial on CRA if you haven't heard about it before: [Bootstrap a React Application through the CLI with Create React App](https://egghead.io/lessons/react-bootstrap-a-react-application-through-the-cli-with-create-react-app)

## Controlled Input

The standard way React handles user input is through Controlled Inputs. The React component that renders the form defines a function that determines what we do with user input in that form.

```jsx
function App(){
  const [userInput, setuserInput] = useState('')

  const handleUserInputChange = evt => {
    const newValue = evt.target.value;

    setuserInput(newValue);
  }

  return (
    <div>
     <br/>
     <label>Input: </label>
     {userInput}
     <br/>
     <input type="text" value={userInput} onChange={handleUserInputChange}/>
    </div>
  )
}
```

In the above example, `userInput` is being handled by the function `handleUserInputChange` which sets the state variable, `userInput`, to the string typed by the user. `userInput` is then set as the value of the input.

React hooks don't change how input is handled. There is a `userInput` state variable being initialized to an empty string through the `useState` hook.

The resulting output is rendered to the screen for feedback.

![Screenshot of One User input handled](./handle-one-input.png)

## The Problem of scaling Controlled Inputs

The problem that we run into is when we want to add more and more input fields into our Component is that it becomes needlessly verbose. The intuitive way to add more inputs (at-least for me) is to just keep adding functions to handle the extra inputs.

```jsx
function AppStart(){

  const [firstName, setFirstName] = useState('')
  const [lastName, setLastName] = useState('')
  const [phoneNumber, setPhoneNumber] = useState('')

  const handleFirstNameChange = evt => {
    const newValue = evt.target.value;

    setFirstName(newValue);
  }

  const handleLastNameChange = evt => {
    const newValue = evt.target.value;

    setLastName(newValue);
  }

  const handlePhoneNumberChange = evt => {
    const newValue = evt.target.value;

    setPhoneNumber(newValue);
  }

  return (
    <div>
     
     <br/>
     <label>First Name: </label>
     {firstName}
     <br/>
     <input type="text" name="firstName" value={firstName} onChange={handleFirstNameChange}/>
     
     <br/>
     <label>Last Name: </label>
     {lastName}
     <br/>
     <input type="text" name="lastName" value={lastName} onChange={handleLastNameChange}/>
     
     <br/>
     <label>Phone Number: </label>
     {phoneNumber}
     <br/>
     <input type="text" name="phoneNumber" value={phoneNumber} onChange={handlePhoneNumberChange}/>
    </div>
  )
}
```

![Screenshot of multiple inputs](./handle-multiple-inputs.png)

In the above example, each input has it's own state variable initialized through `useState`. Each state variable initialized,`firstName`, `lastName`, and `phoneNumber`. has it's own handle change function which works but we broke one of the biggest rules in software development, DRY.

Don’t Repeat Yourself! We just did that 2 times. 😳

Other than the state variables being updated, these functions are the same. There has to be a better way to do this.

## useReducer and ES6 Computed Property Name

With the use of Hooks, there is a little extra work that needs to be done to solve this issue. We'll need to pull in another hook, `useReducer`, to use in tandem with the [ES6 computed property names](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) to solve the problem presented by handling multiple inputs.

```jsx
function App(){
  const [userInput, setUserInput] = useReducer(
    (state, newState) => ({...state, ...newState}),
    {
    firstName: '',
    lastName: '',
    phoneNumber: '',
    }
  );

  const handleChange = evt => {
    const name = evt.target.name;
    const newValue = evt.target.value;

    setUserInput({[name]: newValue});
  }

  return (
    <div>
     <br/>
     <label>First Name: </label>
     {userInput.firstName}
     <br/>
     <input type="text" name="firstName" value={userInput.firstName} onChange={handleChange}/>
     
     <br/>
     <label>Last Name: </label>
     {userInput.lastName}
     <br/>
     <input type="text" name="lastName" value={userInput.lastName} onChange={handleChange}/>
     
     <br/>
     <label>Phone Number: </label>
     {userInput.phoneNumber}
     <br/>
     <input type="text" name="phoneNumber" value={userInput.phoneNumber} onChange={handleChange}/>
    </div>
  )
}
```

`useReducer` takes a function (called a reducer) that determines how React will update your state given the new state that was passed into this function. 

We have a simple use case for our reducer, it accepts a `newState` and spreads the values ([object spread new as of ECMAScript2018](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)) defined onto our original `state` object which returns `state` with the propteries properly updated. The properties we have defined on our `userInput` state are `firstName`, `lastName`, `phoneNumber` which are initialized in the second argument of `useReducer`.

```jsx
const [userInput, setUserInput] = useReducer(
    (state, newState) => ({...state, ...newState}),
    {
    firstName: '',
    lastName: '',
    phoneNumber: '',
    }
  );
```

We can now set a `name` property on each input and access that property dynamically by using the bracket `[]` syntax of [Computed Property Names](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) in our `handleChange` function. 

In `handleChange`, we take the `name` pulled off of the input, and the `value` typed by the user and call `setUserInput` which is given to us by `useReducer`. We pass in an object with the property dynamically set to `name` and the `newValue` set to the value of that property.

```jsx
const handleChange = evt => {
  const name = evt.target.name;
  const newValue = evt.target.value;

  setUserInput({[name]: newValue});
}

return (
  <div>
    <br/>
    <label>First Name: </label>
    {userInput.firstName}
    <br/>
    <input type="text" name="firstName" value={userInput.firstName} onChange={handleChange}/>

    ...
  </div>
)
```

![multiple inputs work again](./multiple-inputs-works-again.png)

We now have all our inputs handled by a single function that will take in the `name` of the input and update the corresponding state values.

We can even clean up our `handleChange` function by using a little more destructuring.

```jsx
const handleChange = evt => {
  const { name, value} = evt.target;

  setUserInput({[name]: value});
}
```