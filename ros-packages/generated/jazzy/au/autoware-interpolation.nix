{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-utils-geometry,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_interpolation";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_interpolation";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-utils-geometry geometry-msgs tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-utils-geometry geometry-msgs tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_interpolation" = substituteSource {
      src = fetchgit {
        name = "autoware_interpolation-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "dbf8e5b40b62c99c1dc6048cd8e7550debb06b5f";
        hash = "sha256-egre1dXJ9rlq5wIrelgb2JTImfzLiHFq7q1lO1otccQ=";
      };
    };
  });
  meta = {
    description = "The spline interpolation package";
  };
})
