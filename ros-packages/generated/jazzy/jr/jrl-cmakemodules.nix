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
  pname = "jrl_cmakemodules";
  version = "1.1.0-2";
  src = finalAttrs.passthru.sources."jrl_cmakemodules";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "pkg-config" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "doxygen" "pkg-config" ]; };
  passthru.sources = mkSourceSet (sources: {
    "jrl_cmakemodules" = substituteSource {
      src = fetchgit {
        name = "jrl_cmakemodules-source";
        url = "https://github.com/ros2-gbp/jrl_cmakemodules-release.git";
        rev = "696585d1b2c2354ac414fece8b9bc051117e46ce";
        hash = "sha256-381sxyABl+4Dv10MzevXZGu3KWTIl9BfihvLepSgmBM=";
      };
    };
  });
  meta = {
    description = "CMake utility toolbox";
  };
})
