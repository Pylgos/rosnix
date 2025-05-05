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
  propagatedNativeBuildInputs = [ diagnostic-updater geometry-msgs rclcpp std-msgs twist-mux-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-updater geometry-msgs rclcpp std-msgs twist-mux-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-xmllint ament-lint-auto ament-lint-common launch launch-testing launch-testing-ament-cmake launch-testing-ros ];
  passthru.sources = mkSourceSet (sources: {
    "twist_mux" = substituteSource {
      src = fetchgit {
        name = "twist_mux-source";
        url = "https://github.com/ros2-gbp/twist_mux-release.git";
        rev = "ba5494130539cd0907809dca963f0aa54514eb22";
        hash = "sha256-LUjCjkOa8TZo6t3CRx4EEhpfJcZGcPNk3gRiEF4U1GY=";
      };
    };
  });
  meta = {
    description = "\n      Twist multiplexer, which multiplex several velocity commands (topics) and\n      allows to priorize or disable them (locks).\n  ";
  };
})
