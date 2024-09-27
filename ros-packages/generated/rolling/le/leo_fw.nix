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
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  leo_msgs,
  mkSourceSet,
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
  sources = mkSourceSet (sources: {
    "leo_fw" = substituteSource {
      src = fetchgit {
        name = "leo_fw-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "b980ea332555df1757a3033b9b08b65c02429a89";
        hash = "sha256-P9NJHS6QNdT2tsdtQVCLg4+fd0xJYQZJS3dOrTRDWUk=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "leo_fw";
  version = "1.4.0-2";
  src = sources."leo_fw";
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_python geometry_msgs leo_msgs nav_msgs rclcpp rclcpp_components rclpy ros2cli sensor_msgs std_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dbus" "python3-numpy" "python3-whichcraft" "yaml-cpp" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_black ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_mypy ament_cmake_uncrustify ament_cmake_xmllint ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Binary releases of Leo Rover firmware and related utilities";
  };
}
