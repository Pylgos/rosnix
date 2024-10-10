{
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  moveit-core,
  moveit-resources-panda-moveit-config,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rsl,
  substituteSource,
  tf2-geometry-msgs,
  tf2-kdl,
  tl-expected,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "pick_ik" = substituteSource {
      src = fetchgit {
        name = "pick_ik-source";
        url = "https://github.com/ros2-gbp/pick_ik-release.git";
        rev = "6dd0fb91beb17489e4511a811c4d55c6351e3eea";
        hash = "sha256-TKEKv9lclKHQqUyAVLAw2f8hI+p0lV4m8xLdNCeqBYA=";
      };
      substitutions = [
        {
          path = "cmake/FindCatch2.cmake";
          from = "GIT_REPOSITORY https://github.com/catchorg/Catch2.git";
          to = "URL ${sources."pick_ik/Catch2"}";
        }
      ];
    };
    "pick_ik/Catch2" = substituteSource {
      src = fetchgit {
        name = "Catch2-source";
        url = "https://github.com/catchorg/Catch2.git";
        rev = "7818e2666d5cc7bb1d912acb22b68f6669b74520";
        hash = "sha256-IqTzKPR/RA1uphsr4n5/LfxJNS37I8IFRmMMF/DfBH0=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "pick_ik";
  version = "1.1.0-4";
  src = finalAttrs.passthru.sources."pick_ik";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ generate-parameter-library moveit-core pluginlib rclcpp rsl tf2-geometry-msgs tf2-kdl tl-expected ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" "range-v3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ moveit-resources-panda-moveit-config ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Inverse Kinematics solver for MoveIt";
  };
})
