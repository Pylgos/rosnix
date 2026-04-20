{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-clang-tidy,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  depthai,
  depthai-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raph_oak";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."raph_oak";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ depthai depthai-bridge generate-parameter-library rclcpp rclcpp-components sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ depthai depthai-bridge generate-parameter-library rclcpp rclcpp-components sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-clang-tidy ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "raph_oak" = substituteSource {
      src = fetchgit {
        name = "raph_oak-source";
        url = "https://github.com/ros2-gbp/raph_robot-release.git";
        rev = "c25ebef4e53a07aa0eef12b21b9d7874d58d4626";
        hash = "sha256-X8B5um4JlJUZUXMwsUSXiF29SEq1G01i+KITgwTz54A=";
      };
    };
  });
  meta = {
    description = "\n    Oak camera pipeline for Rapha Rover\n  ";
  };
})
