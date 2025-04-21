{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fkie_message_filters";
  version = "3.0.2-1";
  src = finalAttrs.passthru.sources."fkie_message_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ image-transport rclcpp sensor-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-cmake-ros std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "fkie_message_filters" = substituteSource {
      src = fetchgit {
        name = "fkie_message_filters-source";
        url = "https://github.com/ros2-gbp/fkie_message_filters-release.git";
        rev = "d6132d729d42faa466c8e6c1100e48e5a566177a";
        hash = "sha256-L6CpU+tE7oIlwNw4kfMCj3p81PRfl/JCnARGeNEykbQ=";
      };
    };
  });
  meta = {
    description = "Improved ROS message filters";
  };
})
