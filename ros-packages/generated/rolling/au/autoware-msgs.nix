{
  ament-cmake,
  autoware-common-msgs,
  autoware-control-msgs,
  autoware-localization-msgs,
  autoware-map-msgs,
  autoware-perception-msgs,
  autoware-planning-msgs,
  autoware-sensing-msgs,
  autoware-simulation-msgs,
  autoware-system-msgs,
  autoware-v2x-msgs,
  autoware-vehicle-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_msgs";
  version = "1.12.0-1";
  src = finalAttrs.passthru.sources."autoware_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ autoware-common-msgs autoware-control-msgs autoware-localization-msgs autoware-map-msgs autoware-perception-msgs autoware-planning-msgs autoware-sensing-msgs autoware-simulation-msgs autoware-system-msgs autoware-v2x-msgs autoware-vehicle-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ autoware-common-msgs autoware-control-msgs autoware-localization-msgs autoware-map-msgs autoware-perception-msgs autoware-planning-msgs autoware-sensing-msgs autoware-simulation-msgs autoware-system-msgs autoware-v2x-msgs autoware-vehicle-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "47deafb7f6cafebaacf6f57b33e94714b7b40a21";
        hash = "sha256-/PCLBeCY1v2Ib8OcGLrB4woEymgJ5KnwkQAFRdlUzrk=";
      };
    };
  });
  meta = {
    description = "Meta package for the autoware_msgs packages";
  };
})
