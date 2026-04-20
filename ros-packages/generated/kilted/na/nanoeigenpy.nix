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
  version = "0.5.0-1";
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
        rev = "f1cde92b05fc3e47caf0c75057c72e4c14ced912";
        hash = "sha256-zvkEvgTYsxj00FeR3qLZCSy/hmfOW9E0GwAzXFv0kVc=";
      };
    };
  });
  meta = {
    description = "A support library for bindings between Eigen in C++ and Python, based on nanobind";
  };
})
