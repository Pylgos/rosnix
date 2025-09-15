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
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."moveit_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-simple-controller-manager ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-simple-controller-manager ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_plugins" = substituteSource {
      src = fetchgit {
        name = "moveit_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8b1524fe1e8540fe2d2b960a25ee8a5e1a314a46";
        hash = "sha256-ebe+4QMaWnp3bsF3uf8Tyr0KkKqMqG+VrclmwVLrnhE=";
      };
    };
  });
  meta = {
    description = "Metapackage for MoveIt plugins.";
  };
})
