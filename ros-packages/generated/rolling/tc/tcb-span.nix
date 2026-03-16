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
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."tcb_span";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "tcb_span" = substituteSource {
      src = fetchgit {
        name = "tcb_span-source";
        url = "https://github.com/ros2-gbp/cpp_polyfills-release.git";
        rev = "7432988d7afbf3065f1f398d5b25717849ce3c02";
        hash = "sha256-JL+KincszmmKk0cO49b37KpPDtZs0x0ijmg23iPZMr4=";
      };
    };
  });
  meta = {
    description = "Implementation of C++20's std::span";
  };
})
