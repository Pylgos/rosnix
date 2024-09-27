{
  ament_cmake_auto,
  ament_cmake_ros,
  autoware_cmake,
  autoware_lanelet2_extension,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  lanelet2_core,
  lanelet2_io,
  lanelet2_projection,
  lanelet2_python,
  lanelet2_routing,
  lanelet2_traffic_rules,
  lanelet2_validation,
  python_cmake_module,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    autoware_lanelet2_extension_python = substituteSource {
      src = fetchgit {
        name = "autoware_lanelet2_extension_python-source";
        url = "https://github.com/ros2-gbp/autoware_lanelet2_extension-release.git";
        rev = "09418c4b947885e9d795b94cb9f3d9df4a4672ca";
        hash = "sha256-66WcbYI3aeUgqJcN2CZXyxPBZJPyYveuZl6MQLPMS2I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_lanelet2_extension_python";
  version = "0.6.0-1";
  src = sources.autoware_lanelet2_extension_python;
  nativeBuildInputs = [ ament_cmake_auto autoware_cmake python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ autoware_lanelet2_extension geometry_msgs lanelet2_core lanelet2_io lanelet2_projection lanelet2_python lanelet2_routing lanelet2_traffic_rules lanelet2_validation rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-python-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The autoware_lanelet2_extension_python package contains Python bindings for lanelet2_extension package";
  };
}
