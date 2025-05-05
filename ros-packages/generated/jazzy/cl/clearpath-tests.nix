{
  ament-lint-auto,
  ament-lint-common,
  buildAmentPythonPackage,
  clearpath-config,
  clearpath-generator-common,
  clearpath-motor-msgs,
  clearpath-platform-msgs,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  simple-term-menu-vendor,
  std-msgs,
  substituteSource,
  tf-transformations,
  tf2-geometry-msgs,
  tf2-msgs,
  wireless-msgs,
  wrapRosQtAppsHook,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "clearpath_tests";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."clearpath_tests";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ clearpath-config clearpath-generator-common clearpath-motor-msgs clearpath-platform-msgs diagnostic-msgs geometry-msgs nav-msgs sensor-msgs simple-term-menu-vendor std-msgs tf2-geometry-msgs tf2-msgs tf-transformations wireless-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "can-utils" "stress" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_tests" = substituteSource {
      src = fetchgit {
        name = "clearpath_tests-source";
        url = "https://github.com/clearpath-gbp/clearpath_tests-release.git";
        rev = "97720b61b85cfc84e7d2f7aa7d24e517b9de8801";
        hash = "sha256-k2ujV0gXhk99KPQe1nvhHGd5RJtRVF1tcgP2QzKJQo0=";
      };
    };
  });
  meta = {
    description = "Clearpath Tests";
  };
})
