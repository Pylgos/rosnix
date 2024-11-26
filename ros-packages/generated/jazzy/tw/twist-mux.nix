{
  ament-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  twist-mux-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "twist_mux";
  version = "4.4.0-1";
  src = finalAttrs.passthru.sources."twist_mux";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-updater geometry-msgs rclcpp std-msgs twist-mux-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "twist_mux" = substituteSource {
      src = fetchgit {
        name = "twist_mux-source";
        url = "https://github.com/ros2-gbp/twist_mux-release.git";
        rev = "952b003bd94a38691186d613ebc1c7bc006fca47";
        hash = "sha256-LUjCjkOa8TZo6t3CRx4EEhpfJcZGcPNk3gRiEF4U1GY=";
      };
    };
  });
  meta = {
    description = "Twist multiplexer, which multiplex several velocity commands (topics) and allows to priorize or disable them (locks).";
  };
})
