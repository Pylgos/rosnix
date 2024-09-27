{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nav2_common,
  nav2_core,
  nav2_costmap_2d,
  nav2_msgs,
  nav2_util,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    nav2_constrained_smoother-52a83dce9691003caf0a377ec9a8eaf6429b3956 = substituteSource {
      src = fetchgit {
        name = "nav2_constrained_smoother-52a83dce9691003caf0a377ec9a8eaf6429b3956-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "52a83dce9691003caf0a377ec9a8eaf6429b3956";
        hash = "sha256-i6JL0yHKXGGnfgQ/RN9Y7TM/e+mqg/UACteF6y6TZxg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_constrained_smoother";
  version = "1.3.2-1";
  src = sources.nav2_constrained_smoother-52a83dce9691003caf0a377ec9a8eaf6429b3956;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles nav2_common nav2_core nav2_costmap_2d nav2_msgs nav2_util pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libceres-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Ceres constrained smoother";
  };
}
