{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lanelet2-extension,
  autoware-lint-common,
  autoware-map-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  lanelet2-io,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_geography_utils";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_geography_utils";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-lanelet2-extension autoware-map-msgs geographic-msgs geometry-msgs lanelet2-io ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "geographiclib" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-lanelet2-extension autoware-map-msgs geographic-msgs geometry-msgs lanelet2-io ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_geography_utils" = substituteSource {
      src = fetchgit {
        name = "autoware_geography_utils-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "71a75aa61269055d0be4e52451ea8e04f9afa00b";
        hash = "sha256-FB1Xw5mxRH5y96yXiW0bg72lxwF8805H3uDi3HwtE1U=";
      };
    };
  });
  meta = {
    description = "The autoware_geography_utils package";
  };
})
