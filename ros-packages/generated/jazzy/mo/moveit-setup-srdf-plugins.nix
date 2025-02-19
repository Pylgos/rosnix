{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-resources-fanuc-description,
  moveit-setup-framework,
  pluginlib,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_setup_srdf_plugins";
  version = "2.12.2-1";
  src = finalAttrs.passthru.sources."moveit_setup_srdf_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-setup-framework pluginlib ];
  checkInputs = [ ament-cmake-gtest moveit-resources-fanuc-description ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_srdf_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_srdf_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "6ada93aa5b81bd35b6bdbf5466ff2e08e2a417a4";
        hash = "sha256-3E0p3HSExWnwOVbXm0Dlwy/+i5df+N+cd+PcOAZummc=";
      };
    };
  });
  meta = {
    description = "SRDF-based plugins for MoveIt Setup Assistant";
  };
})
