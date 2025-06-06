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
  nav2-core,
  nav2-msgs,
  nav2-util,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "opennav_docking_bt";
  version = "1.3.7-1";
  src = finalAttrs.passthru.sources."opennav_docking_bt";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ behaviortree-cpp geometry-msgs nav2-behavior-tree nav2-core nav2-msgs nav2-util nav-msgs rclcpp rclcpp-action ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ behaviortree-cpp geometry-msgs nav2-behavior-tree nav2-core nav2-msgs nav2-util nav-msgs rclcpp rclcpp-action ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "opennav_docking_bt" = substituteSource {
      src = fetchgit {
        name = "opennav_docking_bt-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "8ee962735bb15acc5c958bff61630bd366687dd1";
        hash = "sha256-VHBvrk9aN4NR3+aJFiqP2AYZfo+Fiy9czAW8JdSpIaU=";
      };
    };
  });
  meta = {
    description = "A set of BT nodes and XMLs for docking";
  };
})
