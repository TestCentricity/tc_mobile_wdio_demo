# tc_mobile_wdio_demo

This is a Cucumber based sample test suite and framework utilizing the TestCentricity™ For Apps gem and a screen-object
model architecture for native mobile app functional testing of the [WebDriverIO Demo app](https://github.com/webdriverio/native-demo-app). The tests in
this example project are designed to support testing of [version 1.0.8](https://github.com/webdriverio/native-demo-app/releases/tag/v1.0.8) of the WebDriverIO Demo app.

![WebDriverIO Demo app](https://raw.githubusercontent.com/TestCentricity/tc_mobile_wdio_demo/main/.github/images/WDIO_Demo_app.png)

The primary purpose of this example test suite and framework is to demonstrate how to implement a cross platform automated
testing solution for an iOS and Android mobile app using Cucumber, Appium, and the TestCentricity™ For Apps gem. This test
suite includes scenarios for interacting with and validating the following functionality:
  * Switches
  * Listviews
  * Alert modals
  * Carousel lists
  * Swipe gestures
  * UI element drag and drop actions


## Gem Dependencies:

cucumber  [![Gem Version](https://badge.fury.io/rb/cucumber.svg)](https://badge.fury.io/rb/cucumber)

testcentricity_apps  [![Gem Version](https://badge.fury.io/rb/testcentricity_apps.svg)](https://badge.fury.io/rb/testcentricity_apps)


## Supporting Documentation

[TestCentricity For Apps Framework - testcentricity_apps gem](https://rubygems.org/gems/testcentricity_apps)

[TestCentricity For Apps - documentation](http://www.rubydoc.info/gems/testcentricity_apps/)


## Prerequisites to running tests:

The `tc_mobile_wdio_demo` test automation project supports running tests on iOS and Android simulators or physical devices.
The capabilities profiles for running tests against an iPhone or Android phone are stored in the test data asset file located
at `/config/test_data/data.yml`.

    📁 tc_mobile_wdio_demo
     ├── 📁 config
     │   ├── 📁 test_data
     │   │    └── 📄 data.yml
     │   └── 📄 cucumber.yml
     ├── 📁 doc
     └── 📁 features

In order for Cucumber to execute the features and scenarios in the `tc_mobile_wdio_demo` test automation project, you must
install Appium, XCode, the iOS version-specific device simulators for XCode, Android Studio, and the desired Android
version-specific virtual device emulators. The capabilities profiles in `data.yml`file are currently set to the following:

| Mobile device    | OS version ('appium:platformVersion':) | Device name ('appium:deviceName': / 'appium:avd':) |
|------------------|----------------------------------------|----------------------------------------------------|
| `:iPhone`        | '17.2'                                 | 'iPhone 13 Pro Max'                                |
| `:android_phone` | '12.0'                                 | 'Pixel_5_API_31'                                   |

If you prefer to run tests against mobile devices using simulators other than the ones already preconfigured, you can
edit the capabilities profiles in the `data.yml` file. Refer to [**section 10.2 (Connecting to Locally Hosted Simulators or Physical Devices)**](https://www.rubydoc.info/gems/testcentricity_apps#connecting-to-locally-hosted-simulators-or-physical-devices)
of the TestCentricity For Apps gem documentation for information on specifying the desired capabilities for mobile simulators
and devices.

You will also need to download version 1.0.8 of the iOS (`.app` and/or `.ipa`) and Android (`.apk`) apps to your workstation,
and then edit the capabilities profiles in the `data.yml` file to change file path value associated with the corresponding
`:'appium:app':` keys to the actual file paths where the downloaded app files reside locally.


## Instructions for running tests

In order for Cucumber to execute features or scenarios from the `tc_mobile_wdio_demo` test automation project, the`test_context`
must be specified in the Cucumber command line at runtime. There are 4 test execution profiles, or `test_context`, that are
supported (they are defined in `cucumber.yml`):
* `bat_ios`  - Run Build Acceptance Test (BAT) suite on iPhone
* `bat_android`  - Run Build Acceptance Test (BAT) suite on Android Phone
* `regress_ios`  - Run full regression test suite on iPhone
* `regress_android`  - Run full regression test suite on Android Phone

1. To run the Cucumber BAT suite on an iPhone simulator, execute the following command in the Terminal:

        bundle exec cucumber -p bat_ios

   ℹ️ **NOTE:**
    * To have Cucumber generate HTML formatted test results, append `-p report` to the above command line arguments.

   For example, to execute the BAT suite on an iPhone with test results being logged to an HTML test results file, execute
   the following command in the Terminal:

        bundle exec cucumber -p bat_ios -p report

   To execute the regression test suite on an Android phone, execute the following command in the Terminal:

        bundle exec cucumber -p regress_android

   If you are running locally hosted mobile tests using version 1.x of Appium server, you must include `-p appium_1x` in
   your command line:

        bundle exec cucumber -p regress_ios -p appium_1x

   ℹ️ **NOTE:**
    * Appium will automatically be started prior to tests being run on locally hosted simulators.

2. As the Cucumber tests are executing, the Terminal will display the lines of each feature file and scenario as they run
   in real-time.

3. Upon completion of test execution, the Terminal will display the final test results.

4. If you specified in the command line that HTML formatted test results should be generated (`-p report`), you can view
   them by opening the `reports` folder in the `tc_mobile_wdio_demo` project directory, and selecting the `test_results.html`
   file. Right-clicking on the `test_results.html` file will display a popup menu. Select the **Open in Browser** menu
   item, and then select a web browser from the popup sub menu that appears. The formatted test results will open in the
   web browser that you selected.


## Detailed Documentation

Detailed HTML documentation of the features, scenarios, and step definitions for the `tc_mobile_wdio_demo`project
can be accessed from the `index.html` file within the `doc` folder in the `tc_mobile_wdio_demo` project folder:

    📁 tc_mobile_wdio_demo
     ├── 📁 config
     ├── 📁 doc
     │   └── 📄 index.html
     ├── 📁 features
     └── 📁 reports

To view this documentation, navigate to the `index.html` file, right click on it, and select *Open in Browser*
