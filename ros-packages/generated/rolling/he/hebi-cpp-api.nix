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
  version = "3.16.0-2";
  src = finalAttrs.passthru.sources."hebi_cpp_api";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "hebi_cpp_api" = substituteSource {
      src = fetchgit {
        name = "hebi_cpp_api-source";
        url = "https://github.com/ros2-gbp/hebi_cpp_api-release.git";
        rev = "2a7f94337c7adffa31e3b390f013a6ef7b0885c6";
        hash = "sha256-oP3CRGt060tcfziESn5ul0Dju+kzKGzGDnXGdKQXbNo=";
      };
    };
  });
  meta = {
    description = "A ROS 2 package providing access to the HEBI C++ API.";
  };
})
