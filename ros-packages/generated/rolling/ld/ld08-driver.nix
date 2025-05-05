{
  ament-cmake,
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
  pname = "ld08_driver";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."ld08_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "libudev-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libudev-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ld08_driver" = substituteSource {
      src = fetchgit {
        name = "ld08_driver-source";
        url = "https://github.com/ros2-gbp/ld08_driver-release.git";
        rev = "85937ab0722e0b5a30c910bbf26e2fc0dd242a51";
        hash = "sha256-J13f9eQcZNX5WtvJwY+3h/6q+TFaLFAkqROAquApRlM=";
      };
    };
  });
  meta = {
    description = "\n    ROS package for LDS-02(LD08) Lidar.\n    The Lidar sensor sends data to the Host controller for the Simultaneous Localization And Mapping(SLAM).\n  ";
  };
})
