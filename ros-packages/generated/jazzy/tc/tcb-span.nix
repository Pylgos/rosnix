{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tcb_span";
  version = "1.0.2-5";
  src = finalAttrs.passthru.sources."tcb_span";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "tcb_span" = substituteSource {
      src = fetchgit {
        name = "tcb_span-source";
        url = "https://github.com/ros2-gbp/cpp_polyfills-release.git";
        rev = "8995fcd50c0d65df37a701dac05b1d29f7db167e";
        hash = "sha256-61JrUYgWw+LJJmryzDfZte0H+hhzDbHqOY1wEyk996Q=";
      };
    };
  });
  meta = {
    description = "Implementation of C++20's std::span";
  };
})
