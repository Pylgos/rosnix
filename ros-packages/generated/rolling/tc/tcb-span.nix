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
  version = "1.0.2-4";
  src = finalAttrs.passthru.sources."tcb_span";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "tcb_span" = substituteSource {
      src = fetchgit {
        name = "tcb_span-source";
        url = "https://github.com/ros2-gbp/cpp_polyfills-release.git";
        rev = "6512481c861c90c5702c8baf994a281b9df9d022";
        hash = "sha256-61JrUYgWw+LJJmryzDfZte0H+hhzDbHqOY1wEyk996Q=";
      };
    };
  });
  meta = {
    description = "Implementation of C++20's std::span";
  };
})
