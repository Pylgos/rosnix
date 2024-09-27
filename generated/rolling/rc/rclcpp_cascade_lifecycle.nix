{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cascade_lifecycle_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle_msgs,
  rclcpp,
  rclcpp_lifecycle,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rclcpp_cascade_lifecycle-725ec2485afc1dc88ad80e53ec89d0d77e233125 = substituteSource {
      src = fetchgit {
        name = "rclcpp_cascade_lifecycle-725ec2485afc1dc88ad80e53ec89d0d77e233125-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "725ec2485afc1dc88ad80e53ec89d0d77e233125";
        hash = "sha256-tJ+QyrBJij5KGBc/C7qOJIbVs9xcT5mG8e6fFABi1wI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rclcpp_cascade_lifecycle";
  version = "2.0.0-1";
  src = sources.rclcpp_cascade_lifecycle-725ec2485afc1dc88ad80e53ec89d0d77e233125;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cascade_lifecycle_msgs lifecycle_msgs rclcpp rclcpp_lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides a mechanism to make trees of lifecycle nodes to propagate state changes";
  };
}
