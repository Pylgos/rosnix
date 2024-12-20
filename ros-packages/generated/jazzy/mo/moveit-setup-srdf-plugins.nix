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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_setup_srdf_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-setup-framework pluginlib ];
  checkInputs = [ ament-cmake-gtest moveit-resources-fanuc-description ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_srdf_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_srdf_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "67efff39733cea221fb32eae7d3178595c243337";
        hash = "sha256-NJe79qBnd7czVEMYhx/IgcjpEw4Ov67jmkeOEUTHvVA=";
      };
    };
  });
  meta = {
    description = "SRDF-based plugins for MoveIt Setup Assistant";
  };
})
