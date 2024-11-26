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
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."moveit_runtime";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-core moveit-planners moveit-plugins moveit-ros-move-group moveit-ros-perception moveit-ros-planning moveit-ros-planning-interface moveit-ros-warehouse ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_runtime" = substituteSource {
        src = fetchgit {
          name = "moveit_runtime-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "32a8312a2e20c97bace391d9e22ee50145f3ffe2";
          hash = "sha256-5ymjMEdLHYJ9JxxIRz90pByEsJDF+2yV1WzH5TdDbic=";
        };
      };
    });
  };
  meta = {
    description = "moveit_runtime meta package contains MoveIt packages that are essential for its runtime (e.g. running MoveIt on robots).";
  };
})
