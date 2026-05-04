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
  pname = "osrf_testing_tools_cpp";
  version = "2.3.0-2";
  src = finalAttrs.passthru.sources."osrf_testing_tools_cpp";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "osrf_testing_tools_cpp" = substituteSource {
      src = fetchgit {
        name = "osrf_testing_tools_cpp-source";
        url = "https://github.com/ros2-gbp/osrf_testing_tools_cpp-release.git";
        rev = "85d980879cc40463878b9028de4cfcd09745d9d0";
        hash = "sha256-HDCWEfbkiF68HzE2hj1QR/Wk3/YdZSNbM/o5WECCH+8=";
      };
    };
  });
  meta = {
    description = "Testing tools for C++, and is used in various OSRF projects.";
  };
})
