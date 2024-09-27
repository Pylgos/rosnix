{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  marti_common_msgs,
  nav_msgs,
  rclcpp,
  rosSystemPackages,
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
    swri_roscpp-91f705878c525169595dcb44486fc504b5df25e1 = substituteSource {
      src = fetchgit {
        name = "swri_roscpp-91f705878c525169595dcb44486fc504b5df25e1-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "91f705878c525169595dcb44486fc504b5df25e1";
        hash = "sha256-qtBkcbUk+6HXrSLdLd15YZqN/5x48gCfTKi8EGSg2fw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_roscpp";
  version = "3.7.3-1";
  src = sources.swri_roscpp-91f705878c525169595dcb44486fc504b5df25e1;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment rosidl_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_updater marti_common_msgs nav_msgs rclcpp rosidl_default_runtime std_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  meta = {
    description = "A package that extends rclcpp with some commonly used functionality to reduce boilerplate code.";
  };
}
