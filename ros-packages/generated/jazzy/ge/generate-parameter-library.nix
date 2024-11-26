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
  version = "0.3.9-1";
  src = finalAttrs.passthru.sources."generate_parameter_library";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ generate-parameter-library-py ];
  propagatedBuildInputs = [ parameter-traits rclcpp rclcpp-lifecycle rclpy rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "generate_parameter_library" = substituteSource {
        src = fetchgit {
          name = "generate_parameter_library-source";
          url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
          rev = "7e825abe9bfe9f6bcbd180053d28f37d7b055c9f";
          hash = "sha256-NXMcFX+gCyK3BtyHoRmZzIxZcjHN3efW0myqGkFz6xk=";
        };
      };
    });
  };
  meta = {
    description = "CMake to generate ROS parameter library.";
  };
})
