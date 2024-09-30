{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lifecycle-msgs,
  mimick-vendor,
  mkSourceSet,
  performance-test-fixture,
  rcl,
  rcl-interfaces,
  rcl-lifecycle,
  rclcpp,
  rcpputils,
  rcutils,
  rmw,
  rosSystemPackages,
  rosidl-typesupport-cpp,
  substituteSource,
  test-msgs,
}:
let
  sources = mkSourceSet (sources: {
    "rclcpp_lifecycle" = substituteSource {
      src = fetchgit {
        name = "rclcpp_lifecycle-source";
        url = "https://github.com/ros2-gbp/rclcpp-release.git";
        rev = "215e0f0816ebd497a8fa610dffc87904c8b21a70";
        hash = "sha256-5t9dwNhHBalRLhQ9fWsW/6Eh2LianCz1ZK9uTK+G03k=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rclcpp_lifecycle";
  version = "28.3.3-1";
  src = sources."rclcpp_lifecycle";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ lifecycle-msgs rcl rcl-interfaces rcl-lifecycle rclcpp rcutils rmw rosidl-typesupport-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture rcpputils test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package containing a prototype for lifecycle implementation";
  };
}
