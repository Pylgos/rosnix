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
  version = "2.4.0-1";
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
        rev = "6ca032e304f31505162eb2cb6c20f0b3dc9b796c";
        hash = "sha256-eBT3ygxZ0RNNuBXJyU3n0zi5qcb6aDIETko3eAo+tNc=";
      };
    };
  });
  meta = {
    description = "API and ROS drivers for Phidgets devices";
  };
})
