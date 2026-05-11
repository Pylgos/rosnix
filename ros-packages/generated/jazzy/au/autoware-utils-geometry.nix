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
        rev = "5b8fa57577d0152a85d910fd5806114b91e767ad";
        hash = "sha256-xlxxYwV91fy7zgE2ipTDgcSDzrg02nkzPzPcEIVVJyQ=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_geometry package";
  };
})
