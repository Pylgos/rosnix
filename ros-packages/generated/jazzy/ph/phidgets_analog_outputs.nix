{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  phidgets_api,
  phidgets_msgs,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "phidgets_analog_outputs" = substituteSource {
      src = fetchgit {
        name = "phidgets_analog_outputs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "f515b9e4933159442a9fc7e3004abd5b1896f1eb";
        hash = "sha256-xi78W37HY59f/oeBUwFQpdqmfHhjmVubarF16PXOWiM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "phidgets_analog_outputs";
  version = "2.3.3-2";
  src = sources."phidgets_analog_outputs";
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ phidgets_api phidgets_msgs rclcpp rclcpp_components std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver for the Phidgets Analog Output devices";
  };
}