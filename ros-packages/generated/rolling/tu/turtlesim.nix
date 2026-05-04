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
  version = "1.10.8-2";
  src = finalAttrs.passthru.sources."turtlesim";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-cpp geometry-msgs rclcpp rclcpp-action std-msgs std-srvs turtlesim-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqtcore" "libqtgui" "qt-base-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp geometry-msgs rclcpp rclcpp-action std-msgs std-srvs turtlesim-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqtcore" "libqtgui" "qt-base-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlesim" = substituteSource {
      src = fetchgit {
        name = "turtlesim-source";
        url = "https://github.com/ros2-gbp/ros_tutorials-release.git";
        rev = "d9e4f77a5c2945a83fda89ff3d869c39d7faeb78";
        hash = "sha256-jtlVjsyjYm+3pV0P6/HoP++JdZESV9tUF7/KkA/pPEU=";
      };
    };
  });
  meta = {
    description = "\n    turtlesim is a tool made for teaching ROS and ROS packages.\n  ";
  };
})
