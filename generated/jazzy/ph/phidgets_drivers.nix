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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    phidgets_drivers-5d0d67f72fb6b3780e8f040dcb825140a3dc087e = substituteSource {
      src = fetchgit {
        name = "phidgets_drivers-5d0d67f72fb6b3780e8f040dcb825140a3dc087e-source";
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
  src = sources.phidgets_drivers-5d0d67f72fb6b3780e8f040dcb825140a3dc087e;
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
