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
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."osrf_testing_tools_cpp";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "osrf_testing_tools_cpp" = substituteSource {
      src = fetchgit {
        name = "osrf_testing_tools_cpp-source";
        url = "https://github.com/ros2-gbp/osrf_testing_tools_cpp-release.git";
        rev = "e94d28d9204aaa99a9fecb2c89ee7ef036002980";
        hash = "sha256-GHCiuzZYthRKxRHVY8TjyLq1Dl6VT5SGq5P7V/iPsPw=";
      };
    };
  });
  meta = {
    description = "Testing tools for C++, and is used in various OSRF projects.";
  };
})
