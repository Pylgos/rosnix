{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  rosbag2-test-common,
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_compression";
  version = "0.26.9-1";
  src = finalAttrs.passthru.sources."rosbag2_compression";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rcpputils rcutils rosbag2-cpp rosbag2-storage ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rcpputils rcutils rosbag2-cpp rosbag2-storage ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common rclcpp rosbag2-test-common test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_compression" = substituteSource {
      src = fetchgit {
        name = "rosbag2_compression-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "48f54674d5a8972fbdedeabdba56ab18556cd871";
        hash = "sha256-eFDyr1zjszoQ3MsPViwVnXaY07xn5p9xgy3kPhNuEtA=";
      };
    };
  });
  meta = {
    description = "Compression implementations for rosbag2 bags and messages.";
  };
})
