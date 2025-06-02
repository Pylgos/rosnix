{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "self_test";
  version = "4.4.6-1";
  src = finalAttrs.passthru.sources."self_test";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater rclcpp ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater rclcpp ros-environment ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "self_test" = substituteSource {
      src = fetchgit {
        name = "self_test-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "50e8655a7cc4228c2171284ad6eb1953d01b41ce";
        hash = "sha256-uH6w3bceThh3D22lJ8ffuDV5iF+2W6gDbzoCW6tQXgI=";
      };
    };
  });
  meta = {
    description = "self_test";
  };
})
