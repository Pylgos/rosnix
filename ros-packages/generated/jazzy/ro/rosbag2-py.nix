{
  ament-cmake-python,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pybind11-vendor,
  python-cmake-module,
  rcl-interfaces,
  rclpy,
  rosSystemPackages,
  rosbag2-compression,
  rosbag2-compression-zstd,
  rosbag2-cpp,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  rosbag2-test-common,
  rosbag2-test-msgdefs,
  rosbag2-transport,
  rosidl-runtime-py,
  rpyutils,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_py";
  version = "0.26.6-1";
  src = finalAttrs.passthru.sources."rosbag2_py";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros python-cmake-module ];
  propagatedNativeBuildInputs = [ rpyutils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dev" ]; };
  propagatedBuildInputs = [ pybind11-vendor rclpy rosbag2-compression rosbag2-cpp rosbag2-storage rosbag2-transport ];
  checkInputs = [ ament-lint-auto ament-lint-common rcl-interfaces rosbag2-compression-zstd rosbag2-storage-default-plugins rosbag2-test-common rosbag2-test-msgdefs rosidl-runtime-py std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_py" = substituteSource {
      src = fetchgit {
        name = "rosbag2_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "4e61b86eb7201df30ce3d6fc10983199e5d53710";
        hash = "sha256-9NG0UHn/Q29nQFiOwOBAn6rNNH44jvrYabQJjnlQ+Iw=";
      };
    };
  });
  meta = {
    description = "Python API for rosbag2";
  };
})
