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
  version = "2.11.0-1";
  src = finalAttrs.passthru.sources."moveit_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ moveit-simple-controller-manager ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_plugins" = substituteSource {
        src = fetchgit {
          name = "moveit_plugins-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "866046185e0c290aa1a169664735a4c8d9f76e79";
          hash = "sha256-aFhpDj64VCxU9CzCr8Z70DSnww9CzhF40K3UnMpPhGg=";
        };
      };
    });
  };
  meta = {
    description = "Metapackage for MoveIt plugins.";
  };
})
