{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  libphidget22,
  phidgets_accelerometer,
  phidgets_analog_inputs,
  phidgets_api,
  phidgets_digital_inputs,
  phidgets_digital_outputs,
  phidgets_gyroscope,
  phidgets_high_speed_encoder,
  phidgets_ik,
  phidgets_magnetometer,
  phidgets_motors,
  phidgets_msgs,
  phidgets_spatial,
  phidgets_temperature,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    phidgets_drivers = substituteSource {
      src = fetchFromGitHub {
        name = "phidgets_drivers-source";
        owner = "ros2-gbp";
        repo = "phidgets_drivers-release";
        rev = "3231607f27d8c0a22d67494134978dac7e27b9bf";
        hash = "sha256-rz3bXQCzLS7qlt76ncNcmGDBSviM4KOAU8fEjNGUoXo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_drivers";
  version = "2.3.3-1";
  src = sources.phidgets_drivers;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ libphidget22 phidgets_accelerometer phidgets_analog_inputs phidgets_api phidgets_digital_inputs phidgets_digital_outputs phidgets_gyroscope phidgets_high_speed_encoder phidgets_ik phidgets_magnetometer phidgets_motors phidgets_msgs phidgets_spatial phidgets_temperature ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "API and ROS drivers for Phidgets devices";
  };
}
