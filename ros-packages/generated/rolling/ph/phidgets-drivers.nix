{
  ament-cmake,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "phidgets_drivers" = substituteSource {
      src = fetchgit {
        name = "phidgets_drivers-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "3231607f27d8c0a22d67494134978dac7e27b9bf";
        hash = "sha256-rz3bXQCzLS7qlt76ncNcmGDBSviM4KOAU8fEjNGUoXo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "phidgets-drivers";
  version = "2.3.3-1";
  src = sources."phidgets_drivers";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ libphidget22 phidgets-accelerometer phidgets-analog-inputs phidgets-api phidgets-digital-inputs phidgets-digital-outputs phidgets-gyroscope phidgets-high-speed-encoder phidgets-ik phidgets-magnetometer phidgets-motors phidgets-msgs phidgets-spatial phidgets-temperature ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "API and ROS drivers for Phidgets devices";
  };
}
