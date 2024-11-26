{
  ament-cmake,
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
  pname = "ess_imu_driver2";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."ess_imu_driver2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ess_imu_driver2" = substituteSource {
        src = fetchgit {
          name = "ess_imu_driver2-source";
          url = "https://github.com/ros2-gbp/ess_imu_driver2-release.git";
          rev = "cd96c7f842ff20d14bb3896e6efec7b58106d6ca";
          hash = "sha256-EM4RYOYKegmjBi7Mh3OJERJwDyDgSXXuUP19v6tuaaQ=";
        };
      };
    });
  };
  meta = {
    description = "ROS2 package for Epson IMU using C++ wrapper around Linux C driver";
  };
})
