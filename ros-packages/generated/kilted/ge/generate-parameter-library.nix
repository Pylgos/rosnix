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
  version = "0.7.3-1";
  src = finalAttrs.passthru.sources."generate_parameter_library";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ generate-parameter-library-py parameter-traits rclcpp rclcpp-lifecycle rclpy rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" "libexpected-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ generate-parameter-library-py parameter-traits rclcpp rclcpp-lifecycle rclpy rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "libexpected-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "generate_parameter_library" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "2536d417f5531e6d049674266e1701ae752fdfcd";
        hash = "sha256-h/F4ejF/CZGjXP3CHcd8UrKmMi/JSpA6tPPvZDBuO4Y=";
      };
    };
  });
  meta = {
    description = "CMake to generate ROS parameter library.";
  };
})
