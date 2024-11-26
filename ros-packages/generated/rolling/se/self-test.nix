{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "self_test";
  version = "4.3.1-1";
  src = finalAttrs.passthru.sources."self_test";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "self_test" = substituteSource {
      src = fetchgit {
        name = "self_test-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "18f69be6ad19cc20d53bd3313b93d9a89bb34881";
        hash = "sha256-Diw5tBh6gDm6BN7WapvcC+Z3tb+HpU2yGqJzIL2UqpM=";
      };
    };
  });
  meta = {
    description = "self_test";
  };
})
