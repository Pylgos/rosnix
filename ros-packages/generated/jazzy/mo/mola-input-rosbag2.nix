{
  buildCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-kernel,
  mrpt-libobs,
  mrpt-libros-bridge,
  rosSystemPackages,
  rosbag2-cpp,
  sensor-msgs,
  substituteSource,
  tf2-geometry-msgs,
  tf2-msgs,
  tf2-ros,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_input_rosbag2";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."mola_input_rosbag2";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ cv-bridge mola-kernel mrpt-libobs mrpt-libros-bridge rosbag2-cpp sensor-msgs tf2-geometry-msgs tf2-msgs tf2-ros ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ cv-bridge mola-kernel mrpt-libobs mrpt-libros-bridge rosbag2-cpp sensor-msgs tf2-geometry-msgs tf2-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "mola_input_rosbag2" = substituteSource {
      src = fetchgit {
        name = "mola_input_rosbag2-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "a0755dcec68aaa2b2e5e7453fa8da1feb80d6a99";
        hash = "sha256-vEE/+cUk7GGIPhmZ/fS+LW5xn0zK8J1U5EyWaRC6ibI=";
      };
    };
  });
  meta = {
    description = "Offline RawDataSource from rosbag2 datasets";
  };
})
