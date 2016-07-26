# BeaconEmitter

[![CI Status](http://img.shields.io/travis/matteocrippa/BeaconEmitter.svg?style=flat)](https://travis-ci.org/Matteo/BeaconEmitter)
[![Version](https://img.shields.io/cocoapods/v/BeaconEmitter.svg?style=flat)](http://cocoapods.org/pods/BeaconEmitter)
[![License](https://img.shields.io/cocoapods/l/BeaconEmitter.svg?style=flat)](http://cocoapods.org/pods/BeaconEmitter)
[![Platform](https://img.shields.io/cocoapods/p/BeaconEmitter.svg?style=flat)](http://cocoapods.org/pods/BeaconEmitter)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

BeaconEmitter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BeaconEmitter"
```

Usage is pretty simple you have only to create a **beacon** object of class `BeaconEmitter`:

```swift
guard let uuid = NSUUID(UUIDString: "E2AD5810-554E-11E4-9E35-164230D1DF67") else { return true }

let beaconData = Beacon(uuid: uuid, minor: 1000, major: 56, power: -59)

beacon = BeaconEmitter(beacon: beaconData)

```

and then start broadcasting

```swift
beacon?.start()
```

## Configuration

ATvBeacon allows you to configure:

`uuid`: UUID of your beacon
`minor`: minor value
`major`: major value
`power`: power of the beacon


## Author

Matteo Crippa, @ghego20


## License

BeaconEmitter is available under the MIT license. See the LICENSE file for more info.
