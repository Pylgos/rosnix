{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-libgui,
  mrpt-libmaps,
  mrpt-libnav,
  mrpt-libtclap,
  mvsim,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mrpt_path_planning";
  version = "0.2.1-1";
  src = finalAttrs.passthru.sources."mrpt_path_planning";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mrpt-libgui mrpt-libmaps mrpt-libnav mrpt-libtclap mvsim ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mrpt_path_planning" = substituteSource {
        src = fetchgit {
          name = "mrpt_path_planning-source";
          url = "https://github.com/ros2-gbp/mrpt_path_planning-release.git";
          rev = "a865c44808b365e056cead017a67543f53aab4ee";
          hash = "sha256-V52VxqvC63eD9ptBBPpPUjp3X27m0HOdpwRQTvSL+Bc=";
        };
      };
    });
  };
  meta = {
    description = "Path planning and navigation algorithms for robots/vehicles moving on planar environments. This library builds upon mrpt-nav and the theory behind PTGs to generate libraries of \"motion primitives\" for vehicles with arbitrary shape and realistic kinematics and dynamics.";
  };
})
