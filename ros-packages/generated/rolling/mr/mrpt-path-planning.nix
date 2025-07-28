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
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."mrpt_path_planning";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mrpt-libgui mrpt-libmaps mrpt-libnav mrpt-libtclap mvsim ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mrpt-libgui mrpt-libmaps mrpt-libnav mrpt-libtclap mvsim ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_path_planning" = substituteSource {
      src = fetchgit {
        name = "mrpt_path_planning-source";
        url = "https://github.com/ros2-gbp/mrpt_path_planning-release.git";
        rev = "c1fe4e4c0a5029be9a68996fa03a5aba761b8733";
        hash = "sha256-uJUiUPgE0GgXqYUnt8skVTee7/TqN0Eq1Ejcq4dBLbA=";
      };
    };
  });
  meta = {
    description = "Path planning and navigation algorithms for robots/vehicles moving on planar environments. This library builds upon mrpt-nav and the theory behind PTGs to generate libraries of \"motion primitives\" for vehicles with arbitrary shape and realistic kinematics and dynamics.";
  };
})
