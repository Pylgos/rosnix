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
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."moveit_setup_srdf_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-setup-framework pluginlib ];
  checkInputs = [ ament-cmake-gtest moveit-resources-fanuc-description ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_setup_srdf_plugins" = substituteSource {
        src = fetchgit {
          name = "moveit_setup_srdf_plugins-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "eef18dc065fbc4059422a56a54d73a2c20c94ba4";
          hash = "sha256-6Wnil8AH3a2fhTU3NcfqkpSz/FyQyJysKBaoXCuZNSU=";
        };
      };
    });
  };
  meta = {
    description = "SRDF-based plugins for MoveIt Setup Assistant";
  };
})
