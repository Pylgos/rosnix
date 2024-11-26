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
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_resources_prbt_pg70_support";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-resources-prbt-ikfast-manipulator-plugin moveit-resources-prbt-moveit-config moveit-resources-prbt-support xacro ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_resources_prbt_pg70_support" = substituteSource {
        src = fetchgit {
          name = "moveit_resources_prbt_pg70_support-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "5321b978d890fdf94c055b8bf35f0d53b756c188";
          hash = "sha256-ChdyKCb3jx8wp4q/LC4M9me9rV6zIVHbqHsrZ0O8kmE=";
        };
      };
    });
  };
  meta = {
    description = "PRBT support for Schunk pg70 gripper.";
  };
})
