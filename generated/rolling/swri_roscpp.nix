{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  marti_common_msgs,
  nav_msgs,
  python3Packages,
  rclcpp,
  ros_environment,
  rosidl_cmake,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    swri_roscpp = substituteSource {
      src = fetchgit {
        name = "swri_roscpp-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "6a55de02c8b218f8d051e13245b672e536a90021";
        hash = "sha256-IiiAye8pmAHZ4v2/7T46QwlTajRoH7m3RPlJjPuhNoY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_roscpp";
  version = "3.6.1-2";
  src = sources.swri_roscpp;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_updater marti_common_msgs nav_msgs python3Packages.boost rclcpp rosidl_default_runtime std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest gtest ];
  missingDependencies = [  ];
  meta = {
    description = "swri_roscpp";
  };
}
