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
  version = "3.13.1-2";
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
        rev = "b64aa73aa46a9f91e2530a53b33c1708104f4988";
        hash = "sha256-CuHrXm6YhKeJuIBK0b/zLDVt7BN9JRm59hSyE/lQ4Zs=";
      };
    };
  });
  meta = {
    description = "A ROS 2 package providing access to the HEBI C++ API.";
  };
})
