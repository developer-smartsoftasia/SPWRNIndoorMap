
# react-native-indoormap

## Getting started

`$ npm install react-native-indoormap --save`

### Mostly automatic installation

`$ react-native link react-native-indoormap`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-indoormap` and add `RNIndoormap.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNIndoormap.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.siampiwat.indoormap.RNIndoormapPackage;` to the imports at the top of the file
  - Add `new RNIndoormapPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-indoormap'
  	project(':react-native-indoormap').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-indoormap/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-indoormap')
  	```


## Usage
```javascript
import RNIndoormap from 'react-native-indoormap';

// TODO: What to do with the module?
RNIndoormap;
```
  