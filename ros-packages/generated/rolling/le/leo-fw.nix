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
  version = "2.4.0-1";
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
        rev = "2db17e56f7d92d7835588b930f7d2b1d3a803e51";
        hash = "sha256-EmhHOpQiRlvu8YglufGa8xqu1357wj3+kSNAW1kJm7s=";
      };
    };
  });
  meta = {
    description = " Binary releases of Leo Rover firmware and related utilities ";
  };
})
