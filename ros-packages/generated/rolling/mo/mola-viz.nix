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
  version = "1.8.1-1";
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
        rev = "61911fba0bb49e744029bcedfbfed10bfc5debf2";
        hash = "sha256-Uq/4DUNDSv0WeXY45Quofkst7z+b1hA3R5djiWbVJXA=";
      };
    };
  });
  meta = {
    description = "GUI for MOLA";
  };
})
