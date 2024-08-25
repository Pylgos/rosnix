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
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  leo_msgs,
  libyamlcpp,
  nav_msgs,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rclpy,
  ros2cli,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    leo_fw = substituteSource {
      src = fetchgit {
        name = "leo_fw-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
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
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python geometry_msgs leo_msgs libyamlcpp nav_msgs python3Packages.dbus-python python3Packages.whichcraft rclcpp rclcpp_components rclpy ros2cli sensor_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_black ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_mypy ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ];
  missingDependencies = [  ];
  meta = {
    description = "Binary releases of Leo Rover firmware and related utilities";
  };
}
