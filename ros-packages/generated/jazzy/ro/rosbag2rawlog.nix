{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libmaps,
  mrpt-libros-bridge,
  mrpt-msgs,
  nav-msgs,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2rawlog";
  version = "3.1.1-1";
  src = finalAttrs.passthru.sources."rosbag2rawlog";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto cv-bridge mrpt-libmaps mrpt-libros-bridge mrpt-msgs nav-msgs rosbag2-cpp sensor-msgs tf2-geometry-msgs tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cli11" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto cv-bridge mrpt-libmaps mrpt-libros-bridge mrpt-msgs nav-msgs rosbag2-cpp sensor-msgs tf2-geometry-msgs tf2-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "cli11" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbag2rawlog" = substituteSource {
      src = fetchgit {
        name = "rosbag2rawlog-source";
        url = "https://github.com/ros2-gbp/mrpt_ros_bridge-release.git";
        rev = "3374954beec6bbd498be8e8aa2aa1bc14bdc1da1";
        hash = "sha256-yj82rRfKydk8VugCbYHWxYXU0K13u1Tt+STMdrQ1AAs=";
      };
    };
  });
  meta = {
    description = "CLI tool to transform between rosbags and rawlogs.";
  };
})
