{
  ament-cmake,
  ament-cmake-black,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-mypy,
  ament-cmake-python,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-index-python,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  leo-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rclpy,
  ros2cli,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_fw";
  version = "2.1.1-1";
  src = finalAttrs.passthru.sources."leo_fw";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-index-python geometry-msgs leo-msgs nav-msgs rclcpp rclcpp-components rclpy ros2cli sensor-msgs std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dbus" "python3-whichcraft" "python3-yaml" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-python geometry-msgs leo-msgs nav-msgs rclcpp rclcpp-components rclpy ros2cli sensor-msgs std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dbus" "python3-whichcraft" "python3-yaml" ]; };
  checkInputs = [ ament-cmake-black ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-mypy ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_fw" = substituteSource {
      src = fetchgit {
        name = "leo_fw-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "9376056b92bd80fa27797670ab71dfc5fbb01540";
        hash = "sha256-YuPV8iYBVjVw3f9qLJyzjG3keP8nl2b0ichXQWzGuxw=";
      };
    };
  });
  meta = {
    description = " Binary releases of Leo Rover firmware and related utilities ";
  };
})
