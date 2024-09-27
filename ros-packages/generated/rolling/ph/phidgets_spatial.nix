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
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_spatial-5d15528ce95e1cb59abb2919a5bec0b1b8647562 = substituteSource {
      src = fetchgit {
        name = "phidgets_spatial-5d15528ce95e1cb59abb2919a5bec0b1b8647562-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "5d15528ce95e1cb59abb2919a5bec0b1b8647562";
        hash = "sha256-My63osp4yOvSPXWqo60ZVvGbG6cF/ApGd5AegiOUg/M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_spatial";
  version = "2.3.3-1";
  src = sources.phidgets_spatial-5d15528ce95e1cb59abb2919a5bec0b1b8647562;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch phidgets_api rclcpp rclcpp_components sensor_msgs std_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Driver for the Phidgets Spatial 3/3/3 devices";
  };
}
