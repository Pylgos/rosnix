{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosgraph-monitor-msgs,
  rosidl-runtime-cpp,
  rosidl-typesupport-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_stats_shim";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."rmw_stats_shim";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosgraph-monitor-msgs rosidl-runtime-cpp rosidl-typesupport-cpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosgraph-monitor-msgs rosidl-runtime-cpp rosidl-typesupport-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_stats_shim" = substituteSource {
      src = fetchgit {
        name = "rmw_stats_shim-source";
        url = "https://github.com/ros2-gbp/graph_monitor-release.git";
        rev = "8a9f88c6f0b2ba96c0280dc94179bd66f7dafc9e";
        hash = "sha256-bNfcCBjvXkczPSrTCBKxsSrG2sINvYKGfO/8kRwhWvE=";
      };
    };
  });
  meta = {
    description = "Partial RMW shim library to instrument RMW API calls";
  };
})
