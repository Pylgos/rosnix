{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz2";
  version = "16.0.0-1";
  src = finalAttrs.passthru.sources."rviz2";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rviz-common rviz-default-plugins rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" "qt-base-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rviz-common rviz-default-plugins rviz-ogre-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "qt-base-dev" ]; };
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-pytest ament-lint-auto ament-lint-common geometry-msgs rclcpp sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rviz2" = substituteSource {
      src = fetchgit {
        name = "rviz2-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "2b0a07b8d409b0b5b6c81c3f75ebbbf9548d4586";
        hash = "sha256-nll8i5XQnGfnc9RLxsTReXHMFLgQZC0cu+Rxvygwsc4=";
      };
    };
  });
  meta = {
    description = "\n    3D visualization tool for ROS.\n  ";
  };
})
