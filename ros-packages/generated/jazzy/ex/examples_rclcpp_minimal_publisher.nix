{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_minimal_publisher-2efab9be76af3b788ee8f06a3f43fdf36bc71461 = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_minimal_publisher-2efab9be76af3b788ee8f06a3f43fdf36bc71461-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "2efab9be76af3b788ee8f06a3f43fdf36bc71461";
        hash = "sha256-9fjvWKgKmVm0aaJXMzewXL5UMuZ3AboylZsjXk3BN4o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_minimal_publisher";
  version = "0.19.4-1";
  src = sources.examples_rclcpp_minimal_publisher-2efab9be76af3b788ee8f06a3f43fdf36bc71461;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Examples of minimal publisher nodes";
  };
}
