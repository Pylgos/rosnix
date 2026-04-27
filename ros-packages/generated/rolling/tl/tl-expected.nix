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
  pname = "tl_expected";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."tl_expected";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "libexpected-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "libexpected-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tl_expected" = substituteSource {
      src = fetchgit {
        name = "tl_expected-source";
        url = "https://github.com/ros2-gbp/cpp_polyfills-release.git";
        rev = "f8cc7ca768fc7f1107b8fce79103c1e744506d58";
        hash = "sha256-MPjq+sofzCMFCJAULl4XHfnuwAwWspmPV6DDEq9IScU=";
      };
    };
  });
  meta = {
    description = "C++11/14/17 std::expected with functional-style extensions";
  };
})
