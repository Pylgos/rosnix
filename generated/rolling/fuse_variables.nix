{
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_core,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    fuse_variables = substituteSource {
      src = fetchgit {
        name = "fuse_variables-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "48a49587f40a6fb0307fcd58a5db8f5cfff5e4ce";
        hash = "sha256-tjlr4YG4Lchz0Z8BgQ+Hya4ZWaq97uxfmG0fijq91gI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_variables";
  version = "1.2.1-1";
  src = sources.fuse_variables;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fuse_core pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The fuse_variables package provides a set of commonly used variable types, such as 2D and 3D positions, \\ orientations, velocities, and accelerations.";
  };
}
