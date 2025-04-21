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
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."costmap_queue";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-common nav2-costmap-2d rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "costmap_queue" = substituteSource {
      src = fetchgit {
        name = "costmap_queue-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "38c91f751ec62001feca97c7cd01c865e0d808f6";
        hash = "sha256-MN77VD2Neuq5MOnAktbN7VKDTlypnc7vBnxVMCNtiSE=";
      };
    };
  });
  meta = {
    description = "The costmap_queue package";
  };
})
