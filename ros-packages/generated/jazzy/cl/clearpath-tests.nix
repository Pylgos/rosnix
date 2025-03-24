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
  version = "0.2.9-1";
  src = finalAttrs.passthru.sources."clearpath_tests";
  nativeBuildInputs = [ wrapRosQtAppsHook ];
  propagatedBuildInputs = [ clearpath-config clearpath-generator-common clearpath-motor-msgs clearpath-platform-msgs diagnostic-msgs geometry-msgs nav-msgs rclpy sensor-msgs simple-term-menu-vendor std-msgs tf2-geometry-msgs tf2-msgs tf-transformations wireless-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "can-utils" "stress" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_tests" = substituteSource {
      src = fetchgit {
        name = "clearpath_tests-source";
        url = "https://github.com/clearpath-gbp/clearpath_tests-release.git";
        rev = "45bbf3100d166a51f4c72b4febe2c6e1af86a46a";
        hash = "sha256-ml+/3WSfJfJeuUJMjxKBtiCS82/SbbNYxJztR2uMQY4=";
      };
    };
  });
  meta = {
    description = "Clearpath Tests";
  };
})
