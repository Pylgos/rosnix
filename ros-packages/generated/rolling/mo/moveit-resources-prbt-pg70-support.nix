{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-resources-prbt-ikfast-manipulator-plugin,
  moveit-resources-prbt-moveit-config,
  moveit-resources-prbt-support,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_resources_prbt_pg70_support";
  version = "2.13.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_pg70_support";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-resources-prbt-ikfast-manipulator-plugin moveit-resources-prbt-moveit-config moveit-resources-prbt-support xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_pg70_support" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_pg70_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "9439d6617a22466ad06fbfb1989c2420abc0003d";
        hash = "sha256-9+0ahwRURN0E9uK/gKjkUFNaZzZ78jgYZMkHE5kr6qc=";
      };
    };
  });
  meta = {
    description = "PRBT support for Schunk pg70 gripper.";
  };
})
