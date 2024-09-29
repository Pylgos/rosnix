{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit_resources_fanuc_description,
  moveit_setup_framework,
  pluginlib,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_setup_srdf_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_srdf_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "966f9f9255ac91a2abea818c45aeebeb6b7c433d";
        hash = "sha256-MFThaG7t1x9XbP+Y+w2dQF28A/I7Oiq0qD7PTQ8IFY0=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_setup_srdf_plugins";
  version = "2.10.0-1";
  src = sources."moveit_setup_srdf_plugins";
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ moveit_setup_framework pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest moveit_resources_fanuc_description ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "SRDF-based plugins for MoveIt Setup Assistant";
  };
}