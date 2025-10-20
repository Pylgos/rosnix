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
        rev = "16a45e1c2bbf12c2b74a940a7d1777d655e12e87";
        hash = "sha256-bNfcCBjvXkczPSrTCBKxsSrG2sINvYKGfO/8kRwhWvE=";
      };
    };
  });
  meta = {
    description = "Partial RMW shim library to instrument RMW API calls";
  };
})
