{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  bondcpp,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  lifecycle-msgs,
  mkSourceSet,
  nav2-common,
  nav2-msgs,
  nav2-util,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_lifecycle_manager";
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."nav2_lifecycle_manager";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ bondcpp diagnostic-updater geometry-msgs lifecycle-msgs nav2-common nav2-msgs nav2-util rclcpp-action rclcpp-lifecycle std-msgs std-srvs tf2-geometry-msgs ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_lifecycle_manager" = substituteSource {
      src = fetchgit {
        name = "nav2_lifecycle_manager-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "ce780d7296f4467218236c599646027f42e5d411";
        hash = "sha256-lYy/7Bf9bva4gs6u+ynjEnOj5qGAxguW04ElaDTq2TM=";
      };
    };
  });
  meta = {
    description = "A controller/manager for the lifecycle nodes of the Navigation 2 system";
  };
})
