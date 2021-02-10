# react-native-siam-piwat-indoormap

## Getting started

`$ npm install react-native-siam-piwat-indoormap@1.3.0 --save`

#### OR

`yarn add react-native-siam-piwat-indoormap@1.3.0`

### Mostly automatic installation

`$ react-native link react-native-siam-piwat-indoormap@1.3.0`

### Note

`For react-native@63.3`
`For iOS 11 or later`

#### iOS

1. Verify Podfile `pod 'SPWIndoormap', :path => '../node_modules/react-native-siam-piwat-indoormap/ios/RNIndoormap.podspec'`
2. Run `Pod install`
3. Add this code to `Appdelegate.m`

##### Workaround

- dyld: Symbol not found or dyld: launch, loading dependent libraries

```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end
  end
end
```

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
    implementation 'com.siampiwat:indoormapsdk:0.9.9'
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
  setFloorNumber,
  resetOriginAndDestination
} from "react-native-siam-piwat-indoormap";


// set stores
setStores(<<shops (JSONArray)>>);


//get veunes
getVenues(() => {
// get stores

},
	(err) => {},
);


// set floor number (Number: floor number  0 is G floor , -1 is B1)
setFloorNumber(<<floor number>>);

// set origin store
setOrigin(<<shop id>>);

// set destination store
setDestination(<<shop id>>);

// get all stores
getAllStores((result) => {
	var stores = result;
});

// reset origin and destination
resetOriginAndDestination();


// present indoor map screen
presentIndoorMap();

```

#### Note

1. You must set all stores before calling the getVenues method.
2. You must get venues before presenting the indoor map screen.
3. You should call the getVenues method only one time after setting all stores.
4. Getting venues might return errors from the map provider, you need to get venues again in case of receiving an error.
