{
  ament-cmake,
  autoware-common-msgs,
  autoware-control-msgs,
  autoware-localization-msgs,
  autoware-map-msgs,
  autoware-perception-msgs,
  autoware-planning-msgs,
  autoware-sensing-msgs,
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
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."autoware_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ autoware-common-msgs autoware-control-msgs autoware-localization-msgs autoware-map-msgs autoware-perception-msgs autoware-planning-msgs autoware-sensing-msgs autoware-system-msgs autoware-v2x-msgs autoware-vehicle-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "d09239010b78a8cf5dc7b854dfc1d3ec4757a0e4";
        hash = "sha256-jhK3UZ4HOrmve9GN0KmmpD2b2jXrYraYbfhSosQhnzk=";
      };
    };
  });
  meta = {
    description = "Meta package for the autoware_msgs packages";
  };
})
