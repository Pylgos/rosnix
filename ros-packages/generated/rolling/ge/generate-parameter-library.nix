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
let
  sources = mkSourceSet (sources: {
    "generate_parameter_library" = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "380ed9e0a0282e8bfc90367bbf20657902646799";
        hash = "sha256-3/xDuucYQUArz1x/C9LSjpYpCEX8i3QuApT+wUhylr0=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "generate_parameter_library";
  version = "0.3.8-3";
  src = finalAttrs.passthru.sources."generate_parameter_library";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ generate-parameter-library-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ parameter-traits rclcpp rclcpp-lifecycle rclpy rsl tcb-span tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "CMake to generate ROS parameter library.";
  };
})
