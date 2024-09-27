{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  example_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    examples_rclcpp_async_client-8a61aae631e4a7b75eaec9385bf64d272e487dc3 = substituteSource {
      src = fetchgit {
        name = "examples_rclcpp_async_client-8a61aae631e4a7b75eaec9385bf64d272e487dc3-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "8a61aae631e4a7b75eaec9385bf64d272e487dc3";
        hash = "sha256-0iq4XGvRdCCPBT06auHiCmfr+gES26/yu36Ccrfp6Xs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "examples_rclcpp_async_client";
  version = "0.19.4-1";
  src = sources.examples_rclcpp_async_client-8a61aae631e4a7b75eaec9385bf64d272e487dc3;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ example_interfaces rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Example of an async service client";
  };
}
