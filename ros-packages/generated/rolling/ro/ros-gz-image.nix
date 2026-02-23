{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-msgs-vendor,
  gz-transport-vendor,
  image-transport,
  mkSourceSet,
  rclcpp,
  ros-gz-bridge,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_gz_image";
  version = "3.0.6-1";
  src = finalAttrs.passthru.sources."ros_gz_image";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ gz-msgs-vendor gz-transport-vendor image-transport rclcpp ros-gz-bridge sensor-msgs ];
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ gz-msgs-vendor gz-transport-vendor image-transport rclcpp ros-gz-bridge sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ros_gz_image" = substituteSource {
      src = fetchgit {
        name = "ros_gz_image-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "9ab27740da536a963a630266d718c4909d52a7aa";
        hash = "sha256-RK9yRPxlhroyxMJUmMUqUtlWyETC/24ZheY9Ga7UT1s=";
      };
    };
  });
  meta = {
    description = "Image utilities for Gazebo simulation with ROS.";
  };
})
