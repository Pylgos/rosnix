{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nav2-common,
  nav2-costmap-2d,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "costmap_queue";
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."costmap_queue";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-common nav2-costmap-2d rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "costmap_queue" = substituteSource {
      src = fetchgit {
        name = "costmap_queue-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "9cc50975f5035e70cd6eba6174a890f3d650f316";
        hash = "sha256-AoF/aV8t2t0wCw2rpdb7RRwkxUBThRBGrAUlV3J8F98=";
      };
    };
  });
  meta = {
    description = "The costmap_queue package";
  };
})
