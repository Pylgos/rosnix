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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-simple-controller-manager ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "3a4f2829779f333cf75ac440294149f00e8e481a";
        hash = "sha256-Jl/a+WQbe4CIk2eZDuU5yF6p76iygMsdh9u8BsfrWm4=";
      };
    };
  });
  meta = {
    description = "Metapackage for MoveIt plugins.";
  };
})
