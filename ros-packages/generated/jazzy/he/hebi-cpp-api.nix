{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hebi_cpp_api";
  version = "3.12.3-1";
  src = finalAttrs.passthru.sources."hebi_cpp_api";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "hebi_cpp_api" = substituteSource {
      src = fetchgit {
        name = "hebi_cpp_api-source";
        url = "https://github.com/ros2-gbp/hebi_cpp_api-release.git";
        rev = "3d4b5d546776427b6c5e8e02518d8eb605cc79e6";
        hash = "sha256-v+ra/CBnZ80PQK3q8vSXgOpMbjhiJ0LSIGU+bwvn9BQ=";
      };
    };
  });
  meta = {
    description = "A ROS 2 package providing access to the HEBI C++ API.";
  };
})
