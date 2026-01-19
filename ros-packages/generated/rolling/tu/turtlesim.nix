{
  ament-cmake,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  turtlesim-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlesim";
  version = "1.10.4-1";
  src = finalAttrs.passthru.sources."turtlesim";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp geometry-msgs rclcpp rclcpp-action std-msgs std-srvs turtlesim-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt6-core" "libqt6gui6t64" "qt6-base-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp geometry-msgs rclcpp rclcpp-action std-msgs std-srvs turtlesim-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt6-core" "libqt6gui6t64" "qt6-base-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlesim" = substituteSource {
      src = fetchgit {
        name = "turtlesim-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "a2e45697a359c4e2e32e3e746e9b7fb06605d717";
        hash = "sha256-VoTvCLWQ6Dtayrqg4eh7VNACbCvL75aePXG6yLlc9Wg=";
      };
    };
  });
  meta = {
    description = "\n    turtlesim is a tool made for teaching ROS and ROS packages.\n  ";
  };
})
