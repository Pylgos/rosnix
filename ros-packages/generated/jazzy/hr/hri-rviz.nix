{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  hri,
  hri-msgs,
  mkSourceSet,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hri_rviz";
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."hri_rviz";
  nativeBuildInputs = [ ament-cmake-auto wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge hri hri-msgs rclcpp rcpputils rviz-common rviz-default-plugins rviz-ogre-vendor sensor-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ cv-bridge hri hri-msgs rclcpp rcpputils rviz-common rviz-default-plugins rviz-ogre-vendor sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "hri_rviz" = substituteSource {
      src = fetchgit {
        name = "hri_rviz-source";
        url = "https://github.com/ros4hri/hri_rviz-release.git";
        rev = "f993c4d6cec8e9eea45c3a70e3634489fed65589";
        hash = "sha256-n2EX+KjmhK4ojTTucOd7/wYUSEJB9qm9uU4jnD8p5K8=";
      };
    };
  });
  meta = {
    description = "Set of rviz plugins for ROS4HRI data visualization";
  };
})
