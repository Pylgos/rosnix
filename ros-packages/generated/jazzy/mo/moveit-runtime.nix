{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-core,
  moveit-planners,
  moveit-plugins,
  moveit-ros-move-group,
  moveit-ros-perception,
  moveit-ros-planning,
  moveit-ros-planning-interface,
  moveit-ros-warehouse,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_runtime";
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_runtime";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-core moveit-planners moveit-plugins moveit-ros-move-group moveit-ros-perception moveit-ros-planning moveit-ros-planning-interface moveit-ros-warehouse ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_runtime" = substituteSource {
      src = fetchgit {
        name = "moveit_runtime-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "a3dc942b90bcf7fbc407be4c70eeda9d6637a612";
        hash = "sha256-LaYVi+R34WuKB0QwcSpQBwlw2Wk2jZNGBSr2z6xv8RE=";
      };
    };
  });
  meta = {
    description = "moveit_runtime meta package contains MoveIt packages that are essential for its runtime (e.g. running MoveIt on robots).";
  };
})
