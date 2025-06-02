{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-kernel,
  mrpt-libgui,
  mrpt-libmaps,
  mrpt-libopengl,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_viz";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."mola_viz";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-kernel mrpt-libgui mrpt-libmaps mrpt-libopengl ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-kernel mrpt-libgui mrpt-libmaps mrpt-libopengl ];
  passthru.sources = mkSourceSet (sources: {
    "mola_viz" = substituteSource {
      src = fetchgit {
        name = "mola_viz-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "ce109dfa6dc0efa375de285acf6f83872c288b8d";
        hash = "sha256-goxTIVVoMn4vucGfYYcJtWyPO0VO538xUZzhSOfNVPk=";
      };
    };
  });
  meta = {
    description = "GUI for MOLA";
  };
})
