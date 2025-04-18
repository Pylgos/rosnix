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
  version = "1.6.0-1";
  src = finalAttrs.passthru.sources."autoware_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ autoware-common-msgs autoware-control-msgs autoware-localization-msgs autoware-map-msgs autoware-perception-msgs autoware-planning-msgs autoware-sensing-msgs autoware-system-msgs autoware-v2x-msgs autoware-vehicle-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "169929011c6db7799400e2e8ce9b98f53b4b859a";
        hash = "sha256-0uKH6uKiwwoDeOjbH8DrvurzFksnwSil9rfDX//jKqg=";
      };
    };
  });
  meta = {
    description = "Meta package for the autoware_msgs packages";
  };
})
