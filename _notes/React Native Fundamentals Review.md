---
title: React Fundamentals Review
tags: technology
---

<!-- 
<TimeStamp start={} end={}>
<TimeStamp />
 -->

 ## Rubric Score
 
[Course Quality Rubric](https://roamresearch.com/#/app/egghead/page/BRYKMsAyG)
- Are there opportunities for self-assessment? (1-4): 1
- Is the course content high quality? (1-4): 4 
- Is the course content current and up to date? (1-4): 1
- Does the content meet the stated learning goals? (1-4): 4
- Does the content incorporate proof (to the learner and others) that the stated learning goals were achieved? (1-4): 1
- Is the course material evergreen? (1-4): 2
- How much depth of knowledge does the course provide? (1-4): 4
- Is the course actionable? (1-4): 1

Total Score: 18


[React Native CHANGELOG](https://github.com/react-native-community/releases/blob/master/CHANGELOG.md)

## Review
### Start Building a React Native Application

```js
<TimeStamp start={00:00:00} end={00:00:08}>
  `native.reactjs.com` no longer works, visit https://reactnative.dev/
<TimeStamp />
```

- No longer intro page in docs, need to go to `Environment Set up`. Expo CLI looks like a new tool in the space which they have set up instructions for. Tab over to React Native CLI to follow a similar process
- set up super outdated


- Docs now recommend using npx to set up a project
- CocoaPods needs to be installed as well, did so with homebrew

```js
<TimeStamp start={00:01:15} end={00:01:26}>
npx react-native init eggheadProject
<TimeStamp />
```

- opening up the project like it's done in the video does not work, need to open the iOS subdirectory

```js
<TimeStamp start={00:01:55} end={00:02:00}>
Open up `{projectFolder}/ios` in XCode to properly run the application
<TimeStamp />
```

- live reload is enabled by default now

```js
<TimeStamp start={00:04:32} end={00:04:37}>
The default application is using React functional components which differs from what is shown in this lesson
<TimeStamp />

<TimeStamp start={00:05:05} end={00:05:31}>
React Native no longer uses `require` syntax and now uses es6 module import syntax. Using the components is still the same.
<TimeStamp />
```

- The last 3-4 minutes of this lesson would be better suited as a mini-talk. Nothing happens on the screen for the duration.


#### Comments from lesson
  - Looks like I'll need to upgrade to Yosemite to use Xcode with iOS 8. Does not work on Mavericks.
  - Any idea how to develop if I don't have Mac?
  -  I was not able to get pass the 6th video lecture because I'm using OS X Mavericks and Xcode 6.2. I believe I need Yosemite and a later version of Xcode to get the code to run properly.
  -  Alain, to open an xcode project you need to navigate to the folder with the .xcodeproj file. This is in the ios folder. Something must have changed since the video was made. If you you look at the output of the 'react-native init ....' you will see they point you to this folder.


### Set up Basic iOS Routing with React Native


NavigatorIOS looks to be deprecated as of 4 years ago.. The use of class components instead of functional is confusing things further. The react native starter that you are put in if you go through the default path is all function based

#### Comments

- 'Navigation component is essential to learning react-native'

### Use State and Touch Events in React Native

- Main components used: TextInput, TouchableHighlight, ActivityIndicatorIOS

```js
<TimeStamp start={00:01:30} end={00:02:00}>
Initializing state in a constructor assumes you are using a Class component. If you are using a functional React component you would use a `useState` hook.
<TimeStamp />


<TimeStamp start={00:03:49} end={00:04:15}>
If you are using ES6 Arrow functions, you do not need to bind the `this` keyword. [More on `this` and Arrow functions here](https://egghead.io/lessons/javascript-capture-this-with-an-arrow-function).
<TimeStamp />
```

### Understand the fetch API

- fetch api is available in all modern browsers

### Use Fetch to Load External Data in React Native

- A lot of good concepts here that are still fresh regarding fetching data in React. The implementation on the React side would be different but the fetching and setting data are similar

```js
<TimeStamp start={00:04:20} end={00:00:08}>
In modern React, this would be done in a useEffect.
<TimeStamp />
```

### Pass Data when Changing Routes in React Native

- passes props through a route change. fundamental concept.
- React Navigation looks like the defacto solution for React Native Routing
  - https://reactnative.dev/docs/navigation

### Use React Native's Error Handle and ActivityIndicatiorIOS

- fundamental UX pattern of handling loading state by showing a loader

### Use Images in a React Native Application

- interesting pattern for styling different buttons.
  - puts styles in a function and sets different background colors depending on the number you pass
  - is this a normal way to style in React Native?

### Use propTypes in Reusable React Native Components

- propTypes will make React throw an error when props don't match what we are expecting

### Create a Scrollable React Native Component with ScrollView

- v0.64.0 -- Removed DEPRECATED_sendUpdatedChildFrames prop from ScrollView component (deprecated in 0.47)
- v0.58.0 -- Breaking changes to ScrollView, CameraRollView, and SwipeableRow that make it no longer bound to the component instance in certain methods. Converted to an ES6 class.

- interesting pattern grabbing specific info from an object by setting keys in an array and mapping over it
- mapping over an array
- formatting data function

### Build a Reusable React Native UI Component
- component organization
  - 'helper components' or common UI elements

### Build a Github Repositories Component in React Native
- conditionally rendering components based on props that are recieved

```js
<TimeStamp start={00:04:16} end={00::04:38}>
With ES6 you can use an arrow function instead of binding `this`.
<TimeStamp />
```

- 05:35 - proptypes

### Navigate to a React Native component

- makes request on button press
- passes the data that is received from request to component that's being navigated to

### Access Web Pages through React Native's WebView Component

- names component Web_View
  - interesting style (ah, because WebView is from React Native)

WebView updates:
  https://github.com/react-native-webview/react-native-webview
Changes
  - v0.60.0 - WebView removed entirely from react-native, use react-native-webview
  - v0.57.0 WebView will be moved to its own repo at react-native-community/react-native-webview.
  - v0.56.0 Restrict WebView to only http(s) URLs by default

### Persist data in React Native with Firebase REST API

- Firebase website looks much different


### Build a View with React Native's ListView Component

https://reactnative.dev/docs/0.62/listview

- ListView is Deprecated, use FlatList or SectionList
- [TouchableHighlight](https://reactnative.dev/docs/touchablehighlight) - If you're looking for a more extensive and future-proof way to handle touch-based input, check out the Pressable API.

### Complete the Notes view in React Native

[Image Source URIs with HTTPS (SSL) Work, HTTP do NOT Work (React Native v0.30.0)](https://stackoverflow.com/questions/38587451/image-source-uris-with-https-ssl-work-http-do-not-work-react-native-v0-30-0/38587838#38587838)