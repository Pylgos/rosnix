{
  ament-cmake,
  ament-cmake-black,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-mypy,
  ament-cmake-pep257,
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
  rcl-interfaces,
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
  version = "2.5.1-1";
  src = finalAttrs.passthru.sources."leo_fw";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ ament-index-python geometry-msgs leo-msgs nav-msgs rcl-interfaces rclcpp rclcpp-components rclpy ros2cli sensor-msgs std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-dbus" "python3-whichcraft" "python3-yaml" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ ament-index-python geometry-msgs leo-msgs nav-msgs rcl-interfaces rclcpp rclcpp-components rclpy ros2cli sensor-msgs std-msgs std-srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-dbus" "python3-whichcraft" "python3-yaml" ]; };
  checkInputs = [ ament-cmake-black ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-mypy ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_fw" = substituteSource {
      src = fetchgit {
        name = "leo_fw-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "8ce3a5134e9c44757fef07d3cb510ff9df577e6f";
        hash = "sha256-n/GzPVTMzuEoF1xcYYC8Uw9WNwZvnPDglyLeP+oZEfA=";
      };
    };
  });
  meta = {
    description = " Binary releases of Leo Rover firmware and related utilities ";
  };
})
