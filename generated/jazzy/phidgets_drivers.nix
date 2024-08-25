{
  ament_cmake,
  buildRosPackage,
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
  substituteSource,
}:
let
  sources = rec {
    phidgets_drivers = substituteSource {
      src = fetchgit {
        name = "phidgets_drivers-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "5d0d67f72fb6b3780e8f040dcb825140a3dc087e";
        hash = "sha256-rz3bXQCzLS7qlt76ncNcmGDBSviM4KOAU8fEjNGUoXo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_drivers";
  version = "2.3.3-2";
  src = sources.phidgets_drivers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libphidget22 phidgets_accelerometer phidgets_analog_inputs phidgets_api phidgets_digital_inputs phidgets_digital_outputs phidgets_gyroscope phidgets_high_speed_encoder phidgets_ik phidgets_magnetometer phidgets_motors phidgets_msgs phidgets_spatial phidgets_temperature ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "API and ROS drivers for Phidgets devices";
  };
}
