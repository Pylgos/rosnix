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
  version = "1.3.1-1";
  src = finalAttrs.passthru.sources."tl_expected";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "tl_expected" = substituteSource {
      src = fetchgit {
        name = "tl_expected-source";
        url = "https://github.com/ros2-gbp/cpp_polyfills-release.git";
        rev = "54e2a13c2ce062aa0f47b1e23b80efaa82df8a03";
        hash = "sha256-/4gB1dIStSj5AXJHZB0Jkx+QD0Kf6hVxdEDctR4lst4=";
      };
    };
  });
  meta = {
    description = "C++11/14/17 std::expected with functional-style extensions";
  };
})
