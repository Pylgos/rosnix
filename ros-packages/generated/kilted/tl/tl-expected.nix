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
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."tl_expected";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "tl_expected" = substituteSource {
      src = fetchgit {
        name = "tl_expected-source";
        url = "https://github.com/ros2-gbp/cpp_polyfills-release.git";
        rev = "77e71060b053216509da99d16526e527824ca24d";
        hash = "sha256-AkIMppzWgc89jseE/1Glaf7vTzOyQciiZJJ/u+Jd4JA=";
      };
    };
  });
  meta = {
    description = "C++11/14/17 std::expected with functional-style extensions";
  };
})
