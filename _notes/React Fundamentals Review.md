---
title: React Fundamentals Review
tags: technology
---

<!-- 
<TimeStamp start={} end={}>
<TimeStamp />
 -->
## Start Building a React Native Application

<TimeStamp start={00:00:00} end={00:00:08}>
  `native.reactjs.com` no longer works, visit https://reactnative.dev/
<TimeStamp />

- No longer intro page in docs, need to go to `Environment Set up`. Expo CLI looks like a new tool in the space which they have set up instructions for. Tab over to React Native CLI to follow a similar process
- set up super outdated


- Docs now recommend using npx to set up a project
- CocoaPods needs to be installed as well, did so with homebrew


<TimeStamp start={00:01:15} end={00:01:26}>
```bash
npx react-native init eggheadProject
```
<TimeStamp />

- opening up the project like it's done in the video does not work, need to open the iOS subdirectory


<TimeStamp start={00:01:55} end={00:02:00}>
Open up `{projectFolder}/ios` in XCode to properly run the application
<TimeStamp />

- live reload is enabled by default now


<TimeStamp start={00:04:32} end={00:04:37}>
The default application is using React functional components which differs from what is shown in this lesson
<TimeStamp />

<TimeStamp start={00:05:05} end={00:05:31}>
React Native no longer uses `require` syntax and now uses es6 module import syntax. Using the components is still the same.
<TimeStamp />

- The last 3-4 minutes of this lesson would be better suited as a mini-talk. Nothing happens on the screen for the duration.


### Comments from lesson
  - Looks like I'll need to upgrade to Yosemite to use Xcode with iOS 8. Does not work on Mavericks.
  - Any idea how to develop if I don't have Mac?
  -  I was not able to get pass the 6th video lecture because I'm using OS X Mavericks and Xcode 6.2. I believe I need Yosemite and a later version of Xcode to get the code to run properly.
  -  Alain, to open an xcode project you need to navigate to the folder with the .xcodeproj file. This is in the ios folder. Something must have changed since the video was made. If you you look at the output of the 'react-native init ....' you will see they point you to this folder.


## Set up Basic iOS Routing with React Native


NavigatorIOS looks to be deprecated as of 4 years ago.. The use of class components instead of functional is confusing things further. The react native starter that you are put in if you go through the default path is all function based

### Comments

- 'Navigation component is essential to learning react-native'

## Rubric Score
[Course Quality Rubric](https://roamresearch.com/#/app/egghead/page/BRYKMsAyG)
- Are there opportunities for self-assessment? (1-4):
- Is the course content high quality? (1-4):
- Is the course content current and up to date? (1-4):
- Does the content meet the stated learning goals? (1-4):
- Does the content incorporate proof (to the learner and others) that the stated learning goals were achieved? (1-4):
- Is the course material evergreen? (1-4):
- How much depth of knowledge does the course provide? (1-4):
- Is the course actionable? (1-4):