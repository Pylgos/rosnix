{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library-py,
  mkSourceSet,
  parameter-traits,
  rclcpp,
  rclcpp-lifecycle,
  rclpy,
  rosSystemPackages,
  rsl,
  substituteSource,
  tcb-span,
  tl-expected,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "generate_parameter_library";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."generate_parameter_library";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ generate-parameter-library-py ];
  propagatedBuildInputs = [ parameter-traits rclcpp rclcpp-lifecycle rclpy rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "generate_parameter_library" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "19b9e9376eca984d1ea4f16d195bd25bffa44d05";
        hash = "sha256-S0FqevWIS+jgTPXfXFYwz1TdcwIx+PDpbUlispHMHQM=";
      };
    };
  });
  meta = {
    description = "CMake to generate ROS parameter library.";
  };
})
