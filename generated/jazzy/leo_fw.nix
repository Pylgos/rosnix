{
  ament_cmake,
  ament_cmake_black,
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_mypy,
  ament_cmake_python,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_index_python,
  ament_lint_auto,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  leo_msgs,
  nav_msgs,
  rclcpp,
  rclcpp_components,
  rclpy,
  ros2cli,
  rosSystemPackages,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    leo_fw = substituteSource {
      src = fetchFromGitHub {
        name = "leo_fw-source";
        owner = "ros2-gbp";
        repo = "leo_robot-release";
        rev = "179cae449589d487d8f40044e75526ebe38c5150";
        hash = "sha256-P9NJHS6QNdT2tsdtQVCLg4+fd0xJYQZJS3dOrTRDWUk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_fw";
  version = "1.4.0-3";
  src = sources.leo_fw;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python geometry_msgs leo_msgs nav_msgs rclcpp rclcpp_components rclpy ros2cli sensor_msgs std_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dbus" "python3-whichcraft" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_black ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_mypy ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Binary releases of Leo Rover firmware and related utilities";
  };
}
