{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-simple-controller-manager,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_plugins";
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-simple-controller-manager ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "70d03dfa915614b02a7a8482d1a7bb5972a62b2f";
        hash = "sha256-P0u7MLWGi9SiVnd2N6ny/2aG6qqw+99U0DgVlXjBgF4=";
      };
    };
  });
  meta = {
    description = "Metapackage for MoveIt plugins.";
  };
})
