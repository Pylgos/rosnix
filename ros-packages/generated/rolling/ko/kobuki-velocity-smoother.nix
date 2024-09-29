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
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "kobuki_velocity_smoother" = substituteSource {
      src = fetchgit {
        name = "kobuki_velocity_smoother-source";
        url = "https://github.com/ros2-gbp/kobuki_velocity_smoother-release.git";
        rev = "0971328fbfb8a822f3ec27da39218c6ec71f4803";
        hash = "sha256-kZmyem+NJit8xtwuRz5Zx8AkdojVm7/pxgSOR63CkcM=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "kobuki-velocity-smoother";
  version = "0.15.0-3";
  src = sources."kobuki_velocity_smoother";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl-build geometry-msgs nav-msgs rcl-interfaces rclcpp rclcpp-components ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto launch-testing launch-testing-ament-cmake launch-testing-ros ros2test ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-matplotlib" ]; };
  meta = {
    description = "Bound incoming velocity messages according to robot velocity and acceleration limits.";
  };
}
