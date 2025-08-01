{
  ament-cmake-gtest,
  ament-cmake-ros,
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
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_setup_srdf_plugins";
  nativeBuildInputs = [ ament-cmake-ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-setup-framework pluginlib ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ moveit-setup-framework pluginlib ];
  checkInputs = [ ament-cmake-gtest moveit-resources-fanuc-description ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_srdf_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_srdf_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "6fd07b914d4c21c8c58e2ccaaee6173db6944481";
        hash = "sha256-Xb5zYXmoMrtizHfpQcq92RP97dgpBXb2B0DPy89wnDU=";
      };
    };
  });
  meta = {
    description = "SRDF-based plugins for MoveIt Setup Assistant";
  };
})
