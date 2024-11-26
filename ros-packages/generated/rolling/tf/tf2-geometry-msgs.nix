{
  ament-cmake,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  orocos-kdl-vendor,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
  tf2-ros-py,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tf2_geometry_msgs";
  version = "0.39.3-1";
  src = finalAttrs.passthru.sources."tf2_geometry_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs orocos-kdl-vendor tf2 tf2-ros tf2-ros-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common rclcpp ];
  passthru = {
    sources = mkSourceSet (sources: {
      "tf2_geometry_msgs" = substituteSource {
        src = fetchgit {
          name = "tf2_geometry_msgs-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "8290ddc252c934f0f105df40faa7c9448b5c9cd2";
          hash = "sha256-4DWCfUM5hBgtQdZnRH9wnggsUoJes/0uKbWF7ZzqOSk=";
        };
      };
    });
  };
  meta = {
    description = "tf2_geometry_msgs";
  };
})
