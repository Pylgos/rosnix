{
  ament-cmake,
  ament-cmake-python,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library-py,
  mkSourceSet,
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
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."generate_parameter_library";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ generate-parameter-library-py rclcpp rclcpp-lifecycle rclpy rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "libexpected-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ generate-parameter-library-py rclcpp rclcpp-lifecycle rclpy rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "libexpected-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "generate_parameter_library" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "ee482e72f17f8db226b6b0461505146ecc1c58ec";
        hash = "sha256-jXfB99neg7bdHEQHBHcfeReEcbKOx0oSEbiuWabmcDY=";
      };
    };
  });
  meta = {
    description = "CMake to generate ROS parameter library.";
  };
})
