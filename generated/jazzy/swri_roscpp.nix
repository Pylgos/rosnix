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
        rev = "a8fb58bd468aa80cacef5d3bd3fc06993763277f";
        hash = "sha256-D5x6mig9SDgvUyJSUajCKMH+JpaZmCnWTCaQCWz6M6k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_roscpp";
  version = "3.7.1-1";
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
    description = "A package that extends rclcpp with some commonly used functionality to reduce boilerplate code.";
  };
}
