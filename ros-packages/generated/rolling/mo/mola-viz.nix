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
  version = "2.4.0-1";
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
        rev = "033917cc5652da9b30ad5c60a1b15557ccc94ead";
        hash = "sha256-/1ychmtiZIHQcpzb9NzFbui7+yyoqIUzRA5Dup8Q58M=";
      };
    };
  });
  meta = {
    description = "GUI for MOLA";
  };
})
