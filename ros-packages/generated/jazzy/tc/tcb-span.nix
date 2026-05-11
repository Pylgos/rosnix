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
  version = "1.3.1-1";
  src = finalAttrs.passthru.sources."tcb_span";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "tcb_span" = substituteSource {
      src = fetchgit {
        name = "tcb_span-source";
        url = "https://github.com/ros2-gbp/cpp_polyfills-release.git";
        rev = "0edf5f4861142c301b0cdae422f24b7420ad8e07";
        hash = "sha256-JvcfwpFzTo5sQ4rvnKfG3L0rVsTMKevc7nI/j1ATT94=";
      };
    };
  });
  meta = {
    description = "Implementation of C++20's std::span";
  };
})
