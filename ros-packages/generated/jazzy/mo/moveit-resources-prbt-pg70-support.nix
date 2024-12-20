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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_pg70_support";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-resources-prbt-ikfast-manipulator-plugin moveit-resources-prbt-moveit-config moveit-resources-prbt-support xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_pg70_support" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_pg70_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8547782a1bb72ef54066ea67349c97949078c25d";
        hash = "sha256-dC6rkXwi9QaH6q5W9mnMw/0xnUg+mhOp0PdtPiGLJzg=";
      };
    };
  });
  meta = {
    description = "PRBT support for Schunk pg70 gripper.";
  };
})
