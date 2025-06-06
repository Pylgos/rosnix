{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  create3-examples-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  irobot-create-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "create3_coverage";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."create3_coverage";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ create3-examples-msgs geometry-msgs irobot-create-msgs nav-msgs rclcpp rclcpp-action tf2-geometry-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ create3-examples-msgs geometry-msgs irobot-create-msgs nav-msgs rclcpp rclcpp-action tf2-geometry-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "create3_coverage" = substituteSource {
      src = fetchgit {
        name = "create3_coverage-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "dadf03e2365f6d573bb83d0e85c2469915c8c12b";
        hash = "sha256-4DHaRyW3Yq9QCid1Dxl7TyuFlu6GmXp2hARv1WRiqZM=";
      };
    };
  });
  meta = {
    description = "C++ action server exposing a non-systematic coverage behavior";
  };
})
