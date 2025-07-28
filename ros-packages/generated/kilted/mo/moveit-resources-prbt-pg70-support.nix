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
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_pg70_support";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-resources-prbt-ikfast-manipulator-plugin moveit-resources-prbt-moveit-config moveit-resources-prbt-support xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-resources-prbt-ikfast-manipulator-plugin moveit-resources-prbt-moveit-config moveit-resources-prbt-support xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_pg70_support" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_pg70_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "37603baef63e4f5313585a35982a9f7ffb411b36";
        hash = "sha256-gPNTRvQv6K+xXWQJPOjJ31U4bBEt/UHNSNjBW+NwD8c=";
      };
    };
  });
  meta = {
    description = "PRBT support for Schunk pg70 gripper.";
  };
})
