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
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."opennav_docking_bt";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ behaviortree-cpp geometry-msgs nav2-behavior-tree nav2-core nav2-msgs nav2-util nav-msgs rclcpp rclcpp-action ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "opennav_docking_bt" = substituteSource {
      src = fetchgit {
        name = "opennav_docking_bt-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "0814d73bb22e368dd43985956a78a7b52fd6c17d";
        hash = "sha256-frMLzgC2iSME8tl1oAK7IHNH40NfmWg5yf5pONg3afE=";
      };
    };
  });
  meta = {
    description = "A set of BT nodes and XMLs for docking";
  };
})
