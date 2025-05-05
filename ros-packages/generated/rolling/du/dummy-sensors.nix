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
  version = "0.37.0-1";
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
        rev = "d7e7e10c4a74bb61f185d7df72c048ff339428b2";
        hash = "sha256-ae96qiWSgVySE5ssFPmAGQ9WsIUkuxZs65nZgKgxkNA=";
      };
    };
  });
  meta = {
    description = "\n    dummy sensor nodes\n  ";
  };
})
