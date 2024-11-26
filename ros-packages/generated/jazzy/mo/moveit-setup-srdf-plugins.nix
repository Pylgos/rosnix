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
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_setup_srdf_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-setup-framework pluginlib ];
  checkInputs = [ ament-cmake-gtest moveit-resources-fanuc-description ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_setup_srdf_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_setup_srdf_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "966f9f9255ac91a2abea818c45aeebeb6b7c433d";
        hash = "sha256-MFThaG7t1x9XbP+Y+w2dQF28A/I7Oiq0qD7PTQ8IFY0=";
      };
    };
  });
  meta = {
    description = "SRDF-based plugins for MoveIt Setup Assistant";
  };
})
