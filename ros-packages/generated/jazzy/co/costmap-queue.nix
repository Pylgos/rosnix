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
  version = "1.3.5-1";
  src = finalAttrs.passthru.sources."costmap_queue";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-common nav2-costmap-2d rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "costmap_queue" = substituteSource {
      src = fetchgit {
        name = "costmap_queue-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "d815a13c2ca841a9c448e4452997be2ab658d70c";
        hash = "sha256-XIPgtt/UNeHIisJD9J0dfdpDTfqRCkkU9QZHkf810Mo=";
      };
    };
  });
  meta = {
    description = "The costmap_queue package";
  };
})
