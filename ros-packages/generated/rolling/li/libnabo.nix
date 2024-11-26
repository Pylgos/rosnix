{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "libnabo";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."libnabo";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libnabo" = substituteSource {
      src = fetchgit {
        name = "libnabo-source";
        url = "https://github.com/ros2-gbp/libnabo-release.git";
        rev = "9e3e3ae45e0b4cb8d11edd4beabe849a5cdb393b";
        hash = "sha256-N2OmCLgobiplRxZeGlO7vZjCf68vvQms7EMT4yreN2c=";
      };
    };
  });
  meta = {
    description = "libnabo is a fast K Nearest Neighbour library for low-dimensional spaces.";
  };
})
