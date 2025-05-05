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
  version = "1.6.4-1";
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
        rev = "44020176767cf2488742d49fe459f29fc9ce045f";
        hash = "sha256-HgwNw9cWZOL6gVafs38Y6tmW/hjXriP/arbIqEhLlrM=";
      };
    };
  });
  meta = {
    description = "GUI for MOLA";
  };
})
