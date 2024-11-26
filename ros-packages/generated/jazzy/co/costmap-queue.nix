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
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."costmap_queue";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nav2-common nav2-costmap-2d rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "costmap_queue" = substituteSource {
      src = fetchgit {
        name = "costmap_queue-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "4d092ede37bba1bee745e5d5ef5d165b7f41af8a";
        hash = "sha256-AF6cXVPCpSWEs8ZAAKTXut3tHo3dcyZeHdaeKg99QNc=";
      };
    };
  });
  meta = {
    description = "The costmap_queue package";
  };
})
