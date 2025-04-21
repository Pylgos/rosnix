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
  version = "2.13.2-1";
  src = finalAttrs.passthru.sources."moveit_runtime";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-core moveit-planners moveit-plugins moveit-ros-move-group moveit-ros-perception moveit-ros-planning moveit-ros-planning-interface moveit-ros-warehouse ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_runtime" = substituteSource {
      src = fetchgit {
        name = "moveit_runtime-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "d9f5383fb1344b98f46df6385a160decbe3fd74c";
        hash = "sha256-KTD5WHR+qYUXH1aQQLH32hRfrffZgnuj7adIZX0gYXg=";
      };
    };
  });
  meta = {
    description = "moveit_runtime meta package contains MoveIt packages that are essential for its runtime (e.g. running MoveIt on robots).";
  };
})
