{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    tf2_2d-0fc501d87112fe781ad6945eb8c997ac317dbdd4 = substituteSource {
      src = fetchgit {
        name = "tf2_2d-0fc501d87112fe781ad6945eb8c997ac317dbdd4-source";
        url = "https://github.com/ros2-gbp/tf2_2d-release.git";
        rev = "0fc501d87112fe781ad6945eb8c997ac317dbdd4";
        hash = "sha256-4ty09wIhIUq3vI2s5th/54iRL5jTzcYeDumtwzLqeVk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_2d";
  version = "1.0.1-4";
  src = sources.tf2_2d-0fc501d87112fe781ad6945eb8c997ac317dbdd4;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp tf2 tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libboost-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A set of 2D geometry classes modeled after the 3D geometry classes in tf2.";
  };
}
