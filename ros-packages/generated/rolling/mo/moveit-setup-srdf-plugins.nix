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
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_setup_srdf_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-setup-framework pluginlib ];
  checkInputs = [ ament-cmake-gtest moveit-resources-fanuc-description ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_srdf_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_srdf_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "ba20d1a5b87f235a93c18a6df87310d7d7974ecf";
        hash = "sha256-3ykuiQgjtcXD/f5Zc3KJV5nZpuL043itsiiCn7KyayQ=";
      };
    };
  });
  meta = {
    description = "SRDF-based plugins for MoveIt Setup Assistant";
  };
})
