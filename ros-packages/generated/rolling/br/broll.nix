{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rcutils,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "broll";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."broll";
  nativeBuildInputs = [ ament-cmake ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ rclcpp-components rcutils sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ffmpeg" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "broll" = substituteSource {
      src = fetchgit {
        name = "broll-source";
        url = "https://github.com/ros2-gbp/rosbag2_broll-release.git";
        rev = "e91404f991a4a59491d4e3d41bf403b605554573";
        hash = "sha256-V1yDu9I4lW4zxEBS6Hu+7/OWxqDxfrgqh8vSxZ2mdl4=";
      };
    };
  });
  meta = {
    description = "B-Roll utility library for interacting with video stream data in the context of rosbag2";
  };
})
