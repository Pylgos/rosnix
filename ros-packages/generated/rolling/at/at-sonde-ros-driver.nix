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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "at_sonde_ros_driver";
  version = "1.0.0-2";
  src = finalAttrs.passthru.sources."at_sonde_ros_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libmodbus-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libmodbus-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "at_sonde_ros_driver" = substituteSource {
      src = fetchgit {
        name = "at_sonde_ros_driver-source";
        url = "https://github.com/ros2-gbp/at_sonde_ros_driver-release.git";
        rev = "6a03b3b58c5cb40bbe2d080fe9958284622b9934";
        hash = "sha256-8x0Hty4JchTfD8YKkgnt52OZJWVfAOR+WnRSUmIvqUk=";
      };
    };
  });
  meta = {
    description = "A ROS 2 driver to stream the monitored parameters of an In-Situ Aqua TROLL Multiparameter Sonde.";
  };
})
