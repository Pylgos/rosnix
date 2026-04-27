{
  ament-cmake,
  ament-cmake-pytest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-pytest,
  launch-ros,
  mkSourceSet,
  nav-msgs,
  rclpy,
  rosSystemPackages,
  rosbot-controller,
  rosbot-joy,
  rosbot-localization,
  rosbot-utils,
  sensor-msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_bringup";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."rosbot_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch launch-ros rosbot-controller rosbot-joy rosbot-localization rosbot-utils ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "micro_ros_agent" "tf_namespace_bridge" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch launch-ros rosbot-controller rosbot-joy rosbot-localization rosbot-utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "micro_ros_agent" "tf_namespace_bridge" ]; };
  checkInputs = [ ament-cmake-pytest launch launch-pytest launch-ros nav-msgs rclpy sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbot_bringup" = substituteSource {
      src = fetchgit {
        name = "rosbot_bringup-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "cb83e48a90d213b25052a70741b43d062629b524";
        hash = "sha256-ydO35En90m4lJ2ZxmrzjW+3ClH8R68s5L8zbj4YRkSk=";
      };
    };
  });
  meta = {
    description = "ROSbot Series bringup package";
  };
})
