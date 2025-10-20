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
  version = "0.2.2-2";
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
        rev = "925b54b5751e0b2def392aa0bac52ba1a0140e7c";
        hash = "sha256-bNfcCBjvXkczPSrTCBKxsSrG2sINvYKGfO/8kRwhWvE=";
      };
    };
  });
  meta = {
    description = "Partial RMW shim library to instrument RMW API calls";
  };
})
