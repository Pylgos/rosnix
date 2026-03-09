{
  ament-cmake,
  ament-cmake-python,
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
  version = "0.7.0-1";
  src = finalAttrs.passthru.sources."generate_parameter_library";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ generate-parameter-library-py parameter-traits rclcpp rclcpp-lifecycle rclpy rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ generate-parameter-library-py parameter-traits rclcpp rclcpp-lifecycle rclpy rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  passthru.sources = mkSourceSet (sources: {
    "generate_parameter_library" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "d2d7e27a2bfa9020ffda7ed98d3ce11a8665fecd";
        hash = "sha256-SuXknwxPOgQWUIzVvTu3PtjK4d4Uny71nTDVgaHzi8g=";
      };
    };
  });
  meta = {
    description = "CMake to generate ROS parameter library.";
  };
})
