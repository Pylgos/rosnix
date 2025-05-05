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
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."rmw_stats_shim";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosgraph-monitor-msgs rosidl-runtime-cpp rosidl-typesupport-cpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_stats_shim" = substituteSource {
      src = fetchgit {
        name = "rmw_stats_shim-source";
        url = "https://github.com/ros2-gbp/graph_monitor-release.git";
        rev = "f3236e6b3f56801a630efb75cb36b271bd0c07ef";
        hash = "sha256-O9MprmH1xlkKPeu/m2lwM86n1EiZDcPA9UsvMCx1zME=";
      };
    };
  });
  meta = {
    description = "Partial RMW shim library to instrument RMW API calls";
  };
})
