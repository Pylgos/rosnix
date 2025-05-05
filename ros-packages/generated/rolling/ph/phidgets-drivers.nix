{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libphidget22,
  mkSourceSet,
  phidgets-accelerometer,
  phidgets-analog-inputs,
  phidgets-api,
  phidgets-digital-inputs,
  phidgets-digital-outputs,
  phidgets-gyroscope,
  phidgets-high-speed-encoder,
  phidgets-ik,
  phidgets-magnetometer,
  phidgets-motors,
  phidgets-msgs,
  phidgets-spatial,
  phidgets-temperature,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "phidgets_drivers";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."phidgets_drivers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ libphidget22 phidgets-accelerometer phidgets-analog-inputs phidgets-api phidgets-digital-inputs phidgets-digital-outputs phidgets-gyroscope phidgets-high-speed-encoder phidgets-ik phidgets-magnetometer phidgets-motors phidgets-msgs phidgets-spatial phidgets-temperature ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ libphidget22 phidgets-accelerometer phidgets-analog-inputs phidgets-api phidgets-digital-inputs phidgets-digital-outputs phidgets-gyroscope phidgets-high-speed-encoder phidgets-ik phidgets-magnetometer phidgets-motors phidgets-msgs phidgets-spatial phidgets-temperature ];
  passthru.sources = mkSourceSet (sources: {
    "phidgets_drivers" = substituteSource {
      src = fetchgit {
        name = "phidgets_drivers-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "3231607f27d8c0a22d67494134978dac7e27b9bf";
        hash = "sha256-rz3bXQCzLS7qlt76ncNcmGDBSviM4KOAU8fEjNGUoXo=";
      };
    };
  });
  meta = {
    description = "API and ROS drivers for Phidgets devices";
  };
})
