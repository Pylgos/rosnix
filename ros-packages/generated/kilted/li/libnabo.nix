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
  version = "1.1.1-2";
  src = finalAttrs.passthru.sources."libnabo";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libnabo" = substituteSource {
      src = fetchgit {
        name = "libnabo-source";
        url = "https://github.com/ros2-gbp/libnabo-release.git";
        rev = "49d1a2614e6b772794b45ce1924bb9b6738092f0";
        hash = "sha256-N2OmCLgobiplRxZeGlO7vZjCf68vvQms7EMT4yreN2c=";
      };
    };
  });
  meta = {
    description = "\n		libnabo is a fast K Nearest Neighbour library for low-dimensional spaces.\n	";
  };
})
