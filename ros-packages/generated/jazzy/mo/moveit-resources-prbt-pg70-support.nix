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
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_pg70_support";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-resources-prbt-ikfast-manipulator-plugin moveit-resources-prbt-moveit-config moveit-resources-prbt-support xacro ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_resources_prbt_pg70_support" = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_pg70_support-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0d7dc65a520a6a646c7de1e456c3b0ccef29c7ad";
        hash = "sha256-CgpCX46X7Jn+MZ1CcBJVlQ6JSZVQyM06D3W7C0Yc1rI=";
      };
    };
  });
  meta = {
    description = "PRBT support for Schunk pg70 gripper.";
  };
})
