{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "tracetools_acceleration" = substituteSource {
      src = fetchgit {
        name = "tracetools_acceleration-source";
        url = "https://github.com/ros2-gbp/tracetools_acceleration-release.git";
        rev = "5b343e424887e2d3703364dad8973a5a1c578660";
        hash = "sha256-8S7qrZQ1ohJoEVhAiMPHVKAD4lCTHCfRb1CD5hu4VWg=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "tracetools_acceleration";
  version = "0.4.1-4";
  src = finalAttrs.passthru.sources."tracetools_acceleration";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "LTTng tracing provider wrapper for ROS 2 packages using hardware acceleration. Fork of tracetools to trace hardware acceleration in ROS 2.";
  };
})
