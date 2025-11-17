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
  version = "1.11.0-1";
  src = finalAttrs.passthru.sources."autoware_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ autoware-common-msgs autoware-control-msgs autoware-localization-msgs autoware-map-msgs autoware-perception-msgs autoware-planning-msgs autoware-sensing-msgs autoware-system-msgs autoware-v2x-msgs autoware-vehicle-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ autoware-common-msgs autoware-control-msgs autoware-localization-msgs autoware-map-msgs autoware-perception-msgs autoware-planning-msgs autoware-sensing-msgs autoware-system-msgs autoware-v2x-msgs autoware-vehicle-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "19851630361fc4dcf64442eb192700d4068c690b";
        hash = "sha256-2OMcMnLfCzvEFVXSDCpd4IJlw3U30CqYUvAQyUnngn4=";
      };
    };
  });
  meta = {
    description = "Meta package for the autoware_msgs packages";
  };
})
