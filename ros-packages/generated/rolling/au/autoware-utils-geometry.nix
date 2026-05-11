{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-internal-planning-msgs,
  autoware-lint-common,
  autoware-utils-math,
  autoware-utils-system,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_geometry";
  version = "1.7.2-1";
  src = finalAttrs.passthru.sources."autoware_utils_geometry";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-internal-planning-msgs autoware-utils-math tf2 tf2-eigen tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-system-dev" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-internal-planning-msgs autoware-utils-math tf2 tf2-eigen tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-system-dev" ]; };
  checkInputs = [ ament-lint-auto autoware-lint-common autoware-utils-system ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_geometry" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_geometry-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "7ec80c13a89c7ae087f94547d3dc4efe6177297e";
        hash = "sha256-xlxxYwV91fy7zgE2ipTDgcSDzrg02nkzPzPcEIVVJyQ=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_geometry package";
  };
})
