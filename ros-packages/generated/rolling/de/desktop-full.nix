{
  ament-cmake,
  buildAmentCmakePackage,
  desktop,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  perception,
  ros-gz-sim-demos,
  rosSystemPackages,
  simulation,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "desktop_full" = substituteSource {
      src = fetchgit {
        name = "desktop_full-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "094b48143f90959a5f19560e2256a99ad140bd07";
        hash = "sha256-+s6z0+4bXLNuEWFO5S3mDwdyz4GTUmJrRTxOwTLQqqI=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "desktop_full";
  version = "0.12.0-1";
  src = finalAttrs.passthru.sources."desktop_full";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ desktop perception ros-gz-sim-demos simulation ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Provides a 'batteries included' experience to novice users.";
  };
})
