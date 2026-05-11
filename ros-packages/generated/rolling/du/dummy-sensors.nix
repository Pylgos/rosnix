{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dummy_sensors";
  version = "0.38.0-1";
  src = finalAttrs.passthru.sources."dummy_sensors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "dummy_sensors" = substituteSource {
      src = fetchgit {
        name = "dummy_sensors-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "829339fa0b0edd899f27a8f8b74b245ff8744934";
        hash = "sha256-JFVlYy6QJjBXkBSlpi5wmyFifq3nTRpdnDN70mij3a0=";
      };
    };
  });
  meta = {
    description = "\n    dummy sensor nodes\n  ";
  };
})
