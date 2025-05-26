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
  version = "2.3.4-1";
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
        rev = "d99b6173118568523904b4470c44d727d5f384c4";
        hash = "sha256-dp+xVPXCMquZQec8fFPd8HpuMt/pzHS+cWbeo3VCjsU=";
      };
    };
  });
  meta = {
    description = "API and ROS drivers for Phidgets devices";
  };
})
