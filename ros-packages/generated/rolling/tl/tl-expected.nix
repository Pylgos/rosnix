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
  version = "2.0.0-1";
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
        rev = "92fa3c7c7df7241cbf679b590055925e9c4603df";
        hash = "sha256-Z+DwkRO0PAgbkQg0LBDOGRJXkGzEF4mJJSoeRI+4CRY=";
      };
    };
  });
  meta = {
    description = "C++11/14/17 std::expected with functional-style extensions";
  };
})
