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
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_runtime";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-core moveit-planners moveit-plugins moveit-ros-move-group moveit-ros-perception moveit-ros-planning moveit-ros-planning-interface moveit-ros-warehouse ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-core moveit-planners moveit-plugins moveit-ros-move-group moveit-ros-perception moveit-ros-planning moveit-ros-planning-interface moveit-ros-warehouse ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_runtime" = substituteSource {
      src = fetchgit {
        name = "moveit_runtime-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0a1e710e62b0120ff453a3eb10a9aeb5a00057b0";
        hash = "sha256-KTD5WHR+qYUXH1aQQLH32hRfrffZgnuj7adIZX0gYXg=";
      };
    };
  });
  meta = {
    description = "moveit_runtime meta package contains MoveIt packages that are essential for its runtime (e.g. running MoveIt on robots).";
  };
})
