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
  version = "1.5.1-1";
  src = finalAttrs.passthru.sources."mola_viz";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-kernel mrpt-libgui mrpt-libmaps mrpt-libopengl ];
  passthru.sources = mkSourceSet (sources: {
    "mola_viz" = substituteSource {
      src = fetchgit {
        name = "mola_viz-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "57b9c352e4465bf28f875416635ea451146f2a04";
        hash = "sha256-I2upFvcHDwR0IE6C6gmdH5O+O9CK9E7adJqAY1inDso=";
      };
    };
  });
  meta = {
    description = "GUI for MOLA";
  };
})
