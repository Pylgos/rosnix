{
  ament_cmake_ros,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  moveit_core,
  moveit_resources_panda_moveit_config,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rsl,
  substituteSource,
  tf2_geometry_msgs,
  tf2_kdl,
  tl_expected,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pick_ik = substituteSource {
      src = fetchFromGitHub {
        name = "pick_ik-source";
        owner = "ros2-gbp";
        repo = "pick_ik-release";
        rev = "6dd0fb91beb17489e4511a811c4d55c6351e3eea";
        hash = "sha256-TKEKv9lclKHQqUyAVLAw2f8hI+p0lV4m8xLdNCeqBYA=";
      };
      substitutions = [
        {
          path = "cmake/FindCatch2.cmake";
          from = "GIT_REPOSITORY https://github.com/catchorg/Catch2.git";
          to = "URL ${pick_ik-vendor_source-Catch2-0}";
        }
      ];
    };
    pick_ik-vendor_source-Catch2-0 = substituteSource {
      src = fetchFromGitHub {
        name = "pick_ik-vendor_source-Catch2-0-source";
        owner = "catchorg";
        repo = "Catch2";
        rev = "7818e2666d5cc7bb1d912acb22b68f6669b74520";
        hash = "sha256-IqTzKPR/RA1uphsr4n5/LfxJNS37I8IFRmMMF/DfBH0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pick_ik";
  version = "1.1.0-4";
  src = sources.pick_ik;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ generate_parameter_library moveit_core pluginlib rclcpp rsl tf2_geometry_msgs tf2_kdl tl_expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "range-v3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ moveit_resources_panda_moveit_config ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Inverse Kinematics solver for MoveIt";
  };
}
