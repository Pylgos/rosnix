{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  octomap-msgs,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-rendering,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "octomap_rviz_plugins";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."octomap_rviz_plugins";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ octomap-msgs rclcpp rviz-common rviz-default-plugins rviz-rendering ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liboctomap-dev" "libqt6-core" "libqt6gui6t64" "libqt6widgets6t64" "qt6-base-dev" ]; };
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ octomap-msgs rclcpp rviz-common rviz-default-plugins rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" "libqt6-core" "libqt6gui6t64" "libqt6widgets6t64" "qt6-base-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "octomap_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "octomap_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/octomap_rviz_plugins-release.git";
        rev = "d67b10694abbb795353dc646fd96ee920e6f807e";
        hash = "sha256-JxEn9jOlvLN5SCdjn32KKdSVt5AyucXKj8xwf9UksX4=";
      };
    };
  });
  meta = {
    description = "\n     A set of plugins for displaying occupancy information decoded from binary octomap messages.\n  ";
  };
})
