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
  version = "3.0.1-1";
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
        rev = "ca6ed76974e965cb02d0e9389775318ec2719f14";
        hash = "sha256-DtsWk5i6fldWLQ6VzxAsZwIS26Z/7Vt3H9cTJGzNUvg=";
      };
    };
  });
  meta = {
    description = "CLI tool to transform between rosbags and rawlogs.";
  };
})
