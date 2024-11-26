{
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-ros,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  ecl-build,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-testing,
  launch-testing-ament-cmake,
  launch-testing-ros,
  mkSourceSet,
  nav-msgs,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  ros2test,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kobuki_velocity_smoother";
  version = "0.15.0-4";
  src = finalAttrs.passthru.sources."kobuki_velocity_smoother";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build geometry-msgs nav-msgs rcl-interfaces rclcpp rclcpp-components ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto launch-testing launch-testing-ament-cmake launch-testing-ros ros2test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-matplotlib" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "kobuki_velocity_smoother" = substituteSource {
        src = fetchgit {
          name = "kobuki_velocity_smoother-source";
          url = "https://github.com/ros2-gbp/kobuki_velocity_smoother-release.git";
          rev = "7851383e06b59c96286db423f2e4db9287693ba9";
          hash = "sha256-kZmyem+NJit8xtwuRz5Zx8AkdojVm7/pxgSOR63CkcM=";
        };
      };
    });
  };
  meta = {
    description = "Bound incoming velocity messages according to robot velocity and acceleration limits.";
  };
})
