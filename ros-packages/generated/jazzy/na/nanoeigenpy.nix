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
  pname = "nanoeigenpy";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."nanoeigenpy";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "doxygen" "eigen" "git" "nanobind-dev" "python3" "python3-numpy" "python3-scipy" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "doxygen" "eigen" "git" "nanobind-dev" "python3" "python3-numpy" "python3-scipy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nanoeigenpy" = substituteSource {
      src = fetchgit {
        name = "nanoeigenpy-source";
        url = "https://github.com/ros2-gbp/nanoeigenpy-release.git";
        rev = "c49d6ec9fc54b08b2e0267d01091b7fa46ffe6a5";
        hash = "sha256-wAdYGfyicoO/eGVJfTAroU3hG558LW5D6dYdHBYh+pg=";
      };
    };
  });
  meta = {
    description = "A support library for bindings between Eigen in C++ and Python, based on nanobind";
  };
})
