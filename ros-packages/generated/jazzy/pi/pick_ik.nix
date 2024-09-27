{
  ament_cmake_ros,
  buildRosPackage,
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
    Catch2-vendor_source-7818e2666d5cc7bb1d912acb22b68f6669b74520 = substituteSource {
      src = fetchgit {
        name = "Catch2-vendor_source-7818e2666d5cc7bb1d912acb22b68f6669b74520-source";
        url = "https://github.com/catchorg/Catch2.git";
        rev = "7818e2666d5cc7bb1d912acb22b68f6669b74520";
        hash = "sha256-IqTzKPR/RA1uphsr4n5/LfxJNS37I8IFRmMMF/DfBH0=";
      };
      substitutions = [
      ];
    };
    pick_ik-6dd0fb91beb17489e4511a811c4d55c6351e3eea = substituteSource {
      src = fetchgit {
        name = "pick_ik-6dd0fb91beb17489e4511a811c4d55c6351e3eea-source";
        url = "https://github.com/ros2-gbp/pick_ik-release.git";
        rev = "6dd0fb91beb17489e4511a811c4d55c6351e3eea";
        hash = "sha256-TKEKv9lclKHQqUyAVLAw2f8hI+p0lV4m8xLdNCeqBYA=";
      };
      substitutions = [
        {
          path = "cmake/FindCatch2.cmake";
          from = "GIT_REPOSITORY https://github.com/catchorg/Catch2.git";
          to = "URL ${Catch2-vendor_source-7818e2666d5cc7bb1d912acb22b68f6669b74520}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "pick_ik";
  version = "1.1.0-4";
  src = sources.pick_ik-6dd0fb91beb17489e4511a811c4d55c6351e3eea;
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
