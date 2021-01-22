# react-native-siam-piwat-indoormap

## Getting started

`$ npm install react-native-siam-piwat-indoormap@1.0.4 --save`

#### OR

`yarn add react-native-siam-piwat-indoormap@1.0.4`

### Mostly automatic installation

`$ react-native link react-native-siam-piwat-indoormap@1.0.4`

### Note

#### iOS

1. Verify Podfile `pod 'SPWIndoormap', :path => '../node_modules/react-native-siam-piwat-indoormap/ios/RNIndoormap.podspec'`
2. Run `Pod install`
3. Add this code to `Appdelegate.m`

```objective-c

#import <RNIndoorMap/RNIndoorMap.h>

@implementation AppDelegate
- (instancetype)init
{
  self = [super init];
  if (self) {

    [SPWIndoorMapManager initialSDKWithSlug:SPWApplicationIconSiam shops:@[]
                                   language:SPWLanguageEnglish
                                appDelegate:[AppDelegate self]
                                    isDebug:false simulateNavigation:false];
  }
  return self;
}

@end

```

#### Android

1. Verify `compileSdkVersion = 29`
2. Add `maven { url 'https://dl.bintray.com/ssa/com.siampiwat' }` to `build.gradle`
3. Add dependencies to `app/build.gradle`

```groovy
dependencies {
    ..
    implementation 'com.siampiwat:indoormapsdk:0.9.6'
    ..
}
```

4. Add this code to `MainApplication` file.

```kotlin

import com.siampiwat.indoormapsdk.IndoorMapSDK

override fun onCreate() {
	super.onCreate()
	IndoorMapSDK.init(this)
}

```

5. Add this code to `MainActivity`

```kotlin

// >>> import these <<<
import com.siampiwat.indoormapsdk.IndoorMapSDK
import com.siampiwat.indoormapsdk.data.appenum.SPWApplicationSlug
import com.siampiwat.indoormapsdk.data.appenum.SPWLanguage

override fun onCreate(savedInstanceState: Bundle?) {
	super.onCreate(savedInstanceState)
	// >>> Add this method <<<
	IndoorMapSDK.initialize(SPWApplicationSlug.ICON_SIAM, "", SPWLanguage.TH, true)
}

```

5. Add activity to `AndroidMainifest.xml`

```xml
<activity android:name="com.siampiwat.indoormap.IndoorMapView"/>
```

## Usage

```javascript
import {
  presentIndoorMap,
  getAllStores,
  getVenues,
  setOrigin,
  setDestination,
  setStores,
} from "react-native-siam-piwat-indoormap";

setStores(<<shops (JSONArray)>>);
//get veunes
getVenues(
	() => {
	// get stores
	getAllStores((result) => {
		var stores = result;

		//   setOrigin(stores[0].id);
		setDestination(<<shop id>>);

		presentIndoorMap();
	});
	},
	(err) => {},
);

```
