{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_api,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_accelerometer-41572a3eb0859146b94a1a6b8d00568a6f6c3238 = substituteSource {
      src = fetchgit {
        name = "phidgets_accelerometer-41572a3eb0859146b94a1a6b8d00568a6f6c3238-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "41572a3eb0859146b94a1a6b8d00568a6f6c3238";
        hash = "sha256-n67meToobs7UjIZD2wOckhr3agFm7lVHWykPlZdb3zA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_accelerometer";
  version = "2.3.3-1";
  src = sources.phidgets_accelerometer-41572a3eb0859146b94a1a6b8d00568a6f6c3238;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch phidgets_api rclcpp rclcpp_components sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver for the Phidgets Accelerometer devices";
  };
}
