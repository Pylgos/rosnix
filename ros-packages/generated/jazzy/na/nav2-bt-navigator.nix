{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  behaviortree-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-behavior-tree,
  nav2-common,
  nav2-core,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rclcpp-lifecycle,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_bt_navigator";
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."nav2_bt_navigator";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ behaviortree-cpp geometry-msgs nav2-behavior-tree nav2-common nav2-core nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-action rclcpp-lifecycle std-msgs std-srvs tf2-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_bt_navigator" = substituteSource {
      src = fetchgit {
        name = "nav2_bt_navigator-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "98da11c98a8d7c13ab9e42d4068d49fd12867f3f";
        hash = "sha256-URjqlVoG3x64u8FNP8RcTdZ9PrfPi+sa1eM6zzsDvf0=";
      };
    };
  });
  meta = {
    description = "Nav2 BT Navigator Server";
  };
})
