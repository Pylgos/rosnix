{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  can-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros2-socketcan-msgs,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_can";
  version = "1.1.0-2";
  src = finalAttrs.passthru.sources."off_highway_can";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ can-msgs diagnostic-updater rclcpp ros2-socketcan-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs diagnostic-updater rclcpp ros2-socketcan-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_can" = substituteSource {
      src = fetchgit {
        name = "off_highway_can-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "2b6cd5d549ad0c9f25707daf5ebf769dc70b4fa5";
        hash = "sha256-6jJhlujXY/Rarn1mfG2CXohJOnayaxj8leDCXth2gzk=";
      };
    };
  });
  meta = {
    description = "The off_highway_can package";
  };
})
