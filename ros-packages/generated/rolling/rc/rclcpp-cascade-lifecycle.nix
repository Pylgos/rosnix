{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  cascade-lifecycle-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rclcpp_cascade_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rclcpp_cascade_lifecycle-source";
        url = "https://github.com/ros2-gbp/cascade_lifecycle-release.git";
        rev = "725ec2485afc1dc88ad80e53ec89d0d77e233125";
        hash = "sha256-tJ+QyrBJij5KGBc/C7qOJIbVs9xcT5mG8e6fFABi1wI=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rclcpp_cascade_lifecycle";
  version = "2.0.0-1";
  src = sources."rclcpp_cascade_lifecycle";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cascade-lifecycle-msgs lifecycle-msgs rclcpp rclcpp-lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides a mechanism to make trees of lifecycle nodes to propagate state changes";
  };
}
